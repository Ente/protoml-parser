@new_macro
=name:taskflow_phase
=template:
<div class="taskflow-phase">
  <h3>{{title}}</h3>
  <ul class="taskflow-list">
<style>
  .taskflow-phase {
    background: #ffffff;
    border: 1px solid #ddd;
    border-left: 5px solid #2196f3;
    border-radius: 8px;
    padding: 1em;
    margin: 1.5em 0;
    box-shadow: 0 1px 3px rgba(0,0,0,0.05);
  }

  .taskflow-phase h3 {
    font-size: 1.2em;
    margin-top: 0;
    color: #2196f3;
    border-bottom: 1px solid #eee;
    padding-bottom: 0.3em;
  }

  .taskflow-list {
    list-style: none;
    margin: 0.5em 0 0 0;
    padding: 0;
  }
</style>
=docs:
  Starts a taskflow phase block in light design.
  Parameter:
    - title: Title of the phase (e.g. Planning)
  Example:
  @@macro=taskflow_phase:title=Design Phase
