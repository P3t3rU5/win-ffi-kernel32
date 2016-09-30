require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ConsoleSelectionInfoFlag = enum :console_selection_info_flag, [
        :NO_SELECTION,          0x0000,
        :SELECTION_IN_PROGRESS, 0x0001,
        :SELECTION_NOT_EMPTY,   0x0002,
        :MOUSE_SELECTION,       0x0004,
        :MOUSE_DOWN,            0x0008,
    ]

    define_prefix(:CONSOLE, ConsoleSelectionInfoFlag)
  end
end