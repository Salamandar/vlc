libvlccore_sources += files(
  'actions.c',
  'addons.c',
  'background_worker.c',
  'block.c',
  'cpu.c',
  'epg.c',
  'error.c',
  'es_format.c',
  'events.c',
  'exit.c',
  'fifo.c',
  'filter.c',
  'filter_chain.c',
  'fingerprinter.c',
  'fourcc.c',
  'httpcookies.c',
  'image.c',
  'interrupt.c',
  'keystore.c',
  'md5.c',
  'messages.c',
  'mime.c',
  'mtime.c',
  'objects.c',
  'objres.c',
  'picture.c',
  'picture_fifo.c',
  'picture_pool.c',
  'probe.c',
  'rand.c',
  'renderer_discovery.c',
  'subpicture.c',
  'text_style.c',
  'threads.c',
  'variables.c',
  'xml.c',
)


fourcc_gen = executable('fourcc_gen',
  'fourcc_gen.c',
  include_directories: [ rootInclude, srcInclude ],
)

fourcc_tables = custom_target('fourcc_tables.h',
  output: 'fourcc_tables.h',
  command: [ fourcc_gen ],
  capture: true,
)
libvlccore_sources += fourcc_tables


if get_option('update-check')
  libvlccore_sources += files(
    'update.c',
    'update_crypto.c',
  )
  libvlccore_cflags += [
    '-DUPDATE_CHECK',
  ]
  libvlccore_deps += [
    # gcrypt,
  ]
endif
