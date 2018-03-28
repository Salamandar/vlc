share_conf = configuration_data()
share_conf.set('bindir', join_paths(get_option('prefix'), get_option('bindir')))
share_conf.set('VERSION', meson.project_version())

mimetypes = []
foreach line : run_command('cat',
    join_paths(meson.current_source_dir(), 'vlc.desktop.mimetypes'),
  ).stdout().split('\n')
  splitline = line.split('#')[0].strip()
  if splitline != ''
    mimetypes += splitline
  endif
endforeach

share_conf.set('MIMETYPES', ';'.join(mimetypes))


if not (platform_win64 or platform_osx)
  vlc_desktop = configure_file(
    input : 'vlc.desktop.in',
    output: 'vlc.desktop',
    configuration: share_conf,
    install: true,
    install_dir: join_paths(get_option('datadir'), 'applications'),
  )

  vlc_appdata_m = configure_file(
    input : 'vlc.appdata.xml.in.in',
    output: 'vlc.appdata.xml.in',
    configuration: share_conf,
  )
  vlc_appdata = i18n.merge_file(
    input : vlc_appdata_m,
    output: 'vlc.appdata.xml',
    po_dir: po_dir,
    type: 'xml',
    install: true,
    install_dir: join_paths(get_option('datadir'), 'metainfo'),
  )
endif


if not platform_win64

  install_data('icons/vlc.ico',
    install_dir: join_paths(get_option('datadir'), 'vlc'),
  )

  install_subdir('icons',
    install_dir: join_paths(get_option('datadir'), 'icons', 'hicolor'),
    strip_directory: true,
    exclude_files: [
      'vlc.ico',
      '16x16/vlc-xmas.png',
      '16x16/vlc-xmas.xpm',
      '32x32/vlc-xmas.png',
    ],
  )


  install_subdir('utils',
    install_dir: join_paths(get_option('datadir'), 'vlc'),
  )

endif


if true # KDE_SOLID
  install_subdir('solid',
    install_dir: join_paths(get_option('datadir'), 'kde4', 'apps'),
  )
endif

if true # BUILD_SKINS
  install_subdir('skins2',
    install_dir: join_paths(get_option('datadir'), 'vlc'),
    exclude_directories: 'default',
  )

  custom_target('default.vlt',
    depend_files: [
      'skins2/default/subX/about.png',
      'skins2/default/subX/eq.png',
      'skins2/default/subX/font.otf',
      'skins2/default/subX/main.png',
      'skins2/default/subX/pl.png',
      'skins2/default/subX/playtreeglyphs.png',
      'skins2/default/subX/sysbuttons.png',
      'skins2/default/subX/vol_anim.png',
      'skins2/default/subX/vol_slider.png',
      'skins2/default/theme.xml',
    ],
    output: 'default.vlt',
    command: [
      find_program('tar'), 'cvvzf', '@OUTPUT@',
      '--owner=root', '--group=root',
      '--directory', join_paths(meson.current_source_dir(), 'skins2'),
      'default/',
    ],
    install: true,
    install_dir:  join_paths(get_option('datadir'), 'vlc', 'skins2'),
  )
endif

if true # build_lua
  subdir('lua')
endif
