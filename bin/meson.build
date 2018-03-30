if get_option('build-vlc')

vlc_sources = [ ]
vlc_deps    = [ ]
vlc_cflags  = [ ]
vlc_links   = [ ]

vlc_links += libvlc
vlc_deps  += [ threads, dl, ]


if platform_win64
  vlc_sources += files(
    'winvlc.c',
    'vlc_win32_rc',
  )

  if have_breakpad
    vlc_sources += files('breakpad.cpp')
  endif
elif platform_osx
  vlc_sources += files(
    'darwinvlc.m',
  )
  # vlc_osx_LDFLAGS = $(LDFLAGS_vlc) -Wl,-framework,CoreFoundation,-framework,Cocoa
  # vlc_osx_LDFLAGS += -Xlinker -rpath -Xlinker "@executable_path/lib/"
  # vlc_osx_LDFLAGS += -Xlinker -rpath -Xlinker "@executable_path/plugins/"
  # -Wl,-framework,Breakpad

else
  vlc_sources += files(
    'vlc.c',
    'override.c',
  )
endif


vlc_exe = executable('vlc',
  vlc_sources,
  include_directories : rootInclude,
  c_args:       vlc_cflags,
  cpp_args:     vlc_cflags,
  link_with:    vlc_links,
  dependencies: vlc_deps,
)

# Root wrapper
if not (platform_win64 or platform_os2)
  vlc_root_wrapper = executable('vlc-wrapper',
    'rootwrap.c',
    include_directories: rootInclude,
  )
endif

if have_dynamic_libs
  # Plug-ins cache generator
  vlc_cache_gen = executable('vlc-cache-gen',
    [ 'cachegen.c', ],
    include_directories: rootInclude,
    link_with: [
      compat,
      libvlc,
    ],
  )

endif

# vlc_win32_rc.rc: $(top_builddir)/config.status vlc_win32_rc.rc.in
# 	cd "$(top_builddir)" && \
# 	$(SHELL) ./config.status --file="bin/$@"
#
# vlc_win32_rc.$(OBJEXT): vlc_win32_rc.rc $(top_srcdir)/extras/package/win32/vlc.exe.manifest
# 	$(WINDRES) --include-dir $(top_srcdir)/share/icons --include-dir $(top_srcdir)/extras/package/win32 -i $< -o $@
endif
