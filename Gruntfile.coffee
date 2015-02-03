module.exports = (grunt) ->
  _ = require 'lodash'

  grunt.registerTask('default',['build'])

  grunt.registerTask('dev',['build', 'express:dev', 'watch'])

  config = {}
  loadConfig = (name) =>
    _.merge(config,require(path.resolve("tasks",name))(grunt))

  loadConfig 'base'
  loadConfig 'bower'
  loadConfig 'wiredep'

  loadConfig 'coffee'
  loadConfig 'jade'

  grunt.initConfig config
