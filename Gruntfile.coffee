module.exports = (grunt) ->
  _ = require 'lodash'
  path = require 'path'

  grunt.registerTask('default',['build'])

  grunt.registerTask('dev',['build', 'express:dev', 'watch'])

  config = {}
  loadConfig = (name) =>
    _.merge(config,require(path.resolve("tasks",name))(grunt))

  loadConfig 'base'
  loadConfig 'bower'
  loadConfig 'wiredep'
  loadConfig 'copy'

  loadConfig 'coffee'
  loadConfig 'jade'

  grunt.initConfig config
