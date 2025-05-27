@new_macro
=name:click_reveal
=template:
<button onclick="document.getElementById('rvl').style.display='block'">Reveal contents</button>
<div id="rvl" style="display:none">{{content}}</div>
=docs:
  This macro is used to create a button that reveals hidden content when clicked. It can be useful for displaying additional information or details without cluttering the page.

  Example usage:
  @@macro=click_reveal:content=This is the hidden content that will be revealed when the button is clicked.

  The `content` parameter should contain the text or HTML you want to display when the button is clicked. The content will initially be hidden and will only appear after the user clicks the "Reveal contents" button.
