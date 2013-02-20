" Neocomplcache {
if !janus#is_plugin_disabled('plugin.neocomplcache')
    let g:acp_enableAtStartup = 0                        " Disable AutoComplPop

    let g:neocomplcache_enable_at_startup = 1            " Use neocomplcache.
    let g:neocomplcache_enable_smart_case = 1            " Use smartcase.
    let g:neocomplcache_enable_camel_case_completion = 1 " Use camel case completion.
    let g:neocomplcache_enable_underbar_completion = 1   " Use underbar completion.
    let g:neocomplcache_enable_auto_select = 1           " AutoComplPop like behavior

    "let g:neocomplcache_min_syntax_length = 1            " Set minimum syntax keyword length.

    let g:neocomplcache_auto_completion_start_length = 1
    let g:neocomplcache_enable_prefetch = 1


    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

    autocmd VimEnter * call neocomplcache#enable()      " always enable

    function! g:neocomplcache__start_pre_cache()
        if exists('b:neocomplcache__pre_cache')
            return
        endif

        let b:neocomplcache__pre_cache = 1

        if g:neocomplcache_lock_buffer_name_pattern
                \ && bufname('%') =~ g:neocomplcache_lock_buffer_name_pattern
            return
        endif

        :NeoComplCacheCachingBuffer
        :NeoComplCacheCachingDictionary
    endfunction

    " autocmd BufEnter * call g:neocomplcache__start_pre_cache()

    set completeopt-=preview
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

    let g:tagbar_ctags_bin = "/opt/local/bin/ctags"         " hardcode path to ctags
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