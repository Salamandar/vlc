
check_functions = [
  # 'aligned_alloc',
  # 'asprintf',
  # 'atof',
  # 'atoll',
  # 'dirfd',
  # 'fdopendir',
  # 'flockfile',
  # 'freeaddrinfo',
  # 'fsync',
  # 'gai_strerror',
  # 'getdelim',
  # 'getpid',
  # 'gettimeofday',
  # 'gmtime_r',
  # 'inet_pton',
  # 'lldiv',
  # 'localtime_r',
  # 'memrchr',
  # 'nrand48',
  # 'pathconf',
  # 'poll',
  # 'realpath',
  # 'recvmsg',
  # 'rewind',
  # 'sendmsg',
  # 'setenv',
  # 'sigwait',
  # 'sincos',
  # 'strcasecmp',
  # 'strcasestr',
  # 'strdup',
  'strlcpy',
  # 'strndup',
  # 'strnlen',
  'strnstr',
  # 'strsep',
  # 'strtof',
  # 'strtok_r',
  # 'strtoll',
  # 'strverscmp',
  # 'swab',
  # 'tdestroy',
  # 'tfind',
  # 'timegm',
  # 'timespec_get',
]

fallback_implems_to_use = [ ]

foreach function : check_functions
  if not cc.has_function(function)
    fallback_implems_to_use += [ function + '.c' ]
  endif
endforeach

compat_library = static_library('compat',
  fallback_implems_to_use,
  include_directories: rootInclude,
)



test('strnstr',
  executable('strnstr_exe',
    'test/strnstr.c',
    link_with: compat_library,
    include_directories: rootInclude,

  )

)