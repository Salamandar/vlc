if platform_nacl
  libvlccore_sources += files(
    'dirs.c',
    'filesystem.c',
    'netconf.c',
    'rand.c',
    'specific.c',
    'timer.c',
  )
endif

if platform_osx
  libvlccore_sources += files(
    'filesystem.c',
    'plugin.c',
    'rand.c',
    'timer.c',
  )
endif

if platform_linux or platform_bsd
  libvlccore_sources += files(
    'dirs.c',
    'error.c',
    'filesystem.c',
    'netconf.c',
    'plugin.c',
    'rand.c',
    'specific.c',
    'thread.c',
    'timer.c',
  )

  if not libanl.found()
    libvlccore_sources += files(
      'getaddrinfo.c',
    )
  endif

endif

if platform_win64 and (not get_option('winstore-app'))
  libvlccore_sources += files(
    'timer.c',
  )
endif