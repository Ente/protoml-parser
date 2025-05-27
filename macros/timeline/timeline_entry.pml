@new_macro
=name:timeline_entry
=template:
<li class="timeline-entry">
  <div class="timeline-time">{{time}}</div>
  <div class="timeline-content">
    <strong>{{event}}</strong><br>
    <span class="timeline-person">👤 {{person}}</span>
  </div>
</li>
<style>
  .timeline-entry {
    position: relative;
    margin: 1.2em 0;
  }

  .timeline-time {
    position: absolute;
    left: -6em;
    width: 5em;
    text-align: right;
    color: #777;
    font-size: 0.9em;
  }

  .timeline-content {
    background: #f9f9f9;
    color: #222;
    padding: 0.75em 1em;
    border-radius: 8px;
    border: 1px solid #ddd;
    box-shadow: 0 1px 2px rgba(0,0,0,0.05);
  }

  .timeline-person {
    font-size: 0.85em;
    color: #555;
  }
</style>
=docs:
  Adds an entry to the timeline.
  Parameters:
    - time: (e.g. 10:15)
    - event: (e.g. Discuss UI Ideas)
    - person: (e.g. pt2)
  Example:
  @@macro=timeline_entry:time=10:15;event=Discuss UI;person=pt2
