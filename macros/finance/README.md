# Example usage of the finance macros:

```pml
@meeting

....

@@macro=f_start:x=var // Start of the finance section

@@macro=f_entry:title=Salary;amount=1500;type=income;category=Job;method=Bank;notes=Stable month // Income entry
@@macro=f_entry:title=Gaming Steam Sale;amount=67.49;type=expense;category=Leisure;method=PayPal;notes= // Expense entry
@@macro=f_entry:title=Fee;amount=300;type=income;category=Freelance;method=Bank Transfer;notes=Done in the evening // Another income entry

@@macro=f_totals:x=var // Totals for the finance section
@@macro=f_end:x=var // End of the finance section


```
