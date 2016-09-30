require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class PROCESSENTRY32 < FFIAdditions::Struct
      layout dwSize:                :DWORD,
             cntUsage:              :DWORD,
             th32ProcessID:         :DWORD,
             th32DefaultHeapID: :ULONG_PTR,
             th32ModuleID:          :DWORD,
             cntThreads:            :DWORD,
             th32ParentProcessID:   :DWORD,
             pcPriClassBase:         :LONG,
             dwFlags:               :DWORD,
             szExeFile:  [:TCHAR, MAX_PATH]
    end
  end
end