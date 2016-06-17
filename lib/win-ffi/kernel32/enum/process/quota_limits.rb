require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    QuotaLimits = enum :quota_limits, [
        :HARDWS_MIN_ENABLE,  0x00000001,
        :HARDWS_MIN_DISABLE, 0x00000002,
        :HARDWS_MAX_ENABLE,  0x00000004,
        :HARDWS_MAX_DISABLE, 0x00000008,
        :USE_DEFAULT_LIMITS, 0x00000010
    ]
  end
end