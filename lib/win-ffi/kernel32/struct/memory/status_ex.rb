module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/sysinfoapi/ns-sysinfoapi-memorystatusex
    class MEMORYSTATUSEX < FFIAdditions::Struct
      attr_accessor :dwLength,
                    :dwMemoryLoad,
                    :ullTotalPhys,
                    :ullAvailPhys,
                    :ullTotalPageFile,
                    :ullAvailPageFile,
                    :ullTotalVirtual,
                    :ullAvailVirtual,
                    :ullAvailExtendedVirtual

      layout dwLength:                :dword,
             dwMemoryLoad:            :dword,
             ullTotalPhys:            :dwordlong,
             ullAvailPhys:            :dwordlong,
             ullTotalPageFile:        :dwordlong,
             ullAvailPageFile:        :dwordlong,
             ullTotalVirtual:         :dwordlong,
             ullAvailVirtual:         :dwordlong,
             ullAvailExtendedVirtual: :dwordlong
    end
  end
end