@new_macro
=name:highlight_warning
=template:
<div class="highlight highlight-warning">
  ⚠️ <strong>{{title}}</strong><br>
  {{details}}
</div>
<style>
  .highlight-warning {
    background: #fffde7;
    border-left: 4px solid #ffeb3b;
    padding: 0.5em;
    margin: 0.5em 0;
  }
</style>
=docs:
  Highlights a warning or cautionary point.
  @@macro=highlight_warning:title=Delay in Procurement;details=Hardware order delayed due to supplier issue.
