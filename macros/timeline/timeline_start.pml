@new_macro
=name:timeline_start
=template:
<div class="timeline-wrapper">
  <ul class="timeline-list">
<style>
  .timeline-wrapper {
    border-left: 4px solid #00bcd4;
    padding-left: 1.5em;
    margin: 1.5em 0;
  }

  .timeline-list {
    list-style: none;
    padding: 0;
    margin: 0;
  }
</style>
=docs:
  Starts the visual timeline block. Must be followed by timeline_entry and timeline_end.
  Example:
  @@macro=timeline_start
