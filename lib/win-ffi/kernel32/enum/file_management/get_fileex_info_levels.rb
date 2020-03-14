module WinFFI
  module Kernel32
    GET_FILEEX_INFO_LEVELS = enum :get_fileex_info_levels, [:InfoStandard, :MaxInfoLevel]

    define_prefix(:GetFileEx, GET_FILEEX_INFO_LEVELS, true)
  end
end