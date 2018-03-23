
project('vlc',
  [ 'c', 'cpp' ],
  default_options : ['c_std=gnu11', 'cpp_std=c++11'],
  version: '4.0.0',
  license: 'Copyright 1999-2018 VLC authors and VideoLAN',
  meson_version: '>=0.40.0',
)

################################################################################
# Configuration

conf = configuration_data()

cc = meson.get_compiler('c')
cx = meson.get_compiler('cpp')

c_args = [ ]
l_args = [ ]

windows   = import('windows')
i18n      = import('i18n')
pkgconfig = import('pkgconfig')

################################################################################
# Version information

version_rev = 0
version_dev= 'dev'
version_codename = 'Otto Chriek'

copyright_years = '-'.join([ '1996', '2018' ])
copyright_message = 'Copyright © @0@ the VideoLAN team'.format(copyright_years)


conf.set_quoted('PACKAGE_VERSION', meson.project_version())
conf.set_quoted('VERSION',         meson.project_version())
conf.set_quoted('PACKAGE_NAME',    meson.project_name())
conf.set_quoted('VERSION_MESSAGE', meson.project_version()+' '+version_codename)


version_split = meson.project_version().split('.')
conf.set('VERSION_MAJOR',   version_split[0])
conf.set('VERSION_MINOR',   version_split[1])
conf.set('VERSION_REVISION',version_split[2])


conf.set_quoted('COPYRIGHT_MESSAGE',        copyright_message)
conf.set_quoted('COPYRIGHT_YEARS',          copyright_years)
conf.set_quoted('CONFIGURE_LINE',           '')
conf.set_quoted('PACKAGE_VERSION_MAJOR',    version_split[0])
conf.set_quoted('PACKAGE_VERSION_MINOR',    version_split[1])
conf.set_quoted('PACKAGE_VERSION_REVISION', '@0@'.format(version_rev))
conf.set_quoted('PACKAGE_VERSION_EXTRA',    version_split[2])
conf.set_quoted('PACKAGE_VERSION_DEV',      version_dev)


conf.set_quoted('VLC_COMPILE_BY',    run_command('whoami').stdout().strip())
conf.set_quoted('VLC_COMPILE_HOST',  run_command('hostname', '-f').stdout().strip())
conf.set_quoted('VLC_COMPILER',      cc.get_id())



conf.set_quoted('SYSDATADIR',    get_option('datadir'))
conf.set_quoted('LIBDIR',        get_option('libdir'))
conf.set_quoted('LIBEXECDIR',    get_option('libexecdir'))
conf.set_quoted('LOCALEDIR',     get_option('localedir'))
conf.set_quoted('PKGDATADIR',    join_paths(get_option('datadir'),   meson.project_name()))
conf.set_quoted('PKGLIBDIR',     join_paths(get_option('libdir'),    meson.project_name()))
conf.set_quoted('PKGLIBEXECDIR', join_paths(get_option('libexecdir'),meson.project_name()))


################################################################################
# Check for the operating system

platform_win64 = host_machine.system() == 'windows'
platform_osx   = host_machine.system() == 'darwin'
platform_linux = host_machine.system() == 'linux'
platform_bsd   = host_machine.system() == 'bsd'

# Test for Android
platform_android = cc.run('''
#ifndef __ANDROID__
#error "Not Android"
#endif
int main() { return 0; }
''').compiled()

# Test for Tizen
platform_tizen = cc.run('''
#include <tizen.h>
int main() { return 0; }
''').compiled()



system_libs = []

if platform_bsd
  system_libs += cc.find_library('pthread')
endif

if platform_osx
  c_args += [ '-D_INTL_REDIRECT_MACROS' ]
  l_args += [ '-Wl,-headerpad_max_install_names' ]

  os_detect = cc.run('''
    #import <TargetConditionals.h>
    int main() {
      #if   TARGET_OS_IPHONE
      return 1;
      #elif TARGET_OS_TV
      return 2;
      #endif
      return 0;
    }
  ''').returncode()

  if   os_detect == 0
    platform_osx_pc  = true
  elif os_detect == 1
    platform_osx_ios = true
  elif os_detect == 2
    platform_osx_tvos= true
  endif

  if get_option('macosx-sdk') != ''
    c_args += [ '-isysroot',  get_option('macosx-sdk') ]
    l_args += [ '-syslibroot',get_option('macosx-sdk') ]
  endif
  if get_option('macosx-version-min') != ''
    c_args += [ '-mmacosx-version-min=' + get_option('macosx-version-min') ]
    l_args += [ '-mmacosx_version_min=' + get_option('macosx-version-min') ]
  endif
endif

