@help
=name:new_macro
=docs:
Defines a new macro that can be used with `@@macro=...`. Macros are external `.pml` files containing a `=template:` and a `=name:`.

Templates can use `{{variable}}` syntax to inject values from the invocation.

⚠️ Macros rendered in HTML may include JS, which could be a security concern (e.g. XSS).

=examples:
@new_macro
=name:warning
=template:
<div class="warn-box"><strong>{{title}}</strong><br>{{text}}</div>
=docs:
Additional documentation.
