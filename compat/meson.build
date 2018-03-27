
functions_checked = [
  'fork',
  'getenv',
  'if_nameindex',
  'if_nametoindex',
  'nanf',
  'newlocale',
  'uselocale',
]

functions_checked_replaced = [
  'aligned_alloc',
  'asprintf',
  'atof',
  'atoll',
  'dirfd',
  'fdopendir',
  'flockfile',
  'freeaddrinfo',
  'fsync',
  'gai_strerror',
  'getdelim',
  'getpid',
  'gettimeofday',
  'gmtime_r',
  'inet_pton',
  'lldiv',
  'localtime_r',
  'memrchr',
  'nrand48',
  'pathconf',
  'poll',
  'realpath',
  'recvmsg',
  'rewind',
  'sendmsg',
  'setenv',
  'sigwait',
  'sincos',
  'strcasecmp',
  'strcasestr',
  'strdup',
  'strndup',
  'strnlen',
  'strsep',
  'strtof',
  'strtok_r',
  'strtoll',
  'strverscmp',
  'swab',
  'tdestroy',
  'tfind',
  'timegm',
  'timespec_get',
  'vasprintf',
]

compat_sources  = [ ]


foreach function : functions_checked
  has_fn = cc.has_function(function)
  conf.set('HAVE_' + function.underscorify().to_upper(), has_fn)
endforeach

foreach function : functions_checked_replaced
  has_fn = cc.has_function(function)
  conf.set('HAVE_' + function.underscorify().to_upper(), has_fn)
  if not has_fn
    compat_sources += [ function + '.c' ]
  endif
endforeach

# Special cases
functions_str = [ 'strlcpy', 'strnstr' ]
foreach function : functions_str
  has_fn = false # cc.has_header_symbol('string.h',  function)
  conf.set('HAVE_' + function.underscorify().to_upper(), has_fn)
  if not has_fn
    compat_sources += [ function + '.c' ]
  endif
endforeach


conf.set('HAVE_CXX_LOCALE_T',     cx.has_header_symbol('locale',        'locale_t'))
conf.set('HAVE_MAX_ALIGN_T',      cx.has_header_symbol('stddef.h',      'max_align_t'))
conf.set('HAVE_STRUCT_POLLFD',    cx.has_header_symbol('stdlib.h',      'struct pollfd'))
conf.set('HAVE_STRUCT_TIMESPEC',  cx.has_header_symbol('time.h',        'struct timespec'))
conf.set('HAVE_THREAD_LOCAL',     cx.has_header_symbol('stdlib.h',      'thread_local'))
conf.set('HAVE_STATIC_ASSERT',    cc.has_header_symbol('assert.h',      'static_assert'))




compat = static_library('compat',
  compat_sources,
  include_directories: rootInclude,
)



test('strnstr',
  executable('strnstr_exe',
    'test/strnstr.c',
    link_with: compat,
    include_directories: rootInclude,

  )

)