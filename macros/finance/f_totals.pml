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
=docs:
  This macro is used to display the total income, expenses, and balance in a financial overview table. It calculates the totals based on the entries made with the `f_entry` macro and displays them in a summary row at the end of the table.

  Example usage:
  @@macro=f_totals:x=x

  The totals will be dynamically calculated and displayed in the table, providing a quick overview of your financial status.
  Use this macro before the `f_end` macro to ensure it appears in the correct place in the table.
  It is typically placed after all entries have been added using the `f_entry` macro.
