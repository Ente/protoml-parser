const { tokenize } = require('../src/core/tokenizer.js');
const { parseBlocks } = require('../src/core/blockParser.js');
const { resolveReferences } = require('../src/core/referenceLinker.js');
const { parseInline } = require('../src/core/inlineParser.js');
const renderHTML = require('../src/renders/html.js');

function parseTextToHTML(source) {
  const tokens = tokenize(source);
  let ast = parseBlocks(tokens);
  ast = resolveReferences(ast);
  ast = parseInline(ast);
  return renderHTML(ast, { skipTheme: 1});
}

module.exports = { parseTextToHTML };
