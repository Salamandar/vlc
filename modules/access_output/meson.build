
shared_library('access_output_dummy_plugin',
  'dummy.c',
  include_directories: rootInclude,
  install_dir: plugin_dir,
)

shared_library('access_output_file_plugin',
  'file.c',
  dependencies: [
    # thread,
  ],
  include_directories: rootInclude,
  install_dir: plugin_dir,
)

shared_library('access_output_http_plugin',
  'http.c',
  include_directories: rootInclude,
  install_dir: plugin_dir,
)

if true # gcrypt
shared_library('access_output_livehttp_plugin',
  'livehttp.c',
  dependencies: [
    # gcrypt,
  ],
  include_directories: rootInclude,
  install_dir: plugin_dir,
)
endif

shared_library('access_output_shout_plugin',
  'shout.c',
  dependencies: [
    # shout,
    # socket,
  ],
  include_directories: rootInclude,
  install_dir: plugin_dir,
)

shared_library('access_output_srt_plugin',
  'srt.c',
  dependencies: [
    # src,
    # threads,
  ],
  include_directories: rootInclude,
  install_dir: plugin_dir,
)

shared_library('access_output_udp_plugin',
  'udp.c',
  dependencies: [
    # socket,
  ],
  include_directories: rootInclude,
  install_dir: plugin_dir,
)
