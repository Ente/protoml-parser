// Use this macro to create a finance entry in table format, like
// @@macro=f_entry:title=Job;amount=1500;type=income;category=Job;method=Bank;notes=No provisions
// or expense
// @@macro=f_entry:title=Steam Sale;amount=67.49;type=expense;category=Gaming;method=PayPal;notes=
@new_macro
=name:f_entry
=template:
<tr class="finance-row" data-type="{{type}}">
  <td>{{title}}</td>
  <td style="text-align: right;">{{amount}} €</td>
  <td>{{category}}</td>
  <td>{{method}}</td>
  <td>{{notes}}</td>
</tr>
<script>
  if (!window.__moneyTotals) window.__moneyTotals = { income: 0, expense: 0 };
  try {
    const type = "{{type}}";
    const amount = parseFloat("{{amount}}");
    if (!isNaN(amount) && (type === "income" || type === "expense")) {
      window.__moneyTotals[type] += amount;
    }
  } catch (e) {}

  document.querySelectorAll('.finance-row').forEach(row => {
    const type = row.dataset.type;
    if (type === 'income') {
      row.style.backgroundColor = '#e5fbe5'; 
    } else if (type === 'expense') {
      row.style.backgroundColor = '#fde5e5';
    }
  });
</script>
=docs:
  This macro is used to create a finance entry in a table format. It allows you to specify the title, amount, type (income or expense), category, payment method, and any notes related to the entry.

  Example usage:
  @@macro=f_entry:title=Job;amount=1500;type=income;category=Job;method=Bank;notes=No provisions
  or
  @@macro=f_entry:title=Steam Sale;amount=67.49;type=expense;category=Gaming;method=PayPal;notes=
