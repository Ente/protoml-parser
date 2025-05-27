@new_macro
=name:score_card
=template:
<div class="scorecard">
  <h3>{{label}}</h3>
  <p style="font-size: 2em;">{{value}}</p>
  <span>{{unit}}</span>
</div>
<script>
  document.querySelectorAll('.scorecard').forEach(card => {
    card.style.backgroundColor = '#1f1f1f';
    card.style.padding = '1em';
    card.style.borderRadius = '10px';
    card.style.boxShadow = '0 0 10px rgba(0,0,0,0.2)';
    card.style.display = 'inline-block';
    card.style.margin = '0.5em';
    card.style.color = '#fff';
  });
</script>
=docs:
  Displays a score/value card for dashboards. Great for analytics or reporting.
  Example:
  @@macro=score_card:label=Open Tickets;value=37;unit=tickets