if platform_win64
  # Force gcc to not link to (shared) libgcc_s when detecting C++ dependencies
  # When doing this test with -static-libgcc it will link on (static) libgcc_eh
  l_args += [ '-static-libgcc' ]

  windres = find_program('windres')
  objcopy = find_program('objcopy')
  unix2dos= find_program('unix2dos')

  c_args += [
    '-D_WIN32_WINNT=0x0601',      # Define to '0x0601' for Windows 7 APIs.
    '-D_WIN32_IE=0x0600',         # Define to '0x0600' for IE 6.0 (and shell) APIs.
    '-D_UNICODE=1',               # Define to 1 for Unicode (Wide Chars) APIs.
    '-DUNICODE=1',                # Define to 1 for Unicode (Wide Chars) APIs.
    '-D_ISOC99_SOURCE=1',         # Extensions to ISO C89 from ISO C99.
    '-D_ISOC11_SOURCE=1',         # Extensions to ISO C99 from ISO C11.
    '-D_POSIX_SOURCE=1',          # IEEE Std 1003.1.
    '-D_POSIX_C_SOURCE=200809L',  # IEEE Std 1003.1.
    '-D_XOPEN_SOURCE=700',        # POSIX and XPG 7th edition.
    '-D_XOPEN_SOURCE_EXTENDED=1', # XPG things and X/Open Unix extensions.
    '-D_BSD_SOURCE=1',            # ISO C, POSIX, and 4.3BSD things.
    '-D_SVID_SOURCE=1',           # ISO C, POSIX, and SVID things.
  ]
  # AH_TOP([#if defined(_WIN32) && !defined(_WIN32_WINNT)])
  # AH_TOP([# define _WIN32_WINNT 0x0601 /* Windows 7 */])
  # AH_TOP([#endif])

  # if test "${SYS}" = "mingw32"; then
  #     # DEP, ASLR, NO SEH
  #     LDFLAGS="${LDFLAGS} -Wl,--nxcompat -Wl,--no-seh -Wl,--dynamicbase"
  #
  #     AC_CHECK_PROGS(U2D, [unix2dos todos], unix2dos)
  #     ac_default_prefix="`pwd`/_win32"
  #     DESTDIR="`pwd`/_win32/"
  #
  #     dnl
  #     dnl NSIS/MSI Installer prefix and WIN64
  #     dnl
  #     case "${host}" in
  #         amd64*|x86_64*)
  #             HAVE_WIN64="1"
  #             WINDOWS_ARCH="x64"
  #             PROGRAMFILES="PROGRAMFILES64"
  #             LDFLAGS="${LDFLAGS} -Wl,--high-entropy-va -Wl,--image-base,0x140000000"
  #         ;;
  #         *)
  #             WINDOWS_ARCH="x86"
  #             PROGRAMFILES="PROGRAMFILES"
  #         ;;
  #     esac
  #     AC_SUBST(WINDOWS_ARCH)
  #     AC_SUBST(PROGRAMFILES)
  #
  # fi

  conf.set('VLC_WINSTORE_APP', get_option('winstore-app'))
endif


if platform_linux

endif




if platform_osx
  libext = '.dylib'
elif platform_win64
  libext = '.dll'
else
  libext = '.so'
endif
conf.set_quoted('LIBEXT', libext)

################################################################################
# Check for compiler properties


# Allow binary package maintainer to pass a custom string to avoid cache problem
distro_version = get_option('binary-version')


# Prevent clang from accepting unknown flags with a mere warning
c_args += cc.get_supported_arguments([
  '-Werror=unknown-warning-option',
  '-Werror=invalid-command-line-argument',
])


c_args += [
  # '-D_FORTIFY_SOURCE=2',    # Define to 2 to get glibc warnings.
  '-D_FILE_OFFSET_BITS=64', # Define to 64 for large files support.

  '-D_THREAD_SAFE',         # Same as _REENTANT for some other OSes.
  '-D__LIBVLC__',           # Define within the LibVLC source code tree.
  '-DWIN32_LEAN_AND_MEAN',  # Define to limit the scope of <windows.h>.
  '-D_GNU_SOURCE',
]


check_headers = [
  'features.h',
  'netinet_tcp.h',
  'search.h',
  'threads.h',
  'pthread.h',
]

foreach header : check_headers
  conf.set('HAVE_' + header.underscorify().to_upper(), cx.has_header(header))
endforeach


threads = dependency('threads')
dl = cx.find_library('dl')

################################################################################
# Check for tools

desktop_file_validate = find_program('desktop-file-validate')



# TODO
have_dynamic_libs = true

# TODO
have_dbus = true


################################################################################
# Check for the 'contrib' directory
# TODO


################################################################################
# Sources


rootInclude = include_directories('.', 'include')
c_args += [
  '-DHAVE_CONFIG_H'
]
add_project_arguments(c_args, language: [ 'c', 'cpp' ])

# Needs to be here
subdir('compat')

configure_file(
  output: 'config_definitions.h',
  configuration: conf,
)


subdir('include')
subdir('src')
subdir('lib')
subdir('bin')
# 330

