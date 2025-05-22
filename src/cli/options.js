function parseArgs(argv = process.argv.slice(2)) {
  const options = {
    filename: null,
    format: null,
    output: null,
    verbosity: 0,
    strict: false,
    theme: null,
  }

  const positional = []

  for (const arg of argv) {
    if (arg.startsWith("-v")) {
      options.verbosity = arg.length - 1 // -v, -vv, -vvv = 1–3
    } else if (arg.startsWith("-output=")) {
      options.output = arg.split("=")[1]
    } else if (arg.startsWith("-theme=")) {
      options.theme = arg.split("=")[1]
    } else if (arg === "-strict") {
      options.strict = true
    } else if (arg === "--help") {
      printHelp()
      process.exit(0)
    } else if (arg === "--version"){
      // read from package.json as JSON
      const fs = require("fs")
      const path = require("path")
      const packageJsonPath = path.join(__dirname, "..", "..", "package.json")
      const packageJson = JSON.parse(fs.readFileSync(packageJsonPath, "utf8"))
      const version = packageJson.version
      printVersion(version)
      process.exit(0)
    } else {
      positional.push(arg)
    }
  }

  if (positional.length >= 1) options.filename = positional[0]
  if (positional.length >= 2) options.format = positional[1]

  if (!options.filename || options.filename.startsWith("-")) {
    console.error("[X] No valid input file provided.")
    printHelp()
    process.exit(1)
  }

  if (!options.format) {
    options.format = "json"
  }

  if (!options.output) {
    options.output = options.filename.replace(/\.[^/.]+$/, "")
  }

  return options
}



function printHelp() {
  console.log(`
Usage:
  protoparser [options] <filename> <format>

Options:
  -v, -vv, -vvv          Set verbosity level (1–3)
  -output=<filename>     Set output base name (without extension)
  -theme=<name>          Apply export theme (HTML/PDF only)
  -strict                Enable strict parsing
  --help                 Show this help
  --version              Show version information

Examples:
  protoparser Meeting.pml json
  protoparser -vv -output=notes Meeting.pml html
`)
}

function printVersion(version) {
  console.log(`Protoparser version: ${version}`)
}

module.exports = { parseArgs }
