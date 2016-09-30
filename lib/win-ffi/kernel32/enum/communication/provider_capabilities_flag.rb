require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Provider capabilities flags.
    ProviderCapabilitiesFlag = enum :provider_capabilities_flag, [
        :DTRDSR,        0x0001,
        :RTSCTS,        0x0002,
        :RLSD,          0x0004,
        :PARITY_CHECK,  0x0008,
        :XONXOFF,       0x0010,
        :SETXCHAR,      0x0020,
        :TOTALTIMEOUTS, 0x0040,
        :INTTIMEOUTS,   0x0080,
        :SPECIALCHARS,  0x0100,
        :'16BITMODE',   0x0200,
    ]

    define_prefix(:PCF, ProviderCapabilitiesFlag)
  end
end