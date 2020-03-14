module WinFFI
  module Kernel32
    class WOW64_LDT_ENTRY_UNION_STRUCT_1 < FFIAdditions::Struct
      attr_accessor :BaseMid, :Flags1, :Flags2, :BaseHi

      layout BaseMid: :byte,
             Flags1:  :byte,
             Flags2:  :byte,
             BaseHi:  :byte
    end

    class WOW64_LDT_ENTRY_UNION_STRUCT_2 < FFIAdditions::Struct
      attr_accessor :data

      layout data: :dword
    end

    class WOW64_LDT_ENTRY_UNION < FFIAdditions::Union
      attr_accessor :Bytes, :Bits

      layout Bytes: WOW64_LDT_ENTRY_UNION_STRUCT_1,
             Bits:  WOW64_LDT_ENTRY_UNION_STRUCT_2
    end

    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-wow64_ldt_entry
    class WOW64_LDT_ENTRY < FFIAdditions::Struct
      attr_accessor :LimitLow, :BaseLow, :HighWord

      layout LimitLow: :word,
             BaseLow:  :word,
             HighWord: WOW64_LDT_ENTRY_UNION
    end
  end
end