const fs = require("fs")
const path = require("path")

const { tokenize } = require("./tokenizer")
const { parseBlocks } = require("./blockParser")
const { resolveReferences } = require("./referenceLinker")
const { parseInline } = require("./inlineParser")
const { loadAndMergeImports } = require("./loader")

function parseFile(filename, options = {}) {
  if (!fs.existsSync(filename)) {
    throw new Error(`File not found: ${filename}`)
  }

  const raw = fs.readFileSync(filename, "utf8")
  const tokens = tokenize(raw)
  let ast = parseBlocks(tokens, options)

  ast = loadAndMergeImports(ast, path.dirname(filename), options)

  ast = resolveReferences(ast, options)
  ast = parseInline(ast, options)

  return ast
}

module.exports = { parseFile }
