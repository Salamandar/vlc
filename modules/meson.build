
if have_dynamic_libs and not meson.is_cross_build()
  # Plug-ins cache
  custom_target('plugins.dat',
    output: 'plugins.dat',
    command: [ vlc_cache_gen, meson.current_build_dir() ],
    install: true,
    install_dir: join_paths(get_option('libdir'), 'vlc', 'plugins'),
  )
endif



if platform_win64
  module_rc = configure_file(
    input : 'module.rc.in',
    output: 'module.rc',
    configuration: conf,
  )

  module_windres = windows.compile_resources(module_rc,
    include_directories: [
      join_paths(meson.source_root(), 'share'),
      join_paths(meson.source_root(), 'extras', 'package', 'win32'),
    ]
  )
endif

#
# # Wayland
# SUFFIXES += -client-protocol.h -protocol.c .xml
#
# .xml-client-protocol.h:
# 	$(AM_V_GEN)$(WAYLAND_SCANNER) client-header < "$^" > "$@.tmp"
# 	$(AM_V_at)mv -f -- "$@.tmp" "$@"
#
# .xml-protocol.c:
# 	$(AM_V_GEN)$(WAYLAND_SCANNER) code < "$^" > "$@.tmp"
# 	$(AM_V_at)mv -f -- "$@.tmp" "$@"

plugins = [
  'access',
  'arm_neon',
  'audio_filter',
  'audio_mixer',
  'audio_output',
  'codec',
  'control',
  'demux',
  'gui',
  'keystore',
  'logger',
  'lua',
  'meta_engine',
  'misc',
  'notify',
  'packetizer',
  'services_discovery',
  'spu',
  'stream_extractor',
  'stream_filter',
  'text_renderer',
  'video_chroma',
  'video_filter',
  'video_output',
  'video_splitter',
  'visualization',
]

if true # ENABLE_SOUT
  plugins += [
    'access_output',
    'mux',
    'stream_out',
  ]
endif

foreach plugin : plugins
  plugin_dir = join_paths(get_option('libdir'), 'vlc', 'plugins', plugin)
  subdir(plugin)
endforeach

subdir('hw')
