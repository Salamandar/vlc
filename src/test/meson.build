headers_test_headerlist = [ ]
foreach header : [ 'vlc.h' ]
  headers_test_headerlist += '#include <vlc/@0@>'.format(header)
endforeach

headers_test_conf = configuration_data()
headers_test_conf.set('HEADER_INCLUDES', '\n'.join(headers_test_headerlist))
headers_test = configure_file(
  input : 'headers.c.in',
  output: 'headers.c',
  configuration: headers_test_conf,
)


tests = [
  'block_test',
  'dictionary',
  'headers',
  'i18n_atof',
  'interrupt',
  'md5',
  'mrl_helpers',
  'picture_pool',
  'sort',
  'timer',
  'url',
  'utf8',
  'xmlent',
]

foreach test : tests
  test_file = test == 'headers' ? headers_test : (test + '.c')

  test(test,
    executable(test, test_file,
      include_directories: rootInclude,
      link_with: libvlccore,
    ),
  )
endforeach
