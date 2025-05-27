@help
=name:tasks
=docs:
The `@tasks` section defines a list of to-do items.

Tasks use `-[ ]` (open) or `-[x]` (done) syntax. Additional metadata like `@ptp=`, `=subjectId`, or `@tag=` can be attached.

=examples:
@tasks
-[ ] Renew SSL cert @ptp=pt1 =1 @tag=urgent
-[x] Review access logs
