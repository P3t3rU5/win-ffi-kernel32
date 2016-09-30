require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class WOW64_LDT_ENTRY_UNION_STRUCT_1 < FFIAdditions::Struct
      layout BaseMid: :byte,
             Flags1:  :byte,
             Flags2:  :byte,
             BaseHi:  :byte
    end

    class WOW64_LDT_ENTRY_UNION_STRUCT_2 < FFIAdditions::Struct
      layout data: :dword
    end

    class WOW64_LDT_ENTRY_UNION < FFIAdditions::Union
      layout Bytes: WOW64_LDT_ENTRY_UNION_STRUCT_1,
             Bits:  WOW64_LDT_ENTRY_UNION_STRUCT_2
    end

    class WOW64_LDT_ENTRY < FFIAdditions::Struct
      layout LimitLow:                 :word,
             BaseLow:                  :word,
             HighWord: WOW64_LDT_ENTRY_UNION
    end
  end
end