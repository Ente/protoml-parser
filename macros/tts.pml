@new_macro
=name:speak
=template:
<button onclick="speechSynthesis.speak(new SpeechSynthesisUtterance('{{text}}'))">🔊 Text-to-Speech</button>
=docs:
  This macro is used to create a button that, when clicked, will read aloud the specified text using the browser's text-to-speech functionality.
  
  Example usage:
  @@macro=speak:text=Hello, this is a text-to-speech example!
  
  The `text` parameter should contain the text you want to be read aloud. When the button is clicked, the browser will use its built-in speech synthesis capabilities to vocalize the text.
