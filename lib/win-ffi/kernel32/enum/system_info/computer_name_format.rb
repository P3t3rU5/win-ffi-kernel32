require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724224(v=vs.85).aspx
    COMPUTER_NAME_FORMAT = enum :computer_name_format, [
        :NameNetBIOS,
        :NameDnsHostname,
        :NameDnsDomain,
        :NameDnsFullyQualified,
        :NamePhysicalNetBIOS,
        :NamePhysicalDnsHostname,
        :NamePhysicalDnsDomain,
        :NamePhysicalDnsFullyQualified,
        :NameMax
    ]

    define_prefix(:Computer, COMPUTER_NAME_FORMAT, true)
  end
end