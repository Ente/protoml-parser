@new_macro
=name:alert
=template:
<script>alert("{{msg}}")</script>

=docs:
  This macro is used to display an alert message in the browser. It can be useful for notifying users of important information or errors.

  Example usage:
  @@macro=alert:msg=This is an alert message!

  The `msg` parameter should contain the text you want to display in the alert dialog.