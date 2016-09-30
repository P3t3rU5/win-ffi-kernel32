require 'win-ffi/kernel32/struct/time/file_time'

module WinFFI
  module Kernel32
    class WIN32_FIND_DATA < FFIAdditions::Struct
      layout dwFileAttributes:        :dword,
             ftCreationTime:        FILETIME,
             ftLastAccessTime:      FILETIME,
             ftLastWriteTime:       FILETIME,
             nFileSizeHigh:           :dword,
             nFileSizeLow:            :dword,
             dwReserved0:             :dword,
             dwReserved1:             :dword,
             cFileName:   [:tchar, MAX_PATH],
             cAlternateFileName: [:tchar, 14]
    end
  end
end