#!/usr/bin/env node
const { log, setVerbosity } = require("../src/utils/logger.js")
const { parseArgs } = require("../src/cli/options.js");
const { parseFile } = require("../src/core/parser.js");
const { saveToFile } = require("../src/utils/file.js");
const renderers = require("../src/renders/index.js");

const args = parseArgs()
setVerbosity(args.verbosity)
const ast = parseFile(args.filename, args)
const output = renderers[args.format](ast, args)

saveToFile(args.output, output, args.format)
log("info", `File saved to ${args.output}.${args.format}`)	
