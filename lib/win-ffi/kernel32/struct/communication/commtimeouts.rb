module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-commtimeouts
      class COMMTIMEOUTS < FFIAdditions::Struct
        attr_accessor :ReadIntervalTimeout,
                      :ReadTotalTimeoutMultiplier,
                      :ReadTotalTimeoutConstant,
                      :WriteTotalTimeoutMultiplier,
                      :WriteTotalTimeoutConstant

        layout ReadIntervalTimeout:         :dword,
               ReadTotalTimeoutMultiplier:  :dword,
               ReadTotalTimeoutConstant:    :dword,
               WriteTotalTimeoutMultiplier: :dword,
               WriteTotalTimeoutConstant:   :dword
      end
    end
  end
end