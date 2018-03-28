
lua_files = [
  'anevia_streams.lua',
  'anevia_xml.lua',
  'appletrailers.lua',
  'bbc_co_uk.lua',
  # 'break.lua',
  'cue.lua',
  'dailymotion.lua',
  # 'extreme.lua',
  # 'france2.lua',
  'jamendo.lua',
  # 'katsomo.lua',
  'koreus.lua',
  # 'lelombrik.lua',
  'liveleak.lua',
  # 'metacafe.lua',
  # 'mpora.lua',
  'newgrounds.lua',
  # 'pinkbike.lua',
  'rockbox_fm_presets.lua',
  'soundcloud.lua',
  'twitch.lua',
  'vimeo.lua',
  'vocaroo.lua',
  'youtube.lua',
  # 'zapiks.lua',
]

doc_files = [
  'README.txt',
  'liveleak.lua',
  'youtube.lua',
]

lua_subdir = join_paths('playlist')

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
