module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-contrib-jade')

  build:
    jade: 'jade:compile'
  watch:
    jade:
      files: 'html/**/*.jade'
      tasks: ['jade:compile']
  jade:
    compile:
      options:
        data:
          debug: false
      files: [
        expand: true
        cwd: "html/"
        src: ["**/*.jade"]
        dest: "public/"
        ext: ".html"
      ]
