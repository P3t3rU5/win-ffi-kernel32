require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    FilePosition = enum :file_position, [
        :BEGIN,   0,
        :CURRENT, 1,
        :END,     2,
    ]
  end
end