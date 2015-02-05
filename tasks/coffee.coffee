module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')

  build:
    coffee: 'coffee:compile'
  watch:
    coffee:
      files: 'js/**/*.coffee'
      tasks: ['coffee:compile']
  coffee:
    compile:
      expand: true,
      flatten: true,
      cwd: "#{__dirname}",
      src: ['js/**/*.coffee'],
      dest: 'public/js/',
      ext: '.js'
