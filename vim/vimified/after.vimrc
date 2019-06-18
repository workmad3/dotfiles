" vim: set syntax=vim:
" Reset to preferred behaviour {{{
set norelativenumber
set number
" }}}

" Extra setup {{{

" General {{{
set softtabstop=2
set shiftwidth=2
set shell=/usr/local/bin/zsh
set eol

map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-j> <C-w>j
" }}}

" Colour {{{
set background=dark
colorscheme Tomorrow-Night
" }}}

" Ruby {{{
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile Cheffile set filetype=ruby
au BufRead,BufNewFile Berksfile set filetype=ruby
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile Bowerfile set filetype=ruby
au BufRead,BufNewFile *.prawn set filetype=ruby
autocmd FileType ruby,eruby set shiftwidth=2
autocmd FileType ruby,eruby set softtabstop=2
autocmd FileType ruby,eruby let ruby_operators = 1
autocmd FileType ruby,eruby let ruby_space_errors = 1
autocmd FileType ruby,eruby let ruby_minlines = 400

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_use_bundler = 1

" }}}

" RSpec {{{
nmap <silent> <leader>sr :call RunRspecRelated()<cr>
nmap <silent> <leader>sf :call RunRspecCurrentFileConque()<cr>
nmap <silent> <leader>os :call RelatedSpecOpen()<cr>

" }}}

" JSON {{{
autocmd FileType json set shiftwidth=2
autocmd FileType json set softtabstop=2
autocmd FileType json set autoindent
autocmd FileType json set expandtab
au BufRead,BufNewFile *.avsc set filetype=json
" }}}

" Javascript {{{
au BufRead,BufNewFile *.es6 set filetype=javascript
" }}}

" Rainbow Parentheses {{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}

" Syntastic {{{
let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['ruby', 'php', 'python', 'coffee'],
                               \ 'passive_filetypes': ['cucumber', 'java', 'c'] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 1
" }}}

" NVim ruby setup {{{
let g:ruby_host_prog = '~/.gem/ruby/2.4.6/bin/neovim-ruby-host'
" }}}

" Supertab {{{
" }}}

" NerdTree {{{
" }}}

" }}}
