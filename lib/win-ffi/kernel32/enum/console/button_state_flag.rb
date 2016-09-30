require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # ButtonState flags
    ButtonStateFlag = enum :button_state_flag, [
        :FROM_LEFT_1ST_BUTTON_PRESSED, 0x0001,
        :RIGHTMOST_BUTTON_PRESSED,     0x0002,
        :FROM_LEFT_2ND_BUTTON_PRESSED, 0x0004,
        :FROM_LEFT_3RD_BUTTON_PRESSED, 0x0008,
        :FROM_LEFT_4TH_BUTTON_PRESSED, 0x0010,
    ]
  end
end