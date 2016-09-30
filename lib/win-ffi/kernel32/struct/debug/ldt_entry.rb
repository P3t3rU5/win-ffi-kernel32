require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class LDT_ENTRY_UBION_STRUCT_1 < FFIAdditions::Struct
      layout BaseMid: :byte,
             Flags1:  :byte,
             Flags2:  :byte,
             BaseHi:  :byte
    end

    class LDT_ENTRY_UBION_STRUCT_2 < FFIAdditions::Struct
      layout flags: :dword
    end

    class LDT_ENTRY_UBION < FFIAdditions::Union
      layout Bytes: LDT_ENTRY_UBION_STRUCT_1,
             Bits:  LDT_ENTRY_UBION_STRUCT_2
    end


    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680348
    class LDT_ENTRY < FFIAdditions::Struct
      layout LimitLow:           :word,
             BaseLow:            :word,
             HighWord: LDT_ENTRY_UBION

    end
  end
end