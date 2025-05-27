@help
=name:meeting
=docs:
The `@meeting` module is used to structure and document meetings within a ProtoML file.  
It is ideal for creating meeting protocols, agendas, discussion points, and decisions – especially when combined with modules like `@participants`, `@subjects`, `@tasks`, and `@notes`.

You can use `@@e=...` to dynamically insert previously defined entries (like subjects or participants), and `@@macro=...` to embed macros directly into your meeting notes.

The layout typically follows a Markdown-style syntax (`#`, `##`, `-`, etc.) for readability and export formatting.

=examples:
@meeting
# Meeting Title: @@e=0              // echoes subject ID 0 from @subjects
## Participants
@@e=pt1 , @@e=pt2                   // echoes registered participants
## Topics
@@macro=myMacro:title=IMPORTANT;text=@@e=1  // inserts macro with dynamic subject text
...
