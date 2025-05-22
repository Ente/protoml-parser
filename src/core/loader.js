const fs = require("fs")
const path = require("path")
const { tokenize } = require("./tokenizer")
const { parseBlocks } = require("./blockParser")

function loadAndMergeImports(mainAst, basePath, options = {}) {
  if (!mainAst || typeof mainAst !== "object") return mainAst

  const importLines = findTagImports(mainAst)

  for (const importFile of importLines) {
    const fullPath = path.resolve(basePath, importFile)

    if (!fs.existsSync(fullPath)) {
      if (options.strict) throw new Error(`Import file not found: ${fullPath}`)
      else continue
    }

    const raw = fs.readFileSync(fullPath, "utf8")
    const tokens = tokenize(raw)
    const importedAst = parseBlocks(tokens, options)

    // Merge relevant blocks (tags, participants, subjects…)
    for (const key in importedAst) {
      if (!mainAst[key]) mainAst[key] = {}
      if (typeof importedAst[key] === "object" && !Array.isArray(importedAst[key])) {
        mainAst[key] = { ...importedAst[key], ...mainAst[key] } // imported gets overridden by main
      }
    }
  }

  return mainAst
}

function findTagImports(ast) {
  if (!ast || !ast.tags_import) return []

  const lines = Array.isArray(ast.tags_import) ? ast.tags_import : [ast.tags_import]

  return lines
    .map(line => line.match(/@tags_import\s+"(.+?)"/))
    .filter(Boolean)
    .map(match => match[1])
}

const macroCache = {}

function loadAndMergeMacros(ast, basePath, options = {}) {
  if (!ast.macros) return ast

  for (const name in ast.macros) {
    const file = ast.macros[name]
    const fullPath = path.join(basePath, file.replace(/\"/g, ""))

    if (!fs.existsSync(fullPath)) continue
    const lines = fs.readFileSync(fullPath, "utf8").split(/\r?\n/)

    let macroName = null
    let templateLines = []
    let inTemplate = false

    for (const line of lines) {
      if (line.startsWith("=name:")) {
        macroName = line.slice(6).trim()
      } else if (line.startsWith("=template:")) {
        inTemplate = true
        const rest = line.slice(10).trim()
        if (rest) templateLines.push(rest)
      } else if (inTemplate && (line.startsWith("@") || line.startsWith("="))) {
        // Stop reading template
        inTemplate = false
      } else if (inTemplate) {
        templateLines.push(line)
      }
    }

    if (macroName && templateLines.length) {
      macroCache[macroName] = templateLines.join("\n")
    }
  }

  ast._macroCache = macroCache
  return ast
}



module.exports = { loadAndMergeImports, loadAndMergeMacros }
