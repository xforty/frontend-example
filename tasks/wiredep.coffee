module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-wiredep')

  build:
    wiredep:
      8: 'wiredep:public_html'
  watch:
    wiredep:
      files: ['bower.json','public/**/*.html']
      tasks: ['wiredep:public_html']
  wiredep:
    public_html:
      src: [ 'public/**/*.html' ]
