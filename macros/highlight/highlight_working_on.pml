@new_macro
=name:highlight_working_on
=template:
<div class="highlight highlight-work">
  🛠 <strong>Currently Working On:</strong> {{item}}<br>
  {{notes}}
</div>
<style>
  .highlight-work {
    background: #f3e5f5;
    border-left: 4px solid #9c27b0;
    padding: 0.5em;
    margin: 0.5em 0;
  }
</style>
=docs:
  Highlights something that's currently in active development.
  @@macro=highlight_working_on:item=Frontend Redesign;notes=Component refactor ongoing, ETA 2 weeks.
