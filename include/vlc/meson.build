
libvlc_version_h = configure_file(
  input : 'libvlc_version.h.in',
  output: 'libvlc_version.h',
  configuration: conf,
)

vlc_headers = [
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
  libvlc_version_h,
  'vlc.h',
]

install_headers(vlc_headers,
  subdir: 'vlc',
)
