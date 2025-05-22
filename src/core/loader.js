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

module.exports = { loadAndMergeImports }
