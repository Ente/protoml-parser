const fs = require("fs");
const path = require("path");

function loadTheme(themeName) {
  const themePath = path.join(
    __dirname,
    "./themes",
    `${themeName || "default"}.css`
  );
  try {
    return fs.readFileSync(themePath, "utf8");
  } catch (err) {
    console.warn(`⚠️ Theme "${themeName}" not found. Using default.`);
    return fs.readFileSync(
      path.join(__dirname, "./themes/default.css"),
      "utf8"
    );
  }
}

function escape(text) {
  return String(text).replace(
    /[&<>"']/g,
    (c) =>
      ({
        "&": "&amp;",
        "<": "&lt;",
        ">": "&gt;",
        '"': "&quot;",
        "'": "&#039;",
      }[c])
  );
}

function renderHTML(ast, options = {}) {
  const css = loadTheme(options.theme);

  const html = [];

  html.push(`<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Protocol – ${escape(ast.meta?.date || "Untitled")}</title>
  <style>${css}</style>
</head>
<body>`);

  html.push(`<h1>Protocol – ${escape(ast.meta?.date || "unknown")}</h1>`);

  // Participants
  if (ast.participants) {
    html.push(`<section><h2>Participants</h2><ul>`);
    for (const id in ast.participants) {
      const p = ast.participants[id];
      html.push(`<li>${escape(p.name)} (${escape(p.alias || id)})</li>`);
    }
    html.push(`</ul></section>`);
  }

  // Subjects
  if (ast.subjects) {
    html.push(`<section><h2>Subjects</h2><ul>`);
    for (const id in ast.subjects) {
      html.push(`<li><b>${id}:</b> ${ast.subjects[id]}</li>`);
    }
    html.push(`</ul></section>`);
  }

  // Tasks
  if (ast.tasks?.length) {
    html.push(`<section><h2>Tasks</h2><ul>`);
    for (const task of ast.tasks) {
      const cls = task.done ? "done" : "";
      let extra = [];

      // Teilnehmer anzeigen
      if (task.meta?.ptp && ast.participants?.[task.meta.ptp]) {
        const p = ast.participants[task.meta.ptp];
        extra.push(`Assigned to: ${escape(p.name)}`);
      }

      // Subject anzeigen
      if (task.meta?.subject && ast.subjects?.[Number(task.meta.subject)]) {
        extra.push(
          `Subject: ${escape(ast.subjects[Number(task.meta.subject)])}`
        );
      }

      // Tag anzeigen
      if (task.meta?.tag && ast.tags?.[task.meta.tag]) {
        extra.push(
          `Tag: <span class="tag">${escape(ast.tags[task.meta.tag])}</span>`
        );
      }

      const metaInfo = extra.length
        ? `<div class="meta">${extra.join(" • ")}</div>`
        : "";

      html.push(`<li class="${cls}">${task.text}${metaInfo}</li>`);
    }
    html.push(`</ul></section>`);
  }

  // Notes
  if (ast.notes?.length) {
    html.push(`<section><h2>Notes</h2><ul>`);
    for (const note of ast.notes) {
      html.push(`<li>${note}</li>`);
    }
    html.push(`</ul></section>`);
  }

  // Meeting Text
  if (ast.meeting?.length) {
    html.push(`<section><h2>Rendered Meeting</h2>`);
    for (const line of ast.meeting) {
      html.push(`<p>${line}</p>`);
    }
    html.push(`</section>`);
  }

  html.push(`</body></html>`);
  return html.join("\n");
}

module.exports = renderHTML;
