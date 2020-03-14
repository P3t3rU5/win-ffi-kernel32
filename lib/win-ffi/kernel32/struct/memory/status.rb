module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-memorystatus
    class MEMORYSTATUS < FFIAdditions::Struct
      attr_accessor :dwLength,
                    :dwMemoryLoad,
                    :dwTotalPhys,
                    :dwAvailPhys,
                    :dwTotalPageFile,
                    :dwAvailPageFile,
                    :dwTotalVirtual,
                    :dwAvailVirtual

      layout dwLength:        :dword,
             dwMemoryLoad:    :dword,
             dwTotalPhys:     :size_t,
             dwAvailPhys:     :size_t,
             dwTotalPageFile: :size_t,
             dwAvailPageFile: :size_t,
             dwTotalVirtual:  :size_t,
             dwAvailVirtual:  :size_t
    end
  end
end
