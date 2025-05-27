@new_macro
=name:highlight_success
=template:
<div class="highlight highlight-success">
  ✅ <strong>{{title}}</strong><br>
  {{details}}
</div>
<style>
  .highlight-success {
    background: #e8f5e9;
    border-left: 4px solid #4caf50;
    padding: 0.5em;
    margin: 0.5em 0;
  }
</style>
=docs:
  Used to highlight a successful outcome.
  @@macro=highlight_success:title=Server Migration Complete;details=All systems running without issues.
