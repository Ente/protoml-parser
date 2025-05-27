@help
=name:protoml-listMacros
=docs:
Lists all available macro files in a given directory. The command recursively searches for `.pml` macro definitions and prints their `=name:` and the first line of `=docs:`.

Supports the `{{macro_dir}}` placeholder to reference internal macros.

=examples:
protoparser --listMacros {{macro_dir}}
protoparser --listMacros ./macros
