
" Command mode mappings {{{
"----
" Handle E45: 'readonly' option is set (add ! to override)
"----
"It usually goes like this: you open a file with Vim and make some changes.
" When you try to save the file and see the message above.
" Then you realize that you didn’t run Vim with sudo?! Argh, so annoying isn't it?
"Now, when you get to the same situation and you can't save your file with usual command,
" simply run :w!! command, and your changes will be saved!0
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
"xxxx
" }}}
