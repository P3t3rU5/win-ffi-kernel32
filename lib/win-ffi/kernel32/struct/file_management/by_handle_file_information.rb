module WinFFI
  if WINDOWS_VERSION >= :xp

    require_relative '../time/file_time'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/fileapi/ns-fileapi-by_handle_file_information
      class BY_HANDLE_FILE_INFORMATION < FFIAdditions::Struct
        attr_accessor :dwFileAttributes,
                      :ftCreationTime,
                      :ftLastAccessTime,
                      :ftLastWriteTime,
                      :dwVolumeSerialNumber,
                      :nFileSizeHigh,
                      :nFileSizeLow,
                      :nNumberOfLinks,
                      :nFileIndexHigh,
                      :nFileIndexLow

        layout dwFileAttributes:     :dword,
               ftCreationTime:       FILETIME,
               ftLastAccessTime:     FILETIME,
               ftLastWriteTime:      FILETIME,
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