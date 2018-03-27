libvlccore_sources += files(
  'access.c',
  'clock.c',
  'control.c',
  'decoder.c',
  'demux.c',
  'demux_chained.c',
  'es_out.c',
  'es_out_timeshift.c',
  'event.c',
  'input.c',
  'item.c',
  'meta.c',
  'resource.c',
  'services_discovery.c',
  'stats.c',
  'stream.c',
  'stream_extractor.c',
  'stream_fifo.c',
  'stream_filter.c',
  'stream_memory.c',
  'subtitles.c',
  'var.c',
)

if get_option('vlm')
  libvlccore_sources += files(
    'vlm_event.c',
    'vlm.c',
    'vlmshell.c',
  )
  libvlccore_cflags += [ '-DENABLE_VLM' ]
endif
