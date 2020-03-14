require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ThreadMode = enum :thread_mode, [
        :BACKGROUND_BEGIN, 0x00010000,
        :BACKGROUND_END,   0x00020000
    ]
  end
end