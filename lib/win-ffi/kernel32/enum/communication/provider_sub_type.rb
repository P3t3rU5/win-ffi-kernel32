module WinFFI
  module Kernel32
    # Provider SubTypes
    ProviderSubType = enum :provider_sub_type, [
        :UNSPECIFIED,    0x00000000,
        :RS232,          0x00000001,
        :PARALLELPORT,   0x00000002,
        :RS422,          0x00000003,
        :RS423,          0x00000004,
        :RS449,          0x00000005,
        :MODEM,          0x00000006,
        :FAX,            0x00000021,
        :SCANNER,        0x00000022,
        :NETWORK_BRIDGE, 0x00000100,
        :LAT,            0x00000101,
        :TCPIP_TELNET,   0x00000102,
        :X25,            0x00000103,
    ]

    define_prefix(:PST, ProviderSubType)
  end
end