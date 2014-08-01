define ['processing'], (Processing) ->
  class App
    constructor: (document) ->
      element = document.getElementById("processing")
      @processing = new Processing element, (P) => @setup(P)


    setup: (P) ->
      width = 1000
      size = 15
      P.size width, 100
      x = 0
      y = 50
      dir = 1
      P.draw = ->
        P.background 255, 255,255
        P.fill 0,0,0
        P.ellipse x, y, size, size
        speed = dir * Math.max((width/2 - Math.abs(width/2 - x))/25,1)
        x += speed
        dir = -1 if dir == 1  and x >= (width-size)
        dir = 1  if dir == -1 and x <= size
