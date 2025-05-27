@new_macro
=name:meeting_summary
=template:
<div class="meeting-summary">
  <h4>Meeting Summary</h4>
  <p><strong>Overall:</strong> {{rating}}/5</p>
  <p>{{notes}}</p>
</div>
<style>
  .meeting-summary {
    background: #eeeeee;
    padding: 1em;
    border-radius: 5px;
    margin-top: 2em;
  }
</style>
=docs:
  Displays a closing summary for the meeting.
  @@macro=meeting_summary:rating=4;notes=Very productive discussion. Need to follow up on tasks by Friday.
