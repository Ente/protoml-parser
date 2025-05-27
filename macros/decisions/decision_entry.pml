@new_macro
=name:decision_entry
=template:
<div class="decision-entry">
  <strong>Decision:</strong> {{title}}<br>
  <em>Result:</em> {{result}} | <em>By:</em> {{by}}
</div>
<style>
  .decision-entry {
    background: #e9ffe9;
    border-left: 4px solid #4caf50;
    padding: 0.5em;
    margin: 0.5em 0;
  }
</style>
=docs:
  Logs a decision made during the meeting.
  @@macro=decision_entry:title=Adopt new API format;result=Accepted;by=pt1
