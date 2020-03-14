require_relative '../time/file_time'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-win32_find_dataa
    # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-win32_find_dataw
    class WIN32_FIND_DATA < FFIAdditions::Struct
      attr_accessor :dwFileAttributes,
                    :ftCreationTime,
                    :ftLastAccessTime,
                    :ftLastWriteTime,
                    :nFileSizeHigh,
                    :nFileSizeLow,
                    :dwReserved0,
                    :dwReserved1,
                    :cFileName,
                    :cAlternateFileName

      layout dwFileAttributes:   :dword,
             ftCreationTime:     FILETIME,
             ftLastAccessTime:   FILETIME,
             ftLastWriteTime:    FILETIME,
             nFileSizeHigh:      :dword,
             nFileSizeLow:       :dword,
             dwReserved0:        :dword,
             dwReserved1:        :dword,
             cFileName:          [:tchar, MAX_PATH],
             cAlternateFileName: [:tchar, 14]
    end
  end
end