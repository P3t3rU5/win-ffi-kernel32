require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ConsoleFullscreenMode = enum :console_fullscreen_mode, [
        :FULLSCREEN,          1,
        :FULLSCREEN_HARDWARE, 2,
    ]
  end
end