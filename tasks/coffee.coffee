module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')

  build:
    coffee: 'coffee:compile'
  watch:
    coffee:
      files: ['js/**/*.coffee','!contrib/js/**/*.coffee']
      tasks: ['coffee:compile']
  coffee:
    compile:
      expand: true,
      cwd: "js",
      src: ['**/*.coffee','!contrib/**/*.coffee'],
      dest: 'public/js/',
      ext: '.js'
