require_relative 'coord'
require_relative '../../enum/console/button_state_flag'
require_relative '../../enum/console/control_key_state'
require_relative '../../enum/console/event_flag'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/console/mouse-event-record-str
    class MOUSE_EVENT_RECORD < FFIAdditions::Struct
      attr_accessor :dwMousePosition, :dwButtonState, :dwControlKeyState, :dwEventFlags

      layout dwMousePosition:   COORD,
             dwButtonState:     ButtonStateFlag,
             dwControlKeyState: ControlKeyState,
             dwEventFlags:      EventFlag
    end
  end
end