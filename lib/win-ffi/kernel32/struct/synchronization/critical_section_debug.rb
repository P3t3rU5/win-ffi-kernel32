module WinFFI
  module Kernel32
    class CRITICAL_SECTION_DEBUG < FFIAdditions::Struct
      attr_accessor :Type,
                    :CreatorBackTraceIndex,
                    :CriticalSection,
                    :ProcessLocksList,
                    :EntryCount,
                    :ContentionCount,
                    :Flags,
                    :CreatorBackTraceIndexHigh,
                    :SpareWORD

      layout Type:                      :word,
             CreatorBackTraceIndex:     :word,
             CriticalSection:           :pointer, # struct _RTL_CRITICAL_SECTION *CriticalSection;
             ProcessLocksList:          :pointer, # LIST_ENTRY
             EntryCount:                :dword,
             ContentionCount:           :dword,
             Flags:                     :dword,
             CreatorBackTraceIndexHigh: :word,
             SpareWORD:                 :word
    end
  end
end