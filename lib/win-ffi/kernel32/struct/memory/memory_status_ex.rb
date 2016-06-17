require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class MEMORYSTATUSEX < FFIStruct
      layout :dwLength,                :dword,
             :dwMemoryLoad,            :dword,
             :ullTotalPhys,            :dwordlong,
             :ullAvailPhys,            :dwordlong,
             :ullTotalPageFile,        :dwordlong,
             :ullAvailPageFile,        :dwordlong,
             :ullTotalVirtual,         :dwordlong,
             :ullAvailVirtual,         :dwordlong,
             :ullAvailExtendedVirtual, :dwordlong
    end
  end
end