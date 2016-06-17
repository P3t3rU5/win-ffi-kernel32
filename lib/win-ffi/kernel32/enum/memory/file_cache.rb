require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    FileCache = enum :file_cache, [
        :FLAGS_DEFINED,
        :MAX_HARD_ENABLE,  0x00000001,
        :MAX_HARD_DISABLE, 0x00000002,
        :MIN_HARD_ENABLE,  0x00000004,
        :MIN_HARD_DISABLE, 0x00000008,
    ]
  end
end