require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # EventFlags
    buffer = [
        :MOUSE_MOVED,   0x0001,
        :DOUBLE_CLICK,  0x0002,
        :MOUSE_WHEELED, 0x0004,
    ]

    buffer += [:MOUSE_HWHEELED, 0x0008] if WindowsVersion >= :vista

    EventFlag = enum :event_flag, buffer
  end
end