
install_data('vlc.ico',
  install_dir: join_paths(get_option('datadir'), 'vlc'),
)

icon_sizes = [
  '16x16',
  '32x32',
  '48x48',
  '128x128',
  '256x256',
]

foreach size : icon_sizes
  install_subdir(size,
    install_dir: join_paths(get_option('datadir'),
      'icons', 'hicolor', size, 'apps'),
    strip_directory: true,
  )
endforeach
