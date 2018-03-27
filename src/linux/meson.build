if platform_android
  libvlccore_sources += files(
    'cpu.c',
    'dirs.c',
    'thread.c',
  )
endif

if platform_linux or platform_bsd
  libvlccore_sources += files(
    'cpu.c',
    'dirs.c',
    'filesystem.c',
    'thread.c',
  )

  if libanl.found()
    libvlccore_sources += files(
      'getaddrinfo.c',
    )
  endif
endif
