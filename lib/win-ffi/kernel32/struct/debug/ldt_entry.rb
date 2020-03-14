module WinFFI
  module Kernel32
    class LDT_ENTRY_UBION_STRUCT_1 < FFIAdditions::Struct
      attr_accessor :BaseMid, :Flags1, :Flags2, :BaseHi

      layout BaseMid: :byte,
             Flags1:  :byte,
             Flags2:  :byte,
             BaseHi:  :byte
    end

    class LDT_ENTRY_UBION_STRUCT_2 < FFIAdditions::Struct
      attr_accessor :flags

      layout flags: :dword
    end

    class LDT_ENTRY_UBION < FFIAdditions::Union
      attr_accessor :Bytes, :Bits

      layout Bytes: LDT_ENTRY_UBION_STRUCT_1,
             Bits:  LDT_ENTRY_UBION_STRUCT_2
    end


    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-ldt_entry
    class LDT_ENTRY < FFIAdditions::Struct
      attr_accessor :LimitLow, :BaseLow, :HighWord

      layout LimitLow: :word,
             BaseLow:  :word,
             HighWord: LDT_ENTRY_UBION
    end
  end
end