

' Entry point for App'
function Main(input as Dynamic)

  ' TODO: Deeplinking feature to be added
  constants = GetConstants()

  port = CreateObject("roMessagePort")
  screen = CreateObject("roSGScreen")
  screen.setMessagePort(port)

  scene = screen.CreateScene("BaseScene")
  screen.show()

  ' Listen to any scene port listeners here'

  ' Load first page'
  scene.loadController = { page: constants.CONTROLLERS.HOME, params: { } }

  ' Start the main event loop here'
  mainEventLoop( port )

end function

function mainEventLoop( port )

  while ( true )

    msg = wait(0, port)
    msgType = type(msg)

    ' Handle all the needed events here
    if ( msgType = "roSGScreenEvent" )
      if msg.isScreenClosed() then exit while
    else if ( msgType = "roSGNodeEvent" )
       ' handle SGNode events here
    end if

  end while

end function