require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # ControlKeyState flags
    ControlKeyState = enum :control_key_state, [
        :RIGHT_ALT_PRESSED,  0x0001,
        :LEFT_ALT_PRESSED,   0x0002,
        :RIGHT_CTRL_PRESSED, 0x0004,
        :LEFT_CTRL_PRESSED,  0x0008,
        :SHIFT_PRESSED,      0x0010,
        :NUMLOCK_ON,         0x0020,
        :SCROLLLOCK_ON,      0x0040,
        :CAPSLOCK_ON,        0x0080,
        :ENHANCED_KEY,       0x0100,
    ]
  end
end