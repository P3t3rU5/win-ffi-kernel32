require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    buffer = [
        :LOWERCASE, 0x00000100,
        :UPPERCASE, 0x00000200,

        :SORTKEY,             0x00000400,
        :BYTEREV,             0x00000800,
        :HIRAGANA,            0x00100000,
        :KATAKANA,            0x00200000,
        :HALFWIDTH,           0x00400000,
        :FULLWIDTH,           0x00800000,
        :LINGUISTIC_CASING,   0x01000000,
        :SIMPLIFIED_CHINESE,  0x02000000,
        :TRADITIONAL_CHINESE, 0x04000000,
    ]

    if WINDOWS_VERSION >= 7
      buffer += [:TITLECASE, 0x00000300]
      if WINDOWS_VERSION >= 8
        buffer += [
            :SORTHANDLE, 0x20000000,
            :HASH,       0x00040000,
        ]
      end
    end

    LocaleDependentMappingFlag = enum :locale_dependent_mapping_flag, buffer

    define_prefix(:LCMAP, LocaleDependentMappingFlag)
  end
end