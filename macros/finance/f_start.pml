@new_macro
=name:f_start
=template:
<h1>Financial Overview</h1>
<table border="1" cellpadding="6" cellspacing="0" style="width: 100%; border-collapse: collapse;">
  <thead style="background-color: #f0f0f0;">
    <tr>
      <th>Title</th>
      <th>Amount</th>
      <th>Category</th>
      <th>Method</th>
      <th>Note</th>
    </tr>
  </thead>
  <tbody>

=docs:
  This macro is used to start a financial overview table. It sets up the table structure with headers for title, amount, category, method, and notes. You can use this macro at the beginning of your financial entries to create a well-formatted table.

  Example usage:
  @@macro=f_start:x=x

  After using this macro, you can add entries using the `f_entry` macro and close the table with the `f_end` macro.
