module.exports = (grunt) ->
  path = require 'path'

  grunt.loadNpmTasks('grunt-contrib-less')

  build:
    less: 'less:compile'
  watch:
    less:
      files: ['css/**/*.less','!css/contrib/**/*.less']
      tasks: ['less:compile']
  less:
    compile:
      config:
        sourceMaps: true
      expand: true
      cwd: 'css'
      src: ['**/*.less','!contrib/**/*.less']
      dest: 'public/css'
      ext: '.css'
