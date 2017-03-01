require 'win-ffi/kernel32/enum/console/history_flag'

module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682077(v=vs.85).aspx
      class CONSOLE_HISTORY_INFO < FFIAdditions::Struct
        layout cbSize:                 :uint,
               HistoryBufferSize:      :uint,
               NumberOfHistoryBuffers: :uint,
               dwFlags:          HistoryFlag
      end
    end
  end
end