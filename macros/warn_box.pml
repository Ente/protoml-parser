@new_macro
=name:warn_box
=template:
<div style="background:#ffcdd2;padding:1em;border-left:5px solid #f44336">
  <strong>⚠️ {{title}}</strong><br>{{msg}}
</div>
=docs:
  This macro is used to create a warning box that highlights important messages or alerts. It can be useful for drawing attention to critical information that requires user awareness.

  Example usage:
  @@macro=warn_box:title=Warning;msg=This is a warning message!

  The `title` parameter sets the title of the warning box, and the `msg` parameter contains the message you want to display inside the box.
