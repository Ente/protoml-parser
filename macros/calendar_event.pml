@new_macro
=name:calendar_event
=template:
<div class="calendar-entry">
  <strong>{{title}}</strong><br>
  {{date}} — {{time}}<br>
  <em>{{location}}</em><br>
  <span>{{notes}}</span>
</div>
=docs:
  Creates a visual calendar entry for planning or review purposes.
  Example usage:
  @@macro=calendar_event:title=Team Meeting;date=2025-06-01;time=14:00;location=Zoom;notes=Quarterly review
