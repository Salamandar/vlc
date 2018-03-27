
libvlc_sources = [
  'audio.c',
  'core.c',
  'dialog.c',
  'error.c',
  'event.c',
  'log.c',
  'media_discoverer.c',
  'media_library.c',
  'media_list_player.c',
  'media_list.c',
  'media_player.c',
  'media.c',
  'playlist.c',
  'renderer_discoverer.c',
  'video.c',
  'vlm.c',
  revision_source,
]
libvlc_lflags = [ ]

if platform_win64
  libvlc_sources += [
    '../src/libvlc_win32_rc.rc.in',
  ]
  libvlc_lflags += [
    '-avoid-version',
  ]

else
  libvlc_lflags += [
    '-Wl,--version-script,'+join_paths(meson.current_source_dir(), 'libvlc.map'),
  ]
endif
# if HAVE_DARWIN
# libvlc_la_LDFLAGS += -Xlinker -install_name -Xlinker @rpath/libvlc.dylib
# endif
# if HAVE_OS2
# libvlc_la_LDFLAGS += -avoid-version
# endif


















libvlc = library('vlc',
  libvlc_sources,

  include_directories: rootInclude,
  link_with: [
    compat,
    libvlccore,
  ],
  dependencies: [
    math,
    threads,
  ],
  link_args: libvlc_lflags,
  # soversion: '11:0:6',
)








pkgconfig.generate(
  filebase: 'libvlc',
  name: 'LibVLC control API',
  description: 'VLC media player external control library',
  url: 'https://www.videolan.org',
  version: meson.project_version(),
  libraries: libvlc,
  libraries_private: [
    '-lvlccore',
  ],
)
