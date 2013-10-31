
" Neocomplcache {
if !janus#is_plugin_disabled('plugin.neocomplcache')
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    "let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    "let g:neocomplcache_enable_underbar_completion = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'php' : $HOME . '/.vim-php.dict',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
           

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction

    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplcache#close_popup()."\<ESC>"
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    
    " Close popup by <Space>.
    inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    
    " Enable heavy omni completion.
    "omni completion for PHP sucks hard, HARD! don't use it. Read: https://github.com/Shougo/neocomplcache.vim/issues/391
    "autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    "let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    
    if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
    endif
    
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    " let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    
    
    "Copied from http://www.karakaram.com/neocomplcache
    "関数を補完するための区切り文字パターン
	if !exists('g:neocomplcache_delimiter_patterns')
	  let g:neocomplcache_delimiter_patterns = {}
	endif
	let g:neocomplcache_delimiter_patterns['php'] = ['->', '::', '\']

endif
" }

" neosnippet {
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For snippet_complete marker.
    if has('conceal')
      set conceallevel=2 concealcursor=i
    endif
" }

" Tagbar {
    " only show functions in PHP
    let g:tagbar_type_php  = {
        \ 'ctagstype' : 'php',
            \ 'kinds' : [
                \ 'f:functions',
            \ ]
        \ }

    let g:tagbar_ctags_bin = "/usr/local/bin/ctags"         " hardcode path to ctags
    let g:tagbar_singleclick = 1                            " single- instead of double-click to jump

    if has('gui_running')
        autocmd BufEnter * nested :call tagbar#autoopen(0) " auto open
        " autocmd BufHidden,BufDelete * :TagbarClose " auto close
    endif
" }

" NERDTree {
    let g:NERDTreeMinimalUI   = 1 " hide help notice
    let g:NERDTreeChDirMode   = 2 " change CWD to root node

    let g:NERDTreeHijackNetrw = 1 " invoke as file browser

    " when switching into a tab, make sure that focus will always be in file
    " editing window, not in NERDTree window (off by default)
    let g:nerdtree_tabs_focus_on_files = 1

    " reset Janus autocommands in favour of NERDTreeTabs
    augroup AuNERDTreeCmd
        autocmd! AuNERDTreeCmd
    augroup END
" }

" Other Plugins {
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '^\.\|\~\|__CG__.+\.php$',
        \ }

    "let g:vimwiki_list = [{'path': '~/.vimwiki/wiki/', 'path_html': '~/.vimwiki/html/'}]
    "let g:vimwiki_camel_case = 0
" }
