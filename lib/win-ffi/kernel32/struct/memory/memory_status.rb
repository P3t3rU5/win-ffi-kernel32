require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class MEMORYSTATUS < FFIAdditions::Struct
      layout dwLength:         :dword,
             dwMemoryLoad:     :dword,
             dwTotalPhys:     :size_t,
             dwAvailPhys:     :size_t,
             dwTotalPageFile: :size_t,
             dwAvailPageFile: :size_t,
             dwTotalVirtual:  :size_t,
             dwAvailVirtual:  :size_t
    end
  end
end
