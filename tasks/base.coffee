module.exports = (grunt) ->
  path = require 'path'

  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-express-server')

  grunt.registerTask 'build', 'Build all assets for site', ->
    config = grunt.config('build')
    orderedTasks = {}
    addTasks = (phase,tasks) ->
      orderedTasks[phase] ?= []
      Array.prototype.push.apply orderedTasks[phase], tasks

    for own target, tasks of config
      if typeof tasks == 'string'
        tasks = [tasks]
      if tasks instanceof Array
        addTasks 5, tasks
      else
        for own phase, phaseTasks of tasks
          if typeof phaseTasks == 'string'
            phaseTasks = [phaseTasks]
          addTasks phase, phaseTasks

    for phase in [0..9]
      if orderedTasks[phase]
        for tasks in orderedTasks[phase]
          grunt.task.run tasks


  watch:
    server:
      files: ['server/**/*', 'app.js']
      tasks: ['express:dev']
      options:
        spawn: false
  express:
    options:
      port: 8888
      output: 'server started'
    dev:
      options:
        script: 'app.js'
