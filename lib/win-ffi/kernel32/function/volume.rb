module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-definedosdevicew
      # BOOL DefineDosDevice(
      #   _In_      DWORD dwFlags,
      #   _In_      LPCTSTR lpDeviceName,
      #   _In_opt_  LPCTSTR lpTargetPath )
      def self.DefineDosDevice(dwFlags, lpDeviceName, lpTargetPath) end
      encoded_function 'DefineDosDevice', [:dword, :string, :string], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-deletevolumemountpointw
      # BOOL DeleteVolumeMountPoint( _In_  LPCTSTR lpszVolumeMountPoint )
      def self.DeleteVolumeMountPoint(lpszVolumeMountPoint) end
      encoded_function 'DeleteVolumeMountPoint', [:string], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-findfirstvolumew
      # HANDLE FindFirstVolume( _Out_  LPTSTR lpszVolumeName, _In_   DWORD cchBufferLength )
      def self.FindFirstVolume(lpszVolumeName, cchBufferLength) end
      encoded_function 'FindFirstVolume', [:pointer, :dword], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findfirstvolumemountpointa
      # HANDLE FindFirstVolumeMountPoint(
      #   _In_   LPTSTR lpszRootPathName,
      #   _Out_  LPTSTR lpszVolumeMountPoint,
      #   _In_   DWORD cchBufferLength )
      def self.FindFirstVolumeMountPoint(lpszRootPathName, lpszVolumeMountPoint, cchBufferLength) end
      encoded_function 'FindFirstVolumeMountPoint', [:string, :pointer, :dword], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findnextvolumea
      # BOOL FindNextVolume( _In_   HANDLE hFindVolume, _Out_  LPTSTR lpszVolumeName, _In_   DWORD cchBufferLength )
      def self.FindNextVolume(hFindVolume, lpszVolumeName, cchBufferLength) end
      encoded_function 'FindNextVolume', [:handle, :pointer, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findfirstvolumemountpointa
      # BOOL FindNextVolumeMountPoint(
      #   _In_   HANDLE hFindVolumeMountPoint,
      #   _Out_  LPTSTR lpszVolumeMountPoint,
      #   _In_   DWORD cchBufferLength )
      def self.FindNextVolumeMountPoint(hFindVolumeMountPoint, lpszVolumeMountPoint, cchBufferLength) end
      encoded_function 'FindNextVolumeMountPoint', [:handle, :pointer, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-findvolumeclose
      # BOOL FindVolumeClose( _In_  HANDLE hFindVolume )
      def self.FindVolumeClose(hFindVolume) end
      attach_function 'FindVolumeClose', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findvolumemountpointclose
      # BOOL FindVolumeMountPointClose( _In_  HANDLE hFindVolumeMountPoint )
      def self.FindVolumeMountPointClose(hFindVolumeMountPoint) end
      attach_function 'FindVolumeMountPointClose', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getdrivetypea
      # UINT GetDriveType( _In_opt_  LPCTSTR lpRootPathName )
      def self.GetDriveType(lpRootPathName) end
      encoded_function 'GetDriveType', [:string], :uint


      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getlogicaldrives
      # DWORD GetLogicalDrives( void )
      def self.GetLogicalDrives; end
      attach_function 'GetLogicalDrives', [], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getlogicaldrivestringsw
      # DWORD GetLogicalDriveStrings(_In_   DWORD nBufferLength, _Out_  LPTSTR lpBuffer )
      def self.GetLogicalDriveStrings(nBufferLength, lpBuffer) end
      encoded_function 'GetLogicalDriveStrings', [:dword, :pointer], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getvolumeinformationa
      # BOOL GetVolumeInformation(
      #   _In_opt_   LPCTSTR lpRootPathName,
      #   _Out_opt_  LPTSTR lpVolumeNameBuffer,
      #   _In_       DWORD nVolumeNameSize,
      #   _Out_opt_  LPDWORD lpVolumeSerialNumber,
      #   _Out_opt_  LPDWORD lpMaximumComponentLength,
      #   _Out_opt_  LPDWORD lpFileSystemFlags,
      #   _Out_opt_  LPTSTR lpFileSystemNameBuffer,
      #   _In_       DWORD nFileSystemNameSize )
      def self.GetVolumeInformation(lpRootPathName, lpVolumeNameBuffer, nVolumeNameSize, lpVolumeSerialNumber,
          lpMaximumComponentLength, lpFileSystemFlags, lpFileSystemNameBuffer, nFileSystemNameSize) end
      encoded_function 'GetVolumeInformation', [:string, :pointer, :dword, :pointer, :pointer, :pointer, :pointer, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getvolumenameforvolumemountpointw
      # BOOL GetVolumeNameForVolumeMountPoint(
      #   _In_   LPCTSTR lpszVolumeMountPoint,
      #   _Out_  LPTSTR lpszVolumeName,
      #   _In_   DWORD cchBufferLength )
      def self.GetVolumeNameForVolumeMountPoint(lpszVolumeMountPoint, lpszVolumeName, cchBufferLength) end
      encoded_function 'GetVolumeNameForVolumeMountPoint', [:string, :pointer, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getvolumepathnamew
      # BOOL GetVolumePathName(
      #   _In_   LPCTSTR lpszFileName,
      #   _Out_  LPTSTR lpszVolumePathName,
      #   _In_   DWORD cchBufferLength )
      def self.GetVolumePathName(lpszFileName, lpszVolumePathName, cchBufferLength) end
      encoded_function 'GetVolumePathName', [:string, :pointer, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getvolumepathnamesforvolumenamew
      # BOOL GetVolumePathNamesForVolumeName(
      #   _In_   LPCTSTR lpszVolumeName,
      #   _Out_  LPTSTR lpszVolumePathNames,
      #   _In_   DWORD cchBufferLength,
      #   _Out_  PDWORD lpcchReturnLength )
      def self.GetVolumePathNamesForVolumeName(lpszVolumeName, lpszVolumePathNames, cchBufferLength, lpcchReturnLength)
      end
      encoded_function 'GetVolumePathNamesForVolumeName', [:string, :pointer, :dword, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-querydosdevicew
      # DWORD QueryDosDevice(_In_opt_ LPCTSTR lpDeviceName, _Out_ LPTSTR lpTargetPath, _In_ DWORD ucchMax)
      def self.QueryDosDevice(lpDeviceName, lpTargetPath, ucchMax) end
      encoded_function 'QueryDosDevice', [:string, :pointer, :dword], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setvolumelabela
      # BOOL SetVolumeLabel( _In_opt_  LPCTSTR lpRootPathName, _In_opt_  LPCTSTR lpVolumeName )
      def self.SetVolumeLabel(lpRootPathName, lpVolumeName) end
      encoded_function 'SetVolumeLabel', [:string, :string], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setvolumemountpointa
      # BOOL SetVolumeMountPoint( _In_  LPCTSTR lpszVolumeMountPoint, _In_  LPCTSTR lpszVolumeName )
      def self.SetVolumeMountPoint(lpszVolumeMountPoint, lpszVolumeName) end
      encoded_function 'SetVolumeMountPoint', [:string, :string], :bool

      if WINDOWS_VERSION >= :vista
        # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getvolumeinformationbyhandlew
        # BOOL GetVolumeInformationByHandleW(
        #   _In_       HANDLE hFile,
        #   _Out_opt_  LPWSTR lpVolumeNameBuffer,
        #   _In_       DWORD nVolumeNameSize,
        #   _Out_opt_  LPDWORD lpVolumeSerialNumber,
        #   _Out_opt_  LPDWORD lpMaximumComponentLength,
        #   _Out_opt_  LPDWORD lpFileSystemFlags,
        #   _Out_opt_  LPWSTR lpFileSystemNameBuffer,
        #   _In_       DWORD nFileSystemNameSize )
        def self.GetVolumeInformationByHandle( hFile, lpVolumeNameBuffer, nVolumeNameSize, lpVolumeSerialNumber,
            lpMaximumComponentLength, lpFileSystemFlags, lpFileSystemNameBuffer, nFileSystemNameSize) end
        attach_function 'GetVolumeInformationByHandle', 'GetVolumeInformationByHandleW',
                        [:handle, :pointer, :dword, :pointer, :pointer, :pointer, :pointer, :dword], :bool
      end
    end
  end
end