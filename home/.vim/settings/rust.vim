let g:rust_clip_command = 'pbcopy'
let g:racer_cmd = "~/.cargo/bin/racer"
let g:autofmt_autosave = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

if executable('rls')
      au User lsp_setup call lsp#register_server({
              \ 'name': 'rls',
              \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
              \ 'whitelist': ['rust'],
              \ })
    endif
