module WinFFI
  if WINDOWS_VERSION >= :vista
    # Named based enumeration flags
    module Kernel32
      buffer = [
          :ALL,                      0,
          :WINDOWS,         0x00000001,
          :SUPPLEMENTAL,    0x00000002,
          :ALTERNATE_SORTS, 0x00000004,
          :REPLACEMENT,     0x00000008,
      ]

      if WINDOWS_VERSION >= 7
        buffer += [
            :NEUTRALDATA,  0x00000010,
            :SPECIFICDATA, 0x00000020,
        ]
      end

      NamedBasedEnumerationFlag = enum :named_based_enumeration_flag, buffer

      define_prefix(:LOCALE, NamedBasedEnumerationFlag)
    end
  end
end