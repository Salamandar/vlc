if get_option('build-vlc')


vlc_sources = [ ]
vlc_deps    = [
  threads,
  dl,
]
vlc_links   = [
  libvlc,
]



if platform_win64
  vlc_sources = [
    'winvlc.c',
  ]
  'vlc_win32_rc'

  breakpad_url = get_option('with-breakpad')
  if breakpad_url != ''
    breakpad_lib = static_library('breakpad',
      'breakpad.cpp',
      include_directories: rootInclude,
      cxx_args: [
        '-DBREAKPAD_URL="@0@"'.format(breakpad_url),
      ],
    )

    vlc_links += breakpad_lib
  endif

else
  vlc_sources = [
    'vlc.c',
    'override.c',
  ]
endif




# if HAVE_DBUS
# AM_CPPFLAGS += -DHAVE_DBUS
# endif
# vlc_LDADD = ../lib/libvlc.la $(LIBPTHREAD)



vlc_exe = executable('vlc',
  vlc_sources,
  include_directories : rootInclude,
  link_with:    vlc_links,
  dependencies: vlc_deps,
)






endif
