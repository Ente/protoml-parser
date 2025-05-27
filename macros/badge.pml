@new_macro
=name:badge
=template:
<span style="background:#{{bg || '333'}};color:#fff;border-radius:999px;padding:0.2em 0.7em;font-size:0.9em">
  {{text}}
</span>
=docs:
  This macro is used to create a badge with customizable background color and text. It can be useful for highlighting important information or categorizing content visually.

  Example usage:
  @@macro=badge:bg=ff0000;text=Important

  The `bg` parameter sets the background color of the badge (default is dark gray), and the `text` parameter specifies the text to display inside the badge.