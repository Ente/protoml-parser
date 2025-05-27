@new_macro
=name:action_item
=template:
<div class="action-item">
  ✅ <strong>{{task}}</strong> – by {{owner}} (due {{due}})
</div>
<style>
  .action-item {
    border-left: 4px solid #00bcd4;
    background: #e0f7fa;
    padding: 0.5em;
    margin: 0.5em 0;
  }
</style>
=docs:
  Logs a follow-up task or action point from the meeting.
  @@macro=action_item:task=Deploy new release;owner=pt2;due=2025-06-03
