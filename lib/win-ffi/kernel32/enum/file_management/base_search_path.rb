require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    BaseSearchPath = enum :base_search_path, [
        :ENABLE_SAFE_SEARCHMODE,      0x1,
        :DISABLE_SAFE_SEARCHMODE, 0x10000,
        :PERMANENT,                0x8000,
        :INVALID_FLAGS,          ~0x18001,
    ]

    define_prefix(:BASE_SEARCH_PATH, BaseSearchPath)
  end
end