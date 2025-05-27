@new_macro
=name:spoiler
=template:
<details><summary>{{summary}}</summary><div style="margin-top:0.5em">{{content}}</div></details>
=docs:
  This macro is used to create a spoiler section that can be expanded or collapsed. It is useful for hiding content that may spoil the experience for users who want to avoid seeing it immediately.

  Example usage:
  @@macro=spoiler:summary=Click to reveal spoiler;content=This is the hidden content that will be revealed when the summary is clicked.

  The `summary` parameter specifies the text that will be displayed as the clickable summary, and the `content` parameter contains the text or HTML that will be shown when the summary is clicked.
