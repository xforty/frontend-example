module.exports = (grunt) ->
  bower = require 'bower'
  path = require 'path'

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-bower-requirejs')
  grunt.loadNpmTasks('grunt-contrib-jade')
  grunt.loadNpmTasks('grunt-wiredep')

  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-express-server')

  grunt.registerTask('default',['build'])

  grunt.registerTask('build',['bower_install', 'bowerRequirejs', 'coffee:compile', 'jade:compile', 'wiredep'])
  grunt.registerTask('dev',['default', 'express:dev','watch'])

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
        css_path = path.relative 'public/', css_full_path
        content += "link(rel='stylesheet', href='#{css_path}')"
    grunt.file.write(@data.out,content)


  grunt.initConfig
    watch:
      coffee:
        files: 'src/*.coffee'
        tasks: ['coffee:compile']
      bower:
        files: 'bower.json'
        tasks: ['bower_install', 'bowerRequirejs']
      jade:
        files: 'views/*.jade'
        tasks: ['jade:compile', 'wiredep']
      server:
        files: 'server/**/*.coffee'
        tasks: ['express:dev']
        options:
          spawn: false

    coffee:
      compile:
        expand: true,
        flatten: true,
        cwd: "#{__dirname}",
        src: ['src/*.coffee'],
        dest: 'public/js/',
        ext: '.js'

    bowerRequirejs:
      configure:
        rjsConfig: 'public/js/bower.js'

    wiredep:
      html:
        src: [ 'public/**/*.html' ]

    express:
      options:
        port: 8888
        bases: 'public'
      dev:
        options:
          script: path.resolve(__dirname,'app.js')

    jade:
      compile:
        options:
          data:
            debug: false
         files: [
           expand: true
           cwd: "views/"
           src: ["**.jade"]
           dest: "public/"
           ext: ".html"
         ]

