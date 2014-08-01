require.config
  # Loads generated bower config
  shim:
    bower: {}
    processing:
      exports: 'Processing'
  deps: ['bower']

  # Main entry point of app
  callback: ->
    require ['app'], (App) ->
      window.app = new App document
