Dim Message, Speak
          Message=InputBox("Type anything into the box below and then Mr. Speak will talk.","Mr. Speak by Ethan Arterberry")
          Set Speak=CreateObject("sapi.spvoice")
          Speak.Speak Message
'Retrieved from https://www.mediafire.com/?88l4x4lrt47j0ba
