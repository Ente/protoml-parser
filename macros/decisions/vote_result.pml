@new_macro
=name:vote_result
=template:
<div class="vote-result">
  <strong>{{topic}}</strong><br>
  👍 {{yes}} | 👎 {{no}} | 🤷 {{abstain}}
</div>
<style>
  .vote-result {
    background: #f3f3f3;
    padding: 0.5em;
    border-left: 4px solid #2196f3;
    margin: 0.5em 0;
  }
</style>
=docs:
  Logs a simple voting result.
  @@macro=vote_result:topic=Include dark mode;yes=4;no=1;abstain=0
