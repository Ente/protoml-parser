@new_macro
=name:code_block
=template:
<pre><code>{{code}}</code></pre>
<button onclick="navigator.clipboard.writeText(`{{code}}`)">Copy</button>
=docs:
  This macro is used to display a block of code with a "Copy" button that allows users to easily copy the code to their clipboard.

  Example usage:
  @@macro=code_block:code=console.log('Hello, World!');

  The `code` parameter should contain the code you want to display. The "Copy" button will copy the code to the clipboard when clicked.
