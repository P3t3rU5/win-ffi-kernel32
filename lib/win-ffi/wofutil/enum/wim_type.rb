require 'win-ffi/wofutil'

module WinFFI
  module Wofutil
    WimType = enum :wim_type, [
        :OS_WIM,     (0x00000001),
        :NOT_OS_WIM, (0x00000000),
    ]

    define_prefix(:WIM_BOOT, WimType)
  end
end