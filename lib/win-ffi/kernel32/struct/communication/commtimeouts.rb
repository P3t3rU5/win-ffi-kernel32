require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      class COMMTIMEOUTS < FFIAdditions::Struct
        layout ReadIntervalTimeout:         :dword,
               ReadTotalTimeoutMultiplier:  :dword,
               ReadTotalTimeoutConstant:    :dword,
               WriteTotalTimeoutMultiplier: :dword,
               WriteTotalTimeoutConstant:   :dword
      end
    end
  end
end