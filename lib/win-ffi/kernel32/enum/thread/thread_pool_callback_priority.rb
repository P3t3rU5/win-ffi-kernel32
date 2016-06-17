require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ThreadPoolCallbackPriority = enum :thread_priority_callback_priority, [
        :HIGH,
        :NORMAL,
        :LOW,
        :INVALID,
        :COUNT, 3
    ]
  end
end