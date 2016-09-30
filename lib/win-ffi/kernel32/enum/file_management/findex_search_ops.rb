require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    FINDEX_SEARCH_OPS = enum :findex_info_levels, [
        :NameMatch,
        :LimitToDirectories,
        :LimitToDevices,
        :MaxSearchOp
    ]

    define_prefix(:FindExSearch, FINDEX_SEARCH_OPS, true)
  end
end