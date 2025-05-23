const { app, BrowserWindow } = require("electron");
const renderHTML  = require("../src/renders/html");
const { parseFile } = require("../src/core/parser.js");
const th = process.argv[3] || "default";
const ast = parseFile(process.argv[2], {theme: th});

const html = renderHTML(ast);

app.whenReady().then(() => {
  const win = new BrowserWindow({
    width: 1000,
    height: 800,
    webPreferences: {
      contextIsolation: true
    }
  });

  win.loadURL("data:text/html;charset=UTF-8," + encodeURIComponent(html));
});
