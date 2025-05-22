function resolveReferences(ast, options = {}) {
  const get = (group, id) => {
    if (!ast[group] || !ast[group][id]) {
      if (options.strict)
        throw new Error(`Unresolved reference @${group}=${id}`);
      return { id, unresolved: true };
    }
    return { id, ...ast[group][id] };
  };

  const expandMacros = (block) => {
    return block.flatMap((line) => {
      const match = line.match(/@@macro=([\w-]+):(.*)/);
      if (!match || !ast._macroCache) return [line];

      const [_, macroName, rawParams] = match;
      const template = ast._macroCache[macroName];
      if (!template) return [line];

      const params = {};
      rawParams.split(";").forEach((p) => {
        const [k, v] = p.split("=");
        params[k.trim()] = v.trim();
      });

      const rendered = template.replace(/\{\{(.*?)\}\}/g, (_, key) => {
        const val = params[key] || "";
        if (val.startsWith("@@e=")) {
          const id = val.slice(5);
          return ast.subjects?.[id]
            || ast.participants?.[id]?.name
            || ast.tags?.[id]
            || id;
        }
        return val;
      });

      return [rendered];
    });
  };

  if (Array.isArray(ast.tasks)) {
    ast.tasks = ast.tasks.map((task) => {
      const out = { ...task };

      const ptpMatch = task.raw.match(/@ptp=([^\s]+)/);
      const subjMatch = [...task.raw.matchAll(/(?:\s|^)=([^\s]+)/g)].pop();
      const tagMatch = task.raw.match(/@tag=([^\s]+)/);

      if (ptpMatch) out.assigned_to = get("participants", ptpMatch[1]);
      if (subjMatch) out.subject = get("subjects", subjMatch[1]);
      if (tagMatch) out.tag = get("tags", tagMatch[1]);

      return out;
    });
  }

  if (Array.isArray(ast.meeting)) {
    ast.meeting = ast.meeting
      .map((line) => {
        const echoMatches = [...line.matchAll(/@@e=([^\s]+)/g)];
        let resolved = line;

        for (const match of echoMatches) {
          const id = match[1];
          let replacement = id;

          if (ast.subjects?.[id]) {
            replacement = ast.subjects[id];
          } else if (ast.participants?.[id]) {
            replacement = ast.participants[id].name;
          } else if (ast.tags?.[id]) {
            replacement = ast.tags[id];
          } else if (options.strict) {
            throw new Error(`@@e=${id} not found`);
          }

          resolved = resolved.replace(match[0], replacement);
        }

        return resolved;
      });

    ast.meeting = expandMacros(ast.meeting);
  }

  return ast;
}



module.exports = {resolveReferences};
