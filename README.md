# ProtoML - A minimal structured protocol language

ProtoML is a lightweight, declarative markup language designed for writing and structuring meeting protocols, notes and task lists in a human-readable and machine-parseable format.

## Installing the Parser

- Clone the repository: `git clone https://github.com/ente/protoml-parser.git`
- Install the app: `npm install -g .`
- Restart your terminal
- Run `protoparser test.pml html` to convert a file named `test.pml` to HTML.
- Run `protoviewer test.pml [theme]` to view the file with the built-in viewer.

## Install via NPM

Requires Node 18

```bash
npm install -g protoml-parser
```

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

All available commands are used in this example.

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

## External tags file (tags.pml) - not fully supported, yet

```plaintext
@tags // this command behaves differently when used in the tags.pml
=0:Important
=important:Critical, high priority
```

## External macro file (myMacro.pml)

Macros allow you to do any styling the render is not able to understand, the below's example therefore can only affectively be used with the `html` render.

* `=name:myMacro` defines the name to be used when accessing the macro like `@@macro=myMacro:....`
* `=template:` defines what the macro does, this can be multiline.

**For `html` renders, keep in mind, that `protoparser` does not remove JS code contained inside a `html` macro.
This could lead to possible security risks like XSS**
The behavior for this will be changed in release v1.1.0, allowing native JS integration to your scripts.

```plaintext
@new_macro
=name:myMacro
=template:
<div class="warn-box><strong>{{title}}</strong><br />{{text}}</div>

```

## Upcoming features (release v1.1.0)

- `pdf` render support
- Full implementation of the `@tag`/`@tags_import` command
- Fixing not being able to assign subjects to tasks
- Simple SDK for stable support
- Shipped macros
- Adding dynamic macros (with JS support)


## Parser logic (simplified)

- `@` starts a block
- `@@` is used inside `@meeting` for inline substitution/macros
- `=` declares an ID (`=pt1`) that can be referenced later
- `@tags_import` includes external tag file
- Markdown-style headers can be used in `@meeting` content
- Styling uses `-i -i-` for italic, `-b -b-` for bold and `-a=url -a-` for links, similarly to the Tags in HTML

## Output Format (Example: JSON)

The JSON format represents the actual AST (Abstract Syntax Tree) used by the renders, which may help you when experiencing issues.

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

### protoviewer (protoml-viewer)

`protoviewer` is a simple Electron app that allows you to view rendered `.pml` files without the need of third-party tools, like a web browser.
The viewer only support HTML rendering, since it's nature of being a electron app.

You can use it this way: `protoviewer [filename] [theme]`

## Basic web parser

The web parser allows you to directly write and simply parse ProtoML code in your browser. It does not fully support all features of the parser.
Additionally, CSS is not supported within the web parser.

To start using the web parser, simply open the `web/index.html`
To rebuild the parser bundle, run `npm run build:web` in the root directory of the project.
To run a webserver directly use `npm run dev` which starts a `serve` command on port 3000.

### Basic Usage

```bash
protoparser [options] [filename] [format]
```

#### Example

```bash
protoparser -vvv -output=myfile MeetingYesterday.pml html
```

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

### Local development

- Clone the repository
- Make your changes
- Run `npm run build:exe` to build linux and windows executables or simply run `npm uninstall -g protoparser && npm install -g .` to install your local version globally.

### Supported formats

- `json`
- `html`
- `pdf`

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
