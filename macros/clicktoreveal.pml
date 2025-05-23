@new_macro
=name:click_reveal
=template:
<button onclick="document.getElementById('rvl').style.display='block'">Reveal contents</button>
<div id="rvl" style="display:none">{{content}}</div>
