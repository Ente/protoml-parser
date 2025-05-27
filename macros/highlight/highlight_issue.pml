@new_macro
=name:highlight_issue
=template:
<div class="highlight highlight-issue">
  ❌ <strong>{{title}}</strong><br>
  {{details}}
</div>
<style>
  .highlight-issue {
    background: #ffebee;
    border-left: 4px solid #f44336;
    padding: 0.5em;
    margin: 0.5em 0;
  }
</style>
=docs:
  Use this to indicate a blocking issue or bug.
  @@macro=highlight_issue:title=Login Timeout;details=Users report timeouts when signing in from mobile.
