@new_macro
=name:f_totals
=template:
<tr id="finance-summary" style="font-weight: bold;">
  <td colspan="5" style="text-align: center;">Wird geladen…</td>
</tr>
<script>
  const i = (window.__moneyTotals?.income || 0).toFixed(2);
  const e = (window.__moneyTotals?.expense || 0).toFixed(2);
  const s = (parseFloat(i) - parseFloat(e)).toFixed(2);

  const color = s > 0 ? 'limegreen' : s < 0 ? 'tomato' : 'inherit';
  const summary = document.getElementById('finance-summary');
  if (summary) {
    summary.innerHTML = `
      <td><strong>Gesamt</strong></td>
      <td style="text-align: right;">${i} €</td>
      <td>${e} €</td>
      <td colspan="2" style="color: ${color}; text-align: center;">
        Saldo: ${s} €
      </td>
    `;
  }
</script>
