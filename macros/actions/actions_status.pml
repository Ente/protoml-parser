@new_macro
=name:action_status
=template:
<span class="action-status action-{{status}}">{{status}}</span>
<style>
  .action-status {
    padding: 0.3em 0.6em;
    font-weight: bold;
    font-size: 0.75em;
    border-radius: 4px;
    margin-left: 0.4em;
    background: #ccc;
    color: #fff;
  }

  .action-open { background: #f44336; }
  .action-inprogress { background: #ff9800; }
  .action-done { background: #4caf50; }
</style>
=docs:
  Adds a visual status badge to an action item.
  @@macro=action_status:status=done
