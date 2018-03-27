if platform_win64
  libvlccore_sources += files(
    'dirs.c',
    'error.c',
    'filesystem.c',
    'netconf.c',
    'plugin.c',
    'rand.c',
    'specific.c',
    'thread.c',
    'winsock.c',
  )

  if get_option('winstore-app')
    libvlccore_sources += files(
      'timer.c',
    )
  endif
endif
