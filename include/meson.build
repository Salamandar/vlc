subdir('vlc')

configure_file(
  output: 'vlc_about.h',
  command: [
    find_program('bash'),
    join_paths(meson.current_source_dir(), 'gen_vlc_about.sh'),
    meson.source_root(),
  ],
  capture: true,
)


###############################################################################
# GIT revision

vcs_tag(
  input : 'revision.h.in',
  output: 'revision.h',
  command: [
    'git', '--git-dir=@0@/.git'.format(meson.source_root()),
    'describe', '--tags', '--long', '--match', '?.*.*', '--always',
  ],
)
