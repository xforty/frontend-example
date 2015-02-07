module.exports = (grunt) ->
  bower = require 'bower'

  grunt.registerTask 'bower_install', 'Install bower modules', ->
    done = @async()
    bower.commands.install().on 'end', (results) ->
      for name, info of results
        grunt.log.writeln "Installed #{name} #{info.pkgMeta.version}".cyan
      done()

  build:
    bower:
     3: 'bower_install'
  watch:
    bower:
      files: 'bower.json'
      tasks: ['bower_install']
