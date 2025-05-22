module.exports = function renderJSON(ast, options = {}) {
  return JSON.stringify(ast, null, 2)
}
