module WinFFI
  module Kernel32
    STREAM_INFO_LEVELS = enum :stream_info_levels, [:Standard, :MaxInfoLevel]

    define_prefix(:FindStreamInfo, STREAM_INFO_LEVELS)
  end
end