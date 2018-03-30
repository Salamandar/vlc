srcInclude = include_directories('.')

###############################################################################
# Sources, flags

libvlccore_sources= [ ]
libvlccore_cflags = [ ]
libvlccore_lflags = [ ]
libvlccore_links  = [ ]
libvlccore_deps   = [ ]
libvlccore_sources+= files(
  'libvlc.c',
  'libvlc-module.c',
  'missing.c',
  'version.c',
)

libvlccore_deps   += [
  math,
  threads,
  dl,
  libanl,
]
libvlccore_links  += [
  compat,
]

subdir('android')
subdir('audio_output')
subdir('config')
subdir('darwin')
subdir('extras')
subdir('input')
subdir('interface')
subdir('linux')
subdir('misc')
subdir('modules')
subdir('network')
subdir('os2')
subdir('playlist')
subdir('posix')
subdir('stream_output')
subdir('text')
subdir('video_output')
subdir('win32')


if platform_win64
  libvlccore_sources += [
    'libvlc_win32_rc.rc.in',
  ]
  # libvlc_lflags += [
  #   '-avoid-version',
  # ]
  # libvlc_win32_rc.$(OBJEXT): libvlc_win32_rc.rc $(top_srcdir)/extras/package/win32/libvlc.dll.manifest
  # 	$(WINDRES) --include-dir $(top_srcdir)/share --include-dir $(top_srcdir)/extras/package/win32 -i $< -o $@
else
  libvlccore_lflags += [
    '-Wl,--version-script,'+join_paths(meson.current_source_dir(), 'libvlccore.map'),
  ]
endif

if get_option('dbus')
  libvlccore_deps += [ dbus, ]
endif

libvlccore_cflags += [
  '-DMODULE_STRING="core"'
]





###############################################################################
# GIT revision


revision_source = vcs_tag(
  input : 'revision.c.in',
  output: 'revision.c',
  command: [
    'git', '--git-dir=@0@/.git'.format(meson.source_root()),
    'describe', '--tags', '--long', '--match', '?.*.*', '--always',
  ],
)
libvlccore_sources += revision_source


libvlccore = shared_library('vlccore',
  libvlccore_sources,

  include_directories: rootInclude,

  c_args:       libvlccore_cflags,
  cpp_args:     libvlccore_cflags,
  link_args:    libvlccore_lflags,
  link_with:    libvlccore_links,
  dependencies: libvlccore_deps,
  # soversion: '9:0:0',

)



pkgconfig_cflags_endianness = (host_machine.endian() == 'big'
  ? [ '-DWORDS_BIGENDIAN=1' ]
  : [ ]
)

pkgconfig.generate(
  filebase: 'vlc-plugin',
  name: 'VLC plugin API',
  description: 'VLC media player plugin interface',
  url: 'https://www.videolan.org',
  version: meson.project_version(),

  subdirs: [
    join_paths('vlc', 'plugins'),
  ],
  libraries: [
    '-lvlccore',
  ],
  libraries_private: [
    '@LIBS_libvlccore@',
    '@LTLIBINTL@',
    '@LTLIBICONV@',
    '@SOCKET_LIBS@',
    '-ldl',
    '-lm',
  ],
  extra_cflags: [
    '-D__PLUGIN__',
    '-D_FILE_OFFSET_BITS=64',
    '-D_REENTRANT',
    '-D_THREAD_SAFE',
  ] + pkgconfig_cflags_endianness,

  variables: [
    # 'datadir=@datadir@',
    # 'datarootdir=@datarootdir@',
    # 'includedir=@includedir@',
    # 'libdir=@libdir@',
    # 'pkgdatadir=${datadir}/@PACKAGE@',
    # 'pkgincludedir=@includedir@/@PACKAGE@',
    # 'pkglibdir=${libdir}/@PACKAGE@',
    # 'pluginsdir=${pkglibdir}/plugins',
  ],

)

subdir('test')
