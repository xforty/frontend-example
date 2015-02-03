module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')

  build:
    coffee: 'coffee:compile'
  watch:
    coffee:
      files: 'scripts/*.coffee'
      tasks: ['coffee:compile']
  coffee:
    compile:
      expand: true,
      flatten: true,
      cwd: "#{__dirname}",
      src: ['scripts/*.coffee'],
      dest: 'public/js/',
      ext: '.js'
