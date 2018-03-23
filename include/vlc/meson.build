
configure_file(
  input : 'libvlc_version.h.in',
  output: 'libvlc_version.h',
  configuration: conf,
)


install_headers([
    'deprecated.h',
    'libvlc_dialog.h',
    'libvlc_events.h',
    'libvlc_media_discoverer.h',
    'libvlc_media_library.h',
    'libvlc_media_list_player.h',
    'libvlc_media_list.h',
    'libvlc_media_player.h',
    'libvlc_media.h',
    'libvlc_renderer_discoverer.h',
    'libvlc_vlm.h',
    'libvlc.h',
    'vlc.h',
  ],
  subdir: 'vlc',
)
