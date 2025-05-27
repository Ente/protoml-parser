@help
=name:protoml-parser
=docs:
`protoml-parser` (alias `protoparser`) is the main CLI tool used to parse `.pml` (ProtoML) files and convert them into structured output formats such as HTML, JSON, or PDF.

It supports external macro loading, tag files, participant assignments, dynamic echoing with `@@e=`, and macro usage within the `@meeting` block.

It is the recommended way to build machine-parseable exports of structured notes, tasks, and protocols.

=examples:
protoparser Meeting.pml html
protoparser -vv -output=summary Meeting.pml json
