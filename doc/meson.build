
install_man([
  'vlc-wrapper.1',
  'vlc.1',
])

doc_dir = join_paths(get_option('datadir'), 'doc', 'vlc')

install_subdir('libvlc',
  install_dir: doc_dir,
)

install_data([
    'fortunes.txt',
  ],
  install_dir: doc_dir,
)


################################################################################
# Doxygen
doxyfile_conf = configuration_data()
doxyfile_conf.set('VERSION', meson.project_version())
doxyfile_conf.set('top_srcdir', meson.source_root())


doxyfile = configure_file(
  input : 'Doxyfile.in',
  output: 'Doxyfile',
  configuration: doxyfile_conf,
)

run_target('doc',
  command: [
    find_program('doxygen'), doxyfile,
  ],
)

################################################################################
# Changelogs

years = [
  '1999',
  '2000',
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2006',
  '2007',
  '2008',
  '2009',
  '2010',
  '2011',
  '2012',
  '2013',
  '2014',
  '2015',
  '2016',
  '2017',
  '2018',
]
changelog_targets = []
foreach year : years
  changelog_targets += custom_target('changelogs_@0@'.format(year),
    output: 'ChangeLog-@0@'.format(year),
    command: [
      'git', '--git-dir=@0@/.git'.format(meson.source_root()),
      'log',
      '--since=@0@-01-01'.format(year),
      '--until=@0@-12-31 23:00:00 -0100'.format(year),
    ],
    capture: true,
  )
endforeach

run_target('changelogs',
  depends: changelog_targets,
  command: [ 'true' ],
)
