@new_macro
=name:quote
=template:
<blockquote style="border-left:4px solid #999;padding-left:1em;color:#555">
  <em>{{text}}</em>
  <br><small>– {{author}}</small>
</blockquote>
=docs:
  This macro is used to create a styled blockquote for quotes. It allows you to display a quote with the author's name in a visually appealing format.

  Example usage:
  @@macro=quote:text=The only limit to our realization of tomorrow is our doubts of today.;author=Franklin D. Roosevelt

  The `text` parameter contains the quote itself, and the `author` parameter specifies the name of the person who said the quote.