require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :xp

    require 'win-ffi/kernel32/struct/time/file_time'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364952(v=vs.85).aspx
      class BY_HANDLE_FILE_INFORMATION < FFIAdditions::Struct
        layout dwFileAttributes:     :dword,
               ftCreationTime:     FILETIME,
               ftLastAccessTime:   FILETIME,
               ftLastWriteTime:    FILETIME,
               dwVolumeSerialNumber: :dword,
               nFileSizeHigh:        :dword,
               nFileSizeLow:         :dword,
               nNumberOfLinks:       :dword,
               nFileIndexHigh:       :dword,
               nFileIndexLow:        :dword
      end
    end
  end
end