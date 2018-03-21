
project('vlc',
  [ 'c', 'cpp' ],
  default_options : ['c_std=c11', 'cpp_std=c++11'],
  version: '4.0.0',
  license: 'Copyright 1999-2018 VLC authors and VideoLAN',
  meson_version: '>=0.40.0',
)

################################################################################
# Version information

version_rev = 0
version_info= 'dev'
version_codename = 'Otto Chriek'

copyright_years = '-'.join([ '1996', '2018' ])

################################################################################
# Configuration

conf = configuration_data()

cc = meson.get_compiler('c')
cx = meson.get_compiler('cpp')

c_args = [ ]
l_args = [ ]

windows = import('windows')
i18n    = import('i18n')

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
  '-D_FORTIFY_SOURCE=2',    # Define to 2 to get glibc warnings.
  '-D_FILE_OFFSET_BITS=64', # Define to 64 for large files support.

  '-D_THREAD_SAFE',         # Same as _REENTANT for some other OSes.
  '-D__LIBVLC__',           # Define within the LibVLC source code tree.
  '-DWIN32_LEAN_AND_MEAN',  # Define to limit the scope of <windows.h>.
]


type = 'max_align_t'
conf.set('HAVE_' + type.underscorify().to_upper(), cc.has_header_symbol('stddef.h', type))
type = 'gettimeofday'
conf.set('HAVE_' + type.underscorify().to_upper(), cc.has_header_symbol('sys/time.h', type))
type = 'struct timespec'
conf.set('HAVE_' + type.underscorify().to_upper(), cc.has_header_symbol('time.h', type))

################################################################################
# Check for tools

desktop_file_validate = find_program('desktop-file-validate')




################################################################################
# Check for the 'contrib' directory
# TODO


################################################################################
# Sources


configure_file(
  output: 'config_definitions.h',
  configuration: conf,
)
add_project_arguments(
  '-DHAVE_CONFIG_H',
  language: [ 'c', 'cpp' ]
)


rootInclude = include_directories('.', 'include')

subdir('compat')

# 330

