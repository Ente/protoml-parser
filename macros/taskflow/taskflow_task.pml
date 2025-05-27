@new_macro
=name:taskflow_task
=template:
<li class="taskflow-task">
  <span class="check">✔</span> <strong>{{task}}</strong>
  <div class="owner">👤 {{owner}}</div>
</li>
<style>
  .taskflow-task {
    background: #f5f5f5;
    border-left: 4px solid #64b5f6;
    padding: 0.75em;
    margin: 0.5em 0;
    border-radius: 6px;
    color: #333;
    transition: background 0.2s;
  }

  .taskflow-task:hover {
    background: #eaeaea;
  }

  .taskflow-task .check {
    color: #4caf50;
    margin-right: 0.5em;
  }

  .taskflow-task .owner {
    font-size: 0.85em;
    color: #666;
    margin-top: 0.3em;
  }
</style>
=docs:
  Adds a task to the current taskflow phase.
  Parameters:
    - task: Description (e.g. Implement login)
    - owner: Responsible user (e.g. pt1)
  Example:
  @@macro=taskflow_task:task=Set up CI pipeline;owner=pt2
