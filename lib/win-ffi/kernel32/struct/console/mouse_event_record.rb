require 'win-ffi/kernel32/struct/console/coord'
require 'win-ffi/kernel32/enum/console/button_state_flag'
require 'win-ffi/kernel32/enum/console/control_key_state'
require 'win-ffi/kernel32/enum/console/event_flag'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684239(v=vs.85).aspx
    class MOUSE_EVENT_RECORD < FFIAdditions::Struct
      layout dwMousePosition:             COORD,
             dwButtonState:     ButtonStateFlag,
             dwControlKeyState: ControlKeyState,
             dwEventFlags:            EventFlag
    end
  end
end