module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-contrib-copy')
  assetFiles = ['js/**/*.js','css/**/*.css','!js/contrib/**/*.js','!css/contrib/**/*.css']

  build:
    copy: ['copy:html','copy:assets']
  watch:
    copy_assets:
      files: assetFiles
      tasks: ['copy:assets']
    copy_html:
      files: ['html/**/*.html','!html/contrib/**/*.html']
      tasks: ['copy:html']
  copy:
    assets:
      src: assetFiles
      expand: true,
      dest: 'public/',
    html:
      src: ['**/*.html','!contrib/**/*.html']
      expand: true,
      cwd: "html",
      dest: 'public/',
