module.exports = (grunt) ->
  bower = require 'bower'
  wiredep = require 'wiredep'
  path = require 'path'

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-bower-requirejs')
  grunt.loadNpmTasks('grunt-contrib-jade')

  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-connect')

  grunt.registerTask('default',['build'])

  grunt.registerTask('build',['bower_install', 'bower:configure', 'coffee:compile', 'bower_css', 'jade:compile'])
  grunt.registerTask('dev',['default', 'connect','watch'])

  grunt.registerTask 'bower_install', 'Install bower modules', ->
    done = @async()
    bower.commands.install().on 'end', (results) ->
      for name, info of results
        grunt.log.writeln "Installed #{name} #{info.pkgMeta.version}".cyan
      done()

  grunt.registerMultiTask 'bower_css', 'Configure loading of css files', ->
    content = ''
    deps = wiredep directory: bower.config.directory
    if deps?.css?
      for css_full_path in deps.css
        css_path = path.relative 'www/', css_full_path
        content += "link(rel='stylesheet', href='#{css_path}')"
    grunt.file.write(@data.out,content)


  grunt.initConfig
    watch:
      coffee:
        files: 'src/*.coffee'
        tasks: ['coffee:compile']
      bower:
        files: 'bower.json'
        tasks: ['bower_install', 'bower']

    coffee:
      compile:
        expand: true,
        flatten: true,
        cwd: "#{__dirname}",
        src: ['src/*.coffee'],
        dest: 'www/js/',
        ext: '.js'

    bower:
      configure:
        rjsConfig: 'www/js/bower.js'

    bower_css:
      target:
        out: 'tmp/stylesheets.jade'

    connect:
      server:
        options:
          port: 8888
          base: 'www'

    jade:
      compile:
        options:
          data:
            debug: false
         files: [
           expand: true
           cwd: "views/"
           src: ["**.jade"]
           dest: "www/"
           ext: ".html"
         ]

