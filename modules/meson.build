
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



# subdir('access')
# subdir('access/http')
# subdir('access/rtp')
# subdir('arm_neon')
# subdir('audio_filter')
# subdir('audio_mixer')
# subdir('audio_output')
# subdir('codec')
# subdir('control')
# subdir('demux')
# subdir('gui')
# subdir('hw/d3d11')
# subdir('hw/d3d9')
# subdir('hw/vaapi')
# subdir('hw/vdpau')
# subdir('keystore')
# subdir('logger')
# subdir('lua')
# subdir('meta_engine')
# subdir('misc')
# subdir('notify')
# subdir('packetizer')
# subdir('services_discovery')
# subdir('spu')
# subdir('stream_extractor')
# subdir('stream_filter')
# subdir('text_renderer')
# subdir('video_chroma')
# subdir('video_filter')
# subdir('video_output')
# subdir('video_splitter')
# subdir('visualization')

# if true # HAVE_MMAL
#   subdir('hw/mmal')
# endif
#
# if true # ENABLE_SOUT
#   subdir('access_output')
#   subdir('mux')
#   subdir('stream_out')
# endif
