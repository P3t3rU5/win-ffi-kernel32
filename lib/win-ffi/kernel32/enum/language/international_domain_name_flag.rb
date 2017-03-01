require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # IDN (International Domain Name) Flags
      InternationalDomainNameFlag = enum :international_domain_name_flag, [
          :ALLOW_UNASSIGNED,     0x01,
          :USE_STD3_ASCII_RULES, 0x02,
          :EMAIL_ADDRESS,        0x04,
          :RAW_PUNYCODE,         0x08,
      ]

      define_prefix(:IDN, InternationalDomainNameFlag)
    end
  end
end