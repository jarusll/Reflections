reflections_sources = [
  'main.vala',
  'window.vala',
  'application.vala',
  'requests.vala'
]

reflections_deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
  dependency('libsoup-2.4'),
]

gnome = import('gnome')

reflections_sources += gnome.compile_resources('reflections-resources',
  'reflections.gresource.xml',
  c_name: 'reflections'
)

executable('reflections', reflections_sources,
  vala_args: '--target-glib=2.50',  dependencies: reflections_deps,
  install: true,
)
