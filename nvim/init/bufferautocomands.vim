
" Enable syntax and plugins (for netrw) {{{
syntax enable                           " Enable syntax highlight
filetype plugin on                      " Filetype detection, plugin [ON]
" }}}

" Vimscript file settings ----------------- {{{
augroup filetype_vim
   autocmd!
   autocmd FileType vim setlocal foldmethod=marker
augroup END
" NOW we can use 'za' to fold and unfold the settings in the file.
" }}}

" Set up Buffer auto command {{{
" don't automatically comment next line on enter/o if already commenting
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Change to directory of current file automatically
"autocmd BufEnter * lcd %:p:h " change to directory of current file automatically

" automatically strip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}

"Folding of code {{{
" Now we can fold code by
" 1: mark the beginning of a scope with mb
" 2: move to the end of the scope with the % sign
" 3: create a fold by typing zf'b
" The folded code should be persistent.
autocmd BufWinLeave *.* mkview " restor the foldinging view of files.
autocmd BufWinEnter *.* silent loadview
:highlight Folded guibg=grey guifg=black
:highlight FoldColumn guibg=darkgrey guifg=white
" }}}

" Set up the persistent undo. {{{
" There should be files under ~/.local/share/nvim/undo
set undofile
if !has('nvim')
   set undodir=~/.local/share/nvim/undo
endif
augroup vimrc
   autocmd BufWritePre /tmp/* setlocal noundofile
augroup END
" }}}

" Use git to backup everything that I edit {{{
" https://www.reddit.com/r/vim/comments/8w3udw/topnotch_vim_file_backup_history_with_no_plugins/
" That's it! All your files (even those that are not in any version control) are now
" reliably backed up to ~/.vim_custom_backups whenever you save. I have been using this
" for years and it has worked wonders.
 augroup custom_backup
    autocmd!
    autocmd BufWritePost * call BackupCurrentFile()
  augroup end

 let s:custom_backup_dir='~/.vim_custom_backups'
 function! BackupCurrentFile()
   if !isdirectory(expand(s:custom_backup_dir))
     let cmd = 'mkdir -p ' . s:custom_backup_dir . ';'
     let cmd .= 'cd ' . s:custom_backup_dir . ';'
     let cmd .= 'git init;'
     call system(cmd)
   endif
   let file = expand('%:p')
   if file =~ fnamemodify(s:custom_backup_dir, ':t') | return | endif
   let file_dir = s:custom_backup_dir . expand('%:p:h')
   let backup_file = s:custom_backup_dir . file
   let cmd = ''
   if !isdirectory(expand(file_dir))
     let cmd .= 'mkdir -p ' . file_dir . ';'
   endif
   let cmd .= 'cp ' . file . ' ' . backup_file . ';'
   let cmd .= 'cd ' . s:custom_backup_dir . ';'
   let cmd .= 'git add ' . backup_file . ';'
   let cmd .= 'git commit -m "Backup - `date`";'
   call jobstart(cmd)
 endfunction

 noremap <silent> <leader>obk :call OpenCurrentFileBackupHistory()<cr>

" Bonus: if you use tmux, here's a little helper function to open the backup history for
" the current file by pressing <leader>obk (as in "open backup"):
function! OpenCurrentFileBackupHistory()
  let backup_dir = expand(s:custom_backup_dir . expand('%:p:h'))
  let cmd = 'tmux split-window -h -c "' . backup_dir . '"\; '
  let cmd .= 'send-keys "git log --patch --since=\"1 month ago\" ' . expand('%:t') . '" C-m'
  call system(cmd)
endfunction

" }}}

