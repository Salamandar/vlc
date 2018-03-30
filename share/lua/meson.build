
lua_outdir = join_paths(get_option( 'libdir'), 'vlc', 'lua')
lua_docdir = join_paths(get_option('datadir'), 'doc', 'vlc', 'lua')
lua_webdir = join_paths(get_option('datadir'), 'vlc', 'lua')

luac_command = [
  find_program('luac'),
  '-o', '@OUTPUT@',
  '-s',
  '--', '@INPUT@',
]


subdir('extensions')
subdir('intf')
subdir('meta')
subdir('modules')
subdir('playlist')
subdir('sd')

install_subdir('http',
  install_dir: join_paths(lua_webdir),
)

doc_files = [
  'README.txt',
]
install_data(doc_files,
  install_dir: join_paths(lua_docdir)
)

doc_files = [
  'http/requests/README.txt',
]
install_data(doc_files,
  install_dir: join_paths(lua_docdir, 'http', 'requests')
)
