reflections_sources = [
  'main.vala',
  'window.vala',
  'application.vala',
  'igdb.vala'
]

reflections_deps = [
  dependency('libadwaita-1', version: '>= 1.0'),
  dependency('libsoup-3.0'),
  dependency('json-glib-1.0'),
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
