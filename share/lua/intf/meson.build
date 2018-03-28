subdir('modules')

lua_files = [
  'cli.lua',
  'dummy.lua',
  'dumpmeta.lua',
  'http.lua',
  'luac.lua',
  'telnet.lua',
]

doc_files = [
  'README.txt',
  'dumpmeta.lua',
]

lua_subdir = join_paths('intf')

foreach lua_source : lua_files
  lua_binary = lua_source + 'c'
  custom_target(join_paths(lua_subdir, lua_binary).underscorify(),
    input : lua_source,
    output: lua_binary,
    command: luac_command,
    install: true,
    install_dir: join_paths(lua_outdir, lua_subdir),
  )
endforeach

install_data(doc_files, install_dir: join_paths(lua_docdir, lua_subdir))
