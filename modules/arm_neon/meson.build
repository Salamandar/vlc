if false # neon

shared_library('chroma_yuv_neon_plugin',
  [
    'chroma_yuv.c',
    'deinterleave_chroma.S',
    'i420_yuyv.S',
    'i422_yuyv.S',
    'yuyv_i422.S',
  ],
  install_dir: plugin_dir,
)
shared_library('volume_neon_plugin',
  [
    'amplify.S',
    'volume.c'
  ],
  install_dir: plugin_dir,
)
shared_library('yuv_rgb_neon_plugin',
  [
    'i420_rgb.S',
    'i420_rv16.S',
    'nv12_rgb.S',
    'nv21_rgb.S',
    'yuv_rgb.c',
  ],
  install_dir: plugin_dir,
)

endif
