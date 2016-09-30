require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    FINDEX_INFO_LEVELS = enum :findex_info_levels, [
        :Standard,
        :Basic,
        :MaxInfoLevel
    ]

    define_prefix(:FindExInfo, FINDEX_INFO_LEVELS, true)
  end
end