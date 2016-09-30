require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Input Mode flags:
    InputModeFlag = enum :input_mode_flag, [
        :PROCESSED_INPUT,        0x0001,
        :LINE_INPUT,             0x0002,
        :ECHO_INPUT,             0x0004,
        :WINDOW_INPUT,           0x0008,
        :MOUSE_INPUT,            0x0010,
        :INSERT_MODE,            0x0020,
        :QUICK_EDIT_MODE,        0x0040,
        :EXTENDED_FLAGS,         0x0080,
        :AUTO_POSITION,          0x0100,
        :VIRTUAL_TERMINAL_INPUT, 0x0200,
    ]

    define_prefix(:ENABLE, InputModeFlag)
  end
end