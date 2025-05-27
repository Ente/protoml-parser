@new_macro
=name:progress_bar
=template:
<div class="progress-container">
  <div class="progress-label">{{label}} ({{percent}}%)</div>
  <div class="progress-bar-outer">
    <div class="progress-bar-inner" style="width: {{percent}}%; background-color: {{color}};"></div>
  </div>
</div>
<style>
  .progress-container {
    margin: 1em 0;
    font-family: sans-serif;
  }

  .progress-label {
    margin-bottom: 0.25em;
    font-weight: bold;
    font-size: 0.9em;
  }

  .progress-bar-outer {
    background-color: #333;
    border-radius: 5px;
    overflow: hidden;
    height: 20px;
  }

  .progress-bar-inner {
    height: 100%;
    transition: width 0.3s ease;
  }
</style>
=docs:
  Displays a progress bar with label, color, and percentage fill.

  Example usage:
  @@macro=progress_bar:label=Milestone 1;percent=72;color=#00cc88
