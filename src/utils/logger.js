const LEVELS = {
  error: 0,
  info: 1,
  debug: 2,
  trace: 3,
}

let currentLevel = LEVELS.info

function setVerbosity(v) {
  currentLevel = Math.min(v, 3)
}

function log(level, msg) {
  if (LEVELS[level] <= currentLevel) {
    const prefix = {
      error: "❌",
      info:  "ℹ️ ",
      debug: "🔍",
      trace: "📎"
    }[level] || ""
    console.log(`${prefix} ${msg}`)
  }
}

module.exports = {
  log,
  setVerbosity,
}
