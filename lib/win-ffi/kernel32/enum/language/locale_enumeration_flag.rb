module WinFFI
  module Kernel32
    # Locale Enumeration Flags.
    LocaleEnumerationFlag = enum :locale_enumeration_flag, [
        :INSTALLED,       0x00000001,
        :SUPPORTED,       0x00000002,
        :ALTERNATE_SORTS, 0x00000004,
    ]

    define_prefix(:LCID, LocaleEnumerationFlag)
  end
end