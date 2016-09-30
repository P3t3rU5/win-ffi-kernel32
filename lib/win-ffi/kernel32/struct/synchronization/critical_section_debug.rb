require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class CRITICAL_SECTION_DEBUG < FFIAdditions::Struct
      layout Type:                      :word,
             CreatorBackTraceIndex:     :word,
             CriticalSection:        :pointer, # struct _RTL_CRITICAL_SECTION *CriticalSection;
             ProcessLocksList:       :pointer, # LIST_ENTRY
             EntryCount:               :dword,
             ContentionCount:          :dword,
             Flags:                    :dword,
             CreatorBackTraceIndexHigh: :word,
             SpareWORD:                 :word
    end
  end
end