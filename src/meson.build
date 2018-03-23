###############################################################################
# Sources

libvlccore_sources = [
  'libvlc.c',
  'libvlc-module.c',
  'missing.c',
  # 'revision.c',
  'version.c',

  'config/core.c',
  'config/chain.c',
  'config/file.c',
  'config/help.c',
  'config/intf.c',
  'config/cmdline.c',
  'config/getopt.c',
  'extras/libc.c',
  'modules/modules.c',
  'modules/bank.c',
  'modules/cache.c',
  'modules/entry.c',
  'modules/textdomain.c',
  'interface/dialog.c',
  'interface/interface.c',
  'playlist/art.c',
  'playlist/aout.c',
  'playlist/thread.c',
  'playlist/control.c',
  'playlist/engine.c',
  'playlist/fetcher.c',
  'playlist/sort.c',
  'playlist/loadsave.c',
  'playlist/preparser.c',
  'playlist/tree.c',
  'playlist/item.c',
  'playlist/search.c',
  'playlist/services_discovery.c',
  'playlist/renderer.c',
  'input/item.c',
  'input/access.c',
  'input/clock.c',
  'input/control.c',
  'input/decoder.c',
  'input/demux.c',
  'input/demux_chained.c',
  'input/es_out.c',
  'input/es_out_timeshift.c',
  'input/event.c',
  'input/input.c',
  'input/meta.c',
  'input/resource.c',
  'input/services_discovery.c',
  'input/stats.c',
  'input/stream.c',
  'input/stream_fifo.c',
  'input/stream_extractor.c',
  'input/stream_filter.c',
  'input/stream_memory.c',
  'input/subtitles.c',
  'input/var.c',
  'audio_output/common.c',
  'audio_output/dec.c',
  'audio_output/filters.c',
  'audio_output/output.c',
  'audio_output/volume.c',
  'video_output/control.c',
  'video_output/display.c',
  'video_output/inhibit.c',
  'video_output/interlacing.c',
  'video_output/snapshot.c',
  'video_output/video_output.c',
  'video_output/video_text.c',
  'video_output/video_epg.c',
  'video_output/video_widgets.c',
  'video_output/vout_subpictures.c',
  'video_output/window.c',
  'video_output/opengl.c',
  'video_output/vout_intf.c',
  'video_output/vout_wrapper.c',
  'network/getaddrinfo.c',
  'network/http_auth.c',
  'network/httpd.c',
  'network/io.c',
  'network/tcp.c',
  'network/udp.c',
  'network/rootbind.c',
  'network/stream.c',
  'network/tls.c',
  'text/charset.c',
  'text/memstream.c',
  'text/strings.c',
  'text/unicode.c',
  'text/url.c',
  'text/filesystem.c',
  'text/iso_lang.c',
  'misc/actions.c',
  'misc/background_worker.c',
  'misc/md5.c',
  'misc/probe.c',
  'misc/rand.c',
  'misc/mtime.c',
  'misc/block.c',
  'misc/fifo.c',
  'misc/fourcc.c',
  'misc/es_format.c',
  'misc/picture.c',
  'misc/picture_fifo.c',
  'misc/picture_pool.c',
  'misc/interrupt.c',
  'misc/keystore.c',
  'misc/renderer_discovery.c',
  'misc/threads.c',
  'misc/cpu.c',
  'misc/epg.c',
  'misc/exit.c',
  'misc/events.c',
  'misc/image.c',
  'misc/messages.c',
  'misc/mime.c',
  'misc/objects.c',
  'misc/objres.c',
  'misc/variables.c',
  'misc/error.c',
  'misc/xml.c',
  'misc/addons.c',
  'misc/filter.c',
  'misc/filter_chain.c',
  'misc/httpcookies.c',
  'misc/fingerprinter.c',
  'misc/text_style.c',
  'misc/subpicture.c',
]

if platform_win64
  libvlccore_sources += [
    'win32/dirs.c',
    'win32/error.c',
    'win32/filesystem.c',
    'win32/netconf.c',
    'win32/plugin.c',
    'win32/rand.c',
    'win32/specific.c',
    'win32/thread.c',
    'win32/winsock.c',
  ]
  if get_option('winstore-app')
    libvlccore_sources += [ 'win32/timer.c', ]
  else
    libvlccore_sources += [ 'posix/timer.c', ]
  endif

# elif platform_osx
#   libvlccore_sources += [
#     'darwin/error.c',
#     'os2/dirs.c',
#     'os2/filesystem.c',
#     'os2/getaddrinfo.c',
#     'os2/netconf.c',
#     'os2/plugin.c',
#     'os2/rand.c',
#     'os2/specific.c',
#     'os2/thread.c',
#   ]
else
  if false # HAVE_NACL
    libvlccore_sources += [
      'android/error.c',
      'posix/dirs.c',
      'posix/filesystem.c',
      'posix/netconf.c',
      'posix/rand.c',
      'posix/specific.c',
      'posix/timer.c',
    ]
  else
    libvlccore_sources += [
      'posix/filesystem.c',
      'posix/plugin.c',
      'posix/rand.c',
      'posix/timer.c',
    ]
    if platform_android
      libvlccore_sources += [
        'android/error.c',
        'android/specific.c',
        'android/thread.c',
        'linux/cpu.c',
        'linux/dirs.c',
        'linux/thread.c',
      ]
    else
      if HAVE_DARWIN
        libvlccore_sources += [
          'darwin/dirs.c',
          'darwin/error.c',
          'darwin/netconf.c',
          'darwin/specific.c',
          'darwin/thread.c',
        ]
      else
        libvlccore_sources += [
          'posix/dirs.c',
          'posix/error.c',
          'posix/netconf.c',
          'posix/specific.c',
          'posix/thread.c',
        ]
        if HAVE_LINUX
          libvlccore_sources += [
            'linux/cpu.c',
            'linux/dirs.c',
            'linux/filesystem.c',
            'linux/thread.c',
          ]
        endif
        if HAVE_LIBANL
          libvlccore_sources += [
            'linux/getaddrinfo.c',
          ]
          libvlccore_la_LIBADD += -lanl
        else
          libvlccore_sources += [
            'posix/getaddrinfo.c',
          ]
        endif
      endif
    endif
  endif
endif






libvlccore_cflags = [
  '-DMODULE_STRING="core"'
]

if have_dynamic_libs
  libvlccore_cflags += [ '-DHAVE_DYNAMIC_PLUGINS' ]
endif
if have_dbus
  libvlccore_cflags += [ '-DHAVE_DBUS' ]
endif

libvlccore = library('vlccore',
  libvlccore_sources,

  include_directories: rootInclude,

  c_args:   libvlccore_cflags,
  cpp_args: libvlccore_cflags,

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

