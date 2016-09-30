require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ControlEvent = enum :control_event, [
        :CTRL_C_EVENT,        0,
        :CTRL_BREAK_EVENT,    1,
        :CTRL_CLOSE_EVENT,    2,
        :CTRL_LOGOFF_EVENT,   5,
        :CTRL_SHUTDOWN_EVENT, 6,
    ]
  end
end