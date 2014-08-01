require.config
  # Loads generated bower config
  shim:
    bower: {}
  deps: ['bower']

  # Main entry point of app
  callback: ->
    require ['app'], (App) ->
      window.app = new App
