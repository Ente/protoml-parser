# ProtoML - A minimal structured protocol language

ProtoML is a lightweight, declarative markup language designed for writing and structuring meeting protocols, notes and task lists in a human-readable and machine-parseable format.

## Installing the Parser

- Clone the repository: `git clone https://github.com/ente/protoml-parser.git`
- Install the app: `npm install -g .`
- Restart your terminal
- Run `protoparser test.pml html` to convert a file named `test.pml` to HTML.

## Key Concepts

- **Purely declarative** - no logic, no runtime, just the code
- **Flat structure** with modular references
- **External resources** such as tags or files are importable
- **Styling & referencing syntax** included
- **Fully parsable into structured JSON, HTML or PDF files**

## Syntax Overview
| Symbol | Meaning |
| ------ | ------- |
| `@command` | Starts a data block (e.g. `@participants`) |
| `@@command` | Used inside `@meeting`, acts as inline macro |
| `=` | Declare an ID for referencing |
| `:` | Assigns value to the declared ID |
| `-` | Declares a plain list entry |
| `#`, `##` | Markdown-style headers |
| `//` | Comment, ignored by parser |
| `-b Text -b-`, `-i Text -i-`, `-a=url Text -a-` | Inline text styling |

## Example
```plaintext
@tags_import "tags.pml"
@macro myMacro "myMacro.pml"

@date:21.05.2025
@participants // or @ptp
=pt1=John Doe,jdoe,jdoe@example.com
=pt2=Jane Doe

@subjects
=0:Project Status: TimeTrack
=1:Security: TLS Check

@tasks
-[ ] Renew SSL certificate @ptp=pt1 =1 @tag=important // Assigns the tasks to participant "pt1", assigns it to subject with ID 1 and tags it with the "important" tag

@notes
- PDF export works -b very well -b-

@meeting
# Meeting Title: @@e=0 // echoes value of ID 0
## Participants
@@e=pt1 , @@e=pt2
## Some topic
@@macro=myMacro:title=IMPORTANT;text=@@e=1
.....

```

## External tags file (tags.pml)

```plaintext
@tags // this command behaves differently when used in the tags.pml
=0:Important
=important:Critical, high priority
```

## External macro file (myMacro.pml)

```plaintext
@new_macro
=name:myMacro
=template:
<div class="warn-box><strong>{{title}}</strong><br />{{text}}</div>

```

## Parser logic (simplified)

- `@` starts a block
- `@@` is used inside `@meeting` for inline substitution/macros
- `=` declares an ID (`=pt1`) that can be referenced later
- `@tags_import` includes external tag file
- Markdown-style headers can be used in `@meeting` content
- Styling uses `-i -i-` for italic, `-b -b-` for bold and `-a=url -a-` for links, similarly to the Tags in HTML

## Output Format (Example: JSON)

```json
{
  "date": "2025-05-21",
  "participants": [
    {
      "name": "John Doe",
      "alias": "jdoe",
      "email": "jdoe@example.com",
      "id": "pt1"
    },
    {
      "name": "Jane Doe",
      "id": "pt2"
    }
  ],
  "subjects": {
    "0": "Project Status: TimeTrack",
    "1": "Security: TLS Check"
  },
  "tasks": [
    {
      "done": false,
      "text": "Renew SSL certificate",
      "assigned_to": "pt1",
      "subject": "1",
      "tag": {
        "id": "important",
        "label": "Critical, high priority"
      }
    }
  ],
  "notes": [
    "PDF export works <b>very well</b>"
  ]
}
```

## protoparser (protoml-parser)

`protoparser` is the command-line tool for parsing `.pml` files (ProtoML) and converting them into structured formats such as JSON, HTML, PDF and more.
**The parser currently only support HTML rendering.** The other formats are planned for future releases.

### Basic Usage

```bash
protparser [options] [filename] [format]
```

#### Example

```bash
protoparser -vvv -output=myfile MeetingYesterday.pml html
```

### Local development

- Clone the repository
- Make your changes
- Run `npm run build:exe` to build linux and windows executables or simply run `npm uninstall -g protoparser && npm install -g .` to install your local version globally.

### Output

```plaintext
[INFO] Parsing file: MeetingYesterday.pml
[DEBUG] Format selected: html
[DEBUG] Filename: MeetingYesterday.html
[DEBUG] Filename overwrite: myfile.html
[DEBUG] Participants: @pt1: John Doe,jdoe,jdoe@example.com
[DEBUG] Participants: @pt2: Jane Doe
[DEBUG] IMPORTING TAGS
[DEBUG] Importing tags from: tags.pml
[DEBUG] Date: 21.05.2025
...
[INFO] DONE
[INFO] Output written to: myfile.html
```

### Available Options

| Flag | Description |
| ---- | ----------- |
| `-v`, `-vv`, `-vvv` | Verbosity levels: info, debug, trace |
| `-output=FILENAME` | Define custom output file (without extension) |
| `-strict` | Enable strict parsing (fail on missing refs) |
| `-theme=name` | Set export theme (used in HTML/PDF) |
| `-config=PATH` | Use external config for rendering/export |
| `--help` | Show CLI help |

### Supported formats

- `json`
- `html`
- `pdf`
- `markdown`
- `text`

### Notes

- If no format is given, defaults to HTML
- If no output is given, the filename (without extension) is used
- Error and warnings are printed based on verbosity levels.

## What ProtoML is NOT (yet?)

- It it not a programming language
- It does not include logic, loops or real variables
- It is not intended to render HTML or provide full Markdown support

## What ProtoML IS

- A semantic markup for protocols, tasks, topics and notes
- Extremely easy to read and write
- Expandable via IDs and modular includes
- Perfectly suited for Electron apps, PDF generators and structured JSON storage
