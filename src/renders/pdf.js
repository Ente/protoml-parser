const puppeteer = require('puppeteer')
const renderHTML  = require('./html')
const loadTheme = require('./html').loadTheme
const deasync = require('deasync')

function renderPDF(ast, options = {}) {
  const html = renderHTML(ast, options)

  let done = false
  let result = null
  let error = null

  ;(async () => {
    try {
      const browser = await puppeteer.launch({ headless: 'new' })
      const page = await browser.newPage()
      await page.setContent(html, { waitUntil: 'networkidle0' })
      result = await page.pdf({ format: 'A4' })
      await browser.close()
    } catch (err) {
      error = err
    } finally {
      done = true
    }
  })()

  deasync.loopWhile(() => !done)

  if (error) throw error
  return result
}

module.exports = renderPDF
