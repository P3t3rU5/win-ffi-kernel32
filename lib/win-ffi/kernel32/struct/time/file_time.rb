require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # File System time stamps are represented with the following structure:
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724284(v=vs.85).aspx
    class FILETIME < FFIStruct
      layout :dwLowDateTime,  :dword,
             :dwHighDateTime, :dword
    end
  end
end