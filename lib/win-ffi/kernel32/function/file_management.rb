module WinFFI
  if WINDOWS_VERSION >= :xp
    require 'win-ffi/core/struct/large_integer'
    require 'win-ffi/core/struct/security_attributes'

    require_relative '../enum/file_management/copy_file_ex_state'
    require_relative '../enum/file_management/copy_file_flag'
    require_relative '../enum/file_management/file_share_flag'
    require_relative '../enum/file_management/file_attribute_flag'
    require_relative '../enum/file_management/file_position'
    require_relative '../enum/file_management/findex_info_levels'
    require_relative '../enum/file_management/findex_search_ops'
    require_relative '../enum/file_management/get_fileex_info_levels'
    require_relative '../enum/file_management/find_first_ex_flag'
    require_relative '../enum/file_management/move_file_flag'
    require_relative '../enum/generic_flag'
    require_relative '../enum/file_management/symbolic_link_flag'
    require_relative '../enum/file_management/replace_flag'
    require_relative '../enum/file_management/base_search_path'
    require_relative '../enum/file_management/stream_info_files'
    require_relative '../enum/file_management/open_file_flag'
    require_relative '../enum/file_management/file_completion'
    require_relative '../enum/file_management/file_flag'

    require_relative '../struct/file_management/by_handle_file_information'
    require_relative '../struct/file_management/file_id_descriptor'
    require_relative '../struct/file_management/file_segment_element'
    require_relative '../struct/file_management/of_struct'
    require_relative '../struct/synchronization/overlapped'
    require_relative '../struct/file_management/win32_find_data'

    require_relative '../struct/file_management/overlapped_entry'
    require_relative '../struct/file_management/copyfile2_extended_parameters'
    require_relative '../struct/file_management/createfile2_extended_parameters'

    module Kernel32

      typedef :handle, :hfile

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363854
      # DWORD CALLBACK CopyProgressRoutine(
      #   _In_     LARGE_INTEGER TotalFileSize,
      #   _In_     LARGE_INTEGER TotalBytesTransferred,
      #   _In_     LARGE_INTEGER StreamSize,
      #   _In_     LARGE_INTEGER StreamBytesTransferred,
      #   _In_     DWORD         dwStreamNumber,
      #   _In_     DWORD         dwCallbackReason,
      #   _In_     HANDLE        hSourceFile,
      #   _In_     HANDLE        hDestinationFile,
      #   _In_opt_ LPVOID        lpData)
      CopyProgressRoutine = callback 'CopyProgressRoutine',
                                     [LARGE_INTEGER.ptr(:in), LARGE_INTEGER.ptr(:in), LARGE_INTEGER.ptr(:in), LARGE_INTEGER.ptr(:in),
                                      :dword, CopyFileExState, :handle, :handle, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364052
      # VOID CALLBACK FileIOCompletionRoutine(
      #   _In_    DWORD        dwErrorCode,
      #   _In_    DWORD        dwNumberOfBytesTransfered,
      #   _Inout_ LPOVERLAPPED lpOverlapped)
      FileIOCompletionRoutine = callback 'FileIOCompletionRoutine', [:dword, :dword, OVERLAPPED.ptr], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-arefileapisansi
      # BOOL AreFileApisANSI(void)
      def self.AreFileApisANSI; end
      attach_function 'AreFileApisANSI', [], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/FileIO/cancelio
      # BOOL CancelIo(_In_ HANDLE hFile)
      def self.CancelIo(hFile) end
      attach_function 'CancelIo', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-copyfile
      # BOOL CopyFile( _In_ LPCTSTR lpExistingFileName, _In_ LPCTSTR lpNewFileName, _In_ BOOL    bFailIfExists)
      def self.CopyFile(lpExistingFileName, lpNewFileName, bFailIfExists) end
      encoded_function 'CopyFile', [:string, :string, :bool], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-copyfileexa
      # BOOL CopyFileEx(
      #   _In_     LPCTSTR            lpExistingFileName,
      #   _In_     LPCTSTR            lpNewFileName,
      #   _In_opt_ LPPROGRESS_ROUTINE lpProgressRoutine,
      #   _In_opt_ LPVOID             lpData,
      #   _In_opt_ LPBOOL             pbCancel,
      #   _In_     DWORD              dwCopyFlags)
      def self.CopyFileEx(lpExistingFileName, lpNewFileName, lpProgressRoutine, lpData, pbCancel, dwCopyFlags) end
      encoded_function 'CopyFileEx', [:string, :string, CopyProgressRoutine, :pointer, :pointer, CopyFileFlag], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-createfilea
      # HANDLE CreateFile(
      #   _In_     LPCTSTR               lpFileName,
      #   _In_     DWORD                 dwDesiredAccess,
      #   _In_     DWORD                 dwShareMode,
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpSecurityAttributes,
      #   _In_     DWORD                 dwCreationDisposition,
      #   _In_     DWORD                 dwFlagsAndAttributes,
      #   _In_opt_ HANDLE                hTemplateFile)
      def self.CreateFile(lpFileName, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwCreationDisposition,
          dwFlagsAndAttributes, hTemplateFile) end
      encoded_function 'CreateFile',
                       [:string, GenericFlag, FileShareFlag, SECURITY_ATTRIBUTES, :dword, :dword, :handle], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createhardlinka
      # BOOL CreateHardLink(
      #   _In_       LPCTSTR               lpFileName,
      #   _In_       LPCTSTR               lpExistingFileName,
      #   _Reserved_ LPSECURITY_ATTRIBUTES lpSecurityAttributes)
      def self.CreateHardLink(lpFileName, lpExistingFileName, lpSecurityAttributes) end
      encoded_function 'CreateHardLink', [:string, :string, SECURITY_ATTRIBUTES], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/FileIO/createiocompletionport
      # def self.CreateIoCompletionPort(fileHandle, existingCompletionPort, completionKey, numberOfConcurrentThreads) end
      # HANDLE CreateIoCompletionPort(
      #   _In_     HANDLE    FileHandle,
      #   _In_opt_ HANDLE    ExistingCompletionPort,
      #   _In_     ULONG_PTR CompletionKey,
      #   _In_     DWORD     NumberOfConcurrentThreads)
      # encoded_function 'CreateIoCompletionPort', [:handle, :handle, :ulong_ptr, :dword], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-deletefilea
      # BOOL DeleteFile(_In_ LPCTSTR lpFileName)
      def self.DeleteFile(lpFileName) end
      encoded_function 'DeleteFile', [:string], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-findclose
      # BOOL FindClose(_Inout_ HANDLE hFindFile)
      def self.FindClose(hFindFile) end
      attach_function 'FindClose', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea
      # HANDLE FindFirstFile( _In_  LPCTSTR           lpFileName, _Out_ LPWIN32_FIND_DATA lpFindFileData)
      def self.FindFirstFile(lpFileName, lpFindFileData) end
      encoded_function 'FindFirstFile', [:string, WIN32_FIND_DATA.ptr(:out)], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-findfirstfileexa
      # HANDLE FindFirstFileEx(
      #   _In_       LPCTSTR            lpFileName,
      #   _In_       FINDEX_INFO_LEVELS fInfoLevelId,
      #   _Out_      LPVOID             lpFindFileData,
      #   _In_       FINDEX_SEARCH_OPS  fSearchOp,
      #   _Reserved_ LPVOID             lpSearchFilter,
      #   _In_       DWORD              dwAdditionalFlags)
      def self.FindFirstFileEx(lpFileName, fInfoLevelId, lpFindFileData, fSearchOp, lpSearchFilter, dwAdditionalFlags)
      end
      encoded_function 'FindFirstFileEx',
                       [:string, FINDEX_INFO_LEVELS, :pointer, FINDEX_SEARCH_OPS, :pointer,
                        FIND_FIRST_EX_FLAG], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-findnextfilea
      # BOOL FindNextFile( _In_  HANDLE            hFindFile, _Out_ LPWIN32_FIND_DATA lpFindFileData)
      def self.FindNextFile(hFindFile, lpFindFileData) end
      encoded_function 'FindNextFile', [:handle, WIN32_FIND_DATA.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-flushfilebuffers
      # BOOL FlushFileBuffers(_In_ HANDLE hFile)
      def self.FlushFileBuffers(hFile) end
      attach_function 'FlushFileBuffers', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getbinarytypea
      # BOOL GetBinaryType(_In_  LPCTSTR lpApplicationName, _Out_ LPDWORD lpBinaryType)
      def self.GetBinaryType(lpApplicationName, lpBinaryType) end
      attach_function 'GetBinaryType', [:string, :pointer], :bool
      encoded_function 'GetBinaryType', [:string, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getcompressedfilesizea
      # DWORD GetCompressedFileSize( _In_      LPCTSTR lpFileName, _Out_opt_ LPDWORD lpFileSizeHigh)
      def self.GetCompressedFileSize(lpFileName, lpFileSizeHigh) end
      encoded_function 'GetCompressedFileSize', [:string, :pointer], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa
      # DWORD GetFileAttributes(_In_ LPCTSTR lpFileName)
      def self.GetFileAttributes(lpFileName) end
      encoded_function 'GetFileAttributes', [:string], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getfileattributesexa
      # BOOL GetFileAttributesEx(
      #   _In_  LPCTSTR                lpFileName,
      #   _In_  GET_FILEEX_INFO_LEVELS fInfoLevelId,
      #   _Out_ LPVOID                 lpFileInformation)
      def self.GetFileAttributesEx(lpFileName, fInfoLevelId, lpFileInformation) end
      encoded_function 'GetFileAttributesEx', [:string, GET_FILEEX_INFO_LEVELS, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getfileinformationbyhandle
      # BOOL GetFileInformationByHandle(_In_  HANDLE hFile, _Out_ LPBY_HANDLE_FILE_INFORMATION lpFileInformation)
      def self.GetFileInformationByHandle(hFile, lpFileInformation) end
      attach_function 'GetFileInformationByHandle', [:handle, BY_HANDLE_FILE_INFORMATION.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getfilesize
      # DWORD GetFileSize(_In_      HANDLE  hFile, _Out_opt_ LPDWORD lpFileSizeHigh)
      def self.GetFileSize(hFile, lpFileSizeHigh) end
      attach_function 'GetFileSize', [:handle, :pointer], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getfilesizeex
      # BOOL GetFileSizeEx(_In_  HANDLE hFile, _Out_ PLARGE_INTEGER lpFileSize)
      def self.GetFileSizeEx(hFile, lpFileSize) end
      attach_function 'GetFileSizeEx', [:handle, LARGE_INTEGER.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getfiletype
      # DWORD GetFileType(_In_ HANDLE hFile)
      def self.GetFileType(hFile) end
      attach_function 'GetFileType', [:handle], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getfullpathnamea
      # DWORD GetFullPathName(
      #   _In_  LPCTSTR lpFileName,
      #   _In_  DWORD   nBufferLength,
      #   _Out_ LPTSTR  lpBuffer,
      #   _Out_ LPTSTR  *lpFilePart)
      def self.GetFullPathName(lpFileName, nBufferLength, lpBuffer, lpFilePart) end
      encoded_function 'GetFullPathName', [:string, :dword, :string, :string], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getlongpathnamea
      # DWORD GetLongPathName( _In_  LPCTSTR lpszShortPath, _Out_ LPTSTR  lpszLongPath, _In_  DWORD   cchBuffer)
      def self.GetLongPathName(lpszShortPath, lpszLongPath, cchBuffer) end
      encoded_function 'GetLongPathName', [:string, :string, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364986
      # BOOL GetQueuedCompletionStatus(
      #   _In_  HANDLE       CompletionPort,
      #   _Out_ LPDWORD      lpNumberOfBytes,
      #   _Out_ PULONG_PTR   lpCompletionKey,
      #   _Out_ LPOVERLAPPED *lpOverlapped,
      #   _In_  DWORD        dwMilliseconds)
      def self.GetQueuedCompletionStatus(completionPort, lpNumberOfBytes, lpCompletionKey, lpOverlapped, dwMilliseconds)
      end
      attach_function 'GetQueuedCompletionStatus', [:handle, :pointer, :pointer, OVERLAPPED.ptr(:out), :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getshortpathnamew
      # DWORD GetShortPathName( _In_  LPCTSTR lpszLongPath, _Out_ LPTSTR  lpszShortPath, _In_  DWORD   cchBuffer)
      def self.GetShortPathName(lpszLongPath, lpszShortPath, cchBuffer) end
      encoded_function 'GetShortPathName', [:string, :string, :dword], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-gettempfilenamea
      # UINT GetTempFileName(
      #   _In_  LPCTSTR lpPathName,
      #   _In_  LPCTSTR lpPrefixString,
      #   _In_  UINT    uUnique,
      #   _Out_ LPTSTR  lpTempFileName)
      def self.GetTempFileName(lpPathName, lpPrefixString, uUnique, lpTempFileName) end
      encoded_function 'GetTempFileName', [:string, :string, :uint, :string], :uint


      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-gettemppatha
      # DWORD GetTempPath(_In_  DWORD  nBufferLength, _Out_ LPTSTR lpBuffer)
      def self.GetTempPath(nBufferLength, lpBuffer) end
      encoded_function 'GetTempPath', [:dword, :pointer], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-lockfile
      # BOOL LockFile(
      #   _In_ HANDLE hFile,
      #   _In_ DWORD  dwFileOffsetLow,
      #   _In_ DWORD  dwFileOffsetHigh,
      #   _In_ DWORD  nNumberOfBytesToLockLow,
      #   _In_ DWORD  nNumberOfBytesToLockHigh)
      def self.LockFile(hFile, dwFileOffsetLow, dwFileOffsetHigh, nNumberOfBytesToLockLow, nNumberOfBytesToLockHigh)
      end
      attach_function 'LockFile', [:handle, :dword, :dword, :dword, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-lockfileex
      # BOOL LockFileEx(
      #   _In_       HANDLE       hFile,
      #   _In_       DWORD        dwFlags,
      #   _Reserved_ DWORD        dwReserved,
      #   _In_       DWORD        nNumberOfBytesToLockLow,
      #   _In_       DWORD        nNumberOfBytesToLockHigh,
      #   _Inout_    LPOVERLAPPED lpOverlapped)
      def self.LockFileEx(hFile, dwFlags, dwReserved, nNumberOfBytesToLockLow, nNumberOfBytesToLockHigh, lpOverlapped)
      end
      attach_function 'LockFileEx', [:handle, :dword, :dword, :dword, :dword, OVERLAPPED.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-movefile
      # BOOL MoveFile(_In_ LPCTSTR lpExistingFileName, _In_ LPCTSTR lpNewFileName)
      def self.MoveFile(lpExistingFileName, lpNewFileName) end
      encoded_function 'MoveFile', [:string, :string], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-movefileexa
      # BOOL MoveFileEx(_In_ LPCTSTR lpExistingFileName, _In_opt_ LPCTSTR lpNewFileName, _In_ DWORD dwFlags)
      def self.MoveFileEx(lpExistingFileName, lpNewFileName, dwFlags) end
      encoded_function 'MoveFileEx', [:string, :string, MoveFileFlag], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-movefilewithprogressa
      # BOOL MoveFileWithProgress(
      #   _In_     LPCTSTR            lpExistingFileName,
      #   _In_opt_ LPCTSTR            lpNewFileName,
      #   _In_opt_ LPPROGRESS_ROUTINE lpProgressRoutine,
      #   _In_opt_ LPVOID             lpData,
      #   _In_     DWORD              dwFlags)
      def self.MoveFileWithProgress(lpExistingFileName, lpNewFileName, lpProgressRoutine, lpData, dwFlags) end
      encoded_function 'MoveFileWithProgress', [:string, :string, CopyProgressRoutine, :pointer, MoveFileFlag], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-openfile
      # HFILE OpenFile( _In_  LPCSTR     lpFileName, _Out_ LPOFSTRUCT lpReOpenBuff, _In_  UINT       uStyle)
      def self.OpenFile(lpFileName, lpReOpenBuff, uStyle) end
      attach_function 'OpenFile', [:string, OFSTRUCT.ptr(:out), OpenFileFlag], :hfile

      # https://docs.microsoft.com/en-us/windows/desktop/FileIO/postqueuedcompletionstatus
      # BOOL PostQueuedCompletionStatus(
      #   _In_     HANDLE       CompletionPort,
      #   _In_     DWORD        dwNumberOfBytesTransferred,
      #   _In_     ULONG_PTR    dwCompletionKey,
      #   _In_opt_ LPOVERLAPPED lpOverlapped)
      def self.PostQueuedCompletionStatus(completionPort, dwNumberOfBytesTransferred, dwCompletionKey, lpOverlapped)
      end
      attach_function 'PostQueuedCompletionStatus', [:handle, :dword, :ulong_ptr, OVERLAPPED.ptr(:in)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-readfile
      # BOOL ReadFile(
      #   _In_        HANDLE       hFile,
      #   _Out_       LPVOID       lpBuffer,
      #   _In_        DWORD        nNumberOfBytesToRead,
      #   _Out_opt_   LPDWORD      lpNumberOfBytesRead,
      #   _Inout_opt_ LPOVERLAPPED lpOverlapped)
      def self.ReadFile(hFile, lpBuffer, nNumberOfBytesToRead, lpNumberOfBytesRead, lpOverlapped) end
      attach_function 'ReadFile', [:handle, :pointer, :dword, :pointer, OVERLAPPED.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-readfileex
      # BOOL ReadFileEx(
      #   _In_      HANDLE                          hFile,
      #   _Out_opt_ LPVOID                          lpBuffer,
      #   _In_      DWORD                           nNumberOfBytesToRead,
      #   _Inout_   LPOVERLAPPED                    lpOverlapped,
      #   _In_      LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine)
      def self.ReadFileEx(hFile, lpBuffer, nNumberOfBytesToRead, lpOverlapped, lpCompletionRoutine) end
      attach_function 'ReadFileEx', [:handle, :pointer, :dword, OVERLAPPED.ptr, FileIOCompletionRoutine], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-readfilescatter
      # BOOL ReadFileScatter(
      #   _In_       HANDLE               hFile,
      #   _In_       FILE_SEGMENT_ELEMENT aSegmentArray[],
      #   _In_       DWORD                nNumberOfBytesToRead,
      #   _Reserved_ LPDWORD              lpReserved,
      #   _Inout_    LPOVERLAPPED         lpOverlapped)
      def self.ReadFileScatter(hFile, aSegmentArray, nNumberOfBytesToRead, lpReserved, lpOverlapped) end
      attach_function 'ReadFileScatter', [:handle, :pointer, :dword, :pointer, OVERLAPPED.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-replacefilea
      # BOOL ReplaceFile(
      #   _In_       LPCTSTR lpReplacedFileName,
      #   _In_       LPCTSTR lpReplacementFileName,
      #   _In_opt_   LPCTSTR lpBackupFileName,
      #   _In_       DWORD   dwReplaceFlags,
      #   _Reserved_ LPVOID  lpExclude,
      #   _Reserved_ LPVOID  lpReserved)
      def self.ReplaceFile(lpReplacedFileName, lpReplacementFileName, lpBackupFileName, dwReplaceFlags, lpExclude,
          lpReserved) end
      attach_function 'ReplaceFile', [:string, :string, :string, ReplaceFlag, :pointer, :pointer], :bool
      encoded_function 'ReplaceFile', [:string, :string, :string, ReplaceFlag, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365527
      # DWORD SearchPath(
      #   _In_opt_  LPCTSTR lpPath,
      #   _In_      LPCTSTR lpFileName,
      #   _In_opt_  LPCTSTR lpExtension,
      #   _In_      DWORD   nBufferLength,
      #   _Out_     LPTSTR  lpBuffer,
      #   _Out_opt_ LPTSTR  *lpFilePart)
      def self.SearchPath(lpPath, lpFileName, lpExtension, nBufferLength, lpBuffer, lpFilePart) end
      encoded_function 'SearchPath', [:string, :string, :string, :dword, :string, :string], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-setendoffile
      # BOOL SetEndOfFile( _In_ HANDLE hFile)
      def self.SetEndOfFile(hFile) end
      attach_function 'SetEndOfFile', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-setfileapistoansi
      # void SetFileApisToANSI(void)
      def self.SetFileApisToANSI; end
      attach_function 'SetFileApisToANSI', [], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-setfileapistooem
      # void SetFileApisToOEM(void)
      def self.SetFileApisToOEM; end
      attach_function 'SetFileApisToOEM', [], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-setfileattributesa
      # BOOL SetFileAttributes(_In_ LPCTSTR lpFileName, _In_ DWORD   dwFileAttributes)
      def self.SetFileAttributes(lpFileName, dwFileAttributes) end
      encoded_function 'SetFileAttributes', [:string, FileAttributeFlag], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-setfilepointer
      # DWORD SetFilePointer(
      #   _In_        HANDLE hFile,
      #   _In_        LONG   lDistanceToMove,
      #   _Inout_opt_ PLONG  lpDistanceToMoveHigh,
      #   _In_        DWORD  dwMoveMethod)
      def self.SetFilePointer(hFile, lDistanceToMove, lpDistanceToMoveHigh, dwMoveMethod) end
      attach_function 'SetFilePointer', [:handle, :long, :pointer, FilePosition], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-setfilepointerex
      # BOOL SetFilePointerEx(
      #   _In_      HANDLE         hFile,
      #   _In_      LARGE_INTEGER  liDistanceToMove,
      #   _Out_opt_ PLARGE_INTEGER lpNewFilePointer,
      #   _In_      DWORD          dwMoveMethod)
      def self.SetFilePointerEx(hFile, liDistanceToMove, lpNewFilePointer, dwMoveMethod) end
      attach_function 'SetFilePointerEx', [:handle, LARGE_INTEGER.ptr(:in), LARGE_INTEGER.ptr(:out), FilePosition], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setfileshortnamea
      # BOOL SetFileShortName(_In_ HANDLE  hFile, _In_ LPCTSTR lpShortName)
      def self.SetFileShortName(hFile, lpShortName) end
      encoded_function 'SetFileShortName', [:handle, :string], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-setfilevaliddata
      # BOOL SetFileValidData(_In_ HANDLE   hFile, _In_ LONGLONG ValidDataLength)
      def self.SetFileValidData(hFile, validDataLength) end
      attach_function 'SetFileValidData', [:handle, :long_long], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-unlockfile
      # BOOL UnlockFile(
      #   _In_ HANDLE hFile,
      #   _In_ DWORD  dwFileOffsetLow,
      #   _In_ DWORD  dwFileOffsetHigh,
      #   _In_ DWORD  nNumberOfBytesToUnlockLow,
      #   _In_ DWORD  nNumberOfBytesToUnlockHigh)
      def self.UnlockFile(hFile, dwFileOffsetLow, dwFileOffsetHigh, nNumberOfBytesToUnlockLow,
          nNumberOfBytesToUnlockHigh) end
      attach_function 'UnlockFile', [:handle, :dword, :dword, :dword, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-unlockfileex
      # BOOL UnlockFileEx(
      #   _In_       HANDLE       hFile,
      #   _Reserved_ DWORD        dwReserved,
      #   _In_       DWORD        nNumberOfBytesToUnlockLow,
      #   _In_       DWORD        nNumberOfBytesToUnlockHigh,
      #   _Inout_    LPOVERLAPPED lpOverlapped)
      def self.UnlockFileEx(hFile, dwReserved, nNumberOfBytesToUnlockLow, nNumberOfBytesToUnlockHigh, lpOverlapped) end
      attach_function 'UnlockFileEx', [:handle, :dword, :dword, :dword, OVERLAPPED.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-writefile
      # BOOL WriteFile(
      #   _In_        HANDLE       hFile,
      #   _In_        LPCVOID      lpBuffer,
      #   _In_        DWORD        nNumberOfBytesToWrite,
      #   _Out_opt_   LPDWORD      lpNumberOfBytesWritten,
      #   _Inout_opt_ LPOVERLAPPED lpOverlapped)
      def self.WriteFile(hFile, lpBuffer, nNumberOfBytesToWrite, lpNumberOfBytesWritten, lpOverlapped) end
      attach_function 'WriteFile', [:handle, :pointer, :dword, :pointer, OVERLAPPED.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-writefileex
      # BOOL WriteFileEx(
      #   _In_     HANDLE                          hFile,
      #   _In_opt_ LPCVOID                         lpBuffer,
      #   _In_     DWORD                           nNumberOfBytesToWrite,
      #   _Inout_  LPOVERLAPPED                    lpOverlapped,
      #   _In_     LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine)
      def self.WriteFileEx(hFile, lpBuffer, nNumberOfBytesToWrite, lpOverlapped, lpCompletionRoutine) end
      attach_function 'WriteFileEx', [:handle, :pointer, :dword, OVERLAPPED.ptr, FileIOCompletionRoutine], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-writefilegather
      # BOOL WriteFileGather(
      #   _In_       HANDLE               hFile,
      #   _In_       FILE_SEGMENT_ELEMENT aSegmentArray[],
      #   _In_       DWORD                nNumberOfBytesToWrite,
      #   _Reserved_ LPDWORD              lpReserved,
      #   _Inout_    LPOVERLAPPED         lpOverlapped)
      def self.WriteFileGather(hFile, aSegmentArray, nNumberOfBytesToWrite, lpReserved, lpOverlapped) end
      attach_function 'WriteFileGather',
                      [:handle, FILE_SEGMENT_ELEMENT.ptr(:in), :dword, :pointer, OVERLAPPED.ptr], :bool

      if WinFFI.x64?
        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365743
        # BOOL Wow64DisableWow64FsRedirection(_Out_ PVOID *OldValue)
        def self.Wow64DisableWow64FsRedirection(oldValue) end
        attach_function 'Wow64DisableWow64FsRedirection', [:pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-wow64enablewow64fsredirection
        # BOOLEAN Wow64EnableWow64FsRedirection(_In_ BOOLEAN Wow64FsEnableRedirection)
        def self.Wow64EnableWow64FsRedirection(wow64FsEnableRedirection) end
        attach_function 'Wow64EnableWow64FsRedirection', [:bool], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365745
        # BOOL Wow64RevertWow64FsRedirection( _In_ PVOID OldValue)
        def self.Wow64RevertWow64FsRedirection(oldValue) end
        attach_function 'Wow64RevertWow64FsRedirection', [:pointer], :bool
      end

      if WINDOWS_VERSION >= :vista
        require_relative '../enum/file_management/file_info_by_handle_class'

        # https://docs.microsoft.com/en-us/windows/desktop/FileIO/cancelioex-func
        # BOOL CancelIoEx(_In_ HANDLE hFile, _In_opt_ LPOVERLAPPED lpOverlapped)
        def self.CancelIoEx(hFile, lpOverlapped) end
        attach_function 'CancelIoEx', [:handle, OVERLAPPED.ptr(:in)], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/FileIO/cancelsynchronousio-func
        # BOOL CancelSynchronousIo(_In_ HANDLE hThread)
        def self.CancelSynchronousIo(hThread) end
        attach_function 'CancelSynchronousIo', [:handle], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-checknamelegaldos8dot3a
        # BOOL CheckNameLegalDOS8Dot3(
        #   _In_      LPCTSTR lpName,
        #   _Out_opt_ LPSTR   lpOemName,
        #   _In_      DWORD   OemNameSize,
        #   _Out_opt_ PBOOL   pbNameContainsSpaces,
        #   _Out_     PBOOL   pbNameLegal)
        def self.CheckNameLegalDOS8Dot3(lpName, lpOemName, oemNameSize, pbNameContainsSpaces, pbNameLegal) end
        encoded_function 'CheckNameLegalDOS8Dot3', [:string, :string, :dword, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-copyfiletransacteda
        # BOOL CopyFileTransacted(
        #   _In_     LPCTSTR            lpExistingFileName,
        #   _In_     LPCTSTR            lpNewFileName,
        #   _In_opt_ LPPROGRESS_ROUTINE lpProgressRoutine,
        #   _In_opt_ LPVOID             lpData,
        #   _In_opt_ LPBOOL             pbCancel,
        #   _In_     DWORD              dwCopyFlags,
        #   _In_     HANDLE             hTransaction)
        def self.CopyFileTransacted(lpExistingFileName, lpNewFileName, lpProgressRoutine, lpData, pbCancel, dwCopyFlags,
            hTransaction) end
        encoded_function 'CopyFileTransacted',
                         [:string, :string, CopyProgressRoutine, :pointer, :pointer, CopyFileFlag, :handle], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createfiletransacteda
        # HANDLE CreateFileTransacted(
        #   _In_       LPCTSTR               lpFileName,
        #   _In_       DWORD                 dwDesiredAccess,
        #   _In_       DWORD                 dwShareMode,
        #   _In_opt_   LPSECURITY_ATTRIBUTES lpSecurityAttributes,
        #   _In_       DWORD                 dwCreationDisposition,
        #   _In_       DWORD                 dwFlagsAndAttributes,
        #   _In_opt_   HANDLE                hTemplateFile,
        #   _In_       HANDLE                hTransaction,
        #   _In_opt_   PUSHORT               pusMiniVersion,
        #   _Reserved_ PVOID                 pExtendedParameter)
        def self.CreateFileTransacted(
            lpFileName, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwCreationDisposition, dwFlagsAndAttributes,
                hTemplateFile, hTransaction, pusMiniVersion, pExtendedParameter) end
        encoded_function 'CreateFileTransacted',
                         [:string, :dword, :dword, SECURITY_ATTRIBUTES, :dword, :dword, :handle, :handle, :pointer,
                          :pointer], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createhardlinktransacteda
        # BOOL CreateHardLinkTransacted(
        #   _In_       LPCTSTR               lpFileName,
        #   _In_       LPCTSTR               lpExistingFileName,
        #   _Reserved_ LPSECURITY_ATTRIBUTES lpSecurityAttributes,
        #   _In_       HANDLE                hTransaction)
        def self.CreateHardLinkTransacted(lpFileName, lpExistingFileName, lpSecurityAttributes, hTransaction) end
        encoded_function 'CreateHardLinkTransacted', [:string, :string, SECURITY_ATTRIBUTES, :handle], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createsymboliclinka
        # BOOLEAN CreateSymbolicLink(
        #   _In_ LPTSTR lpSymlinkFileName,
        #   _In_ LPTSTR lpTargetFileName,
        #   _In_ DWORD  dwFlags)
        def self.CreateSymbolicLink(lpSymlinkFileName, lpTargetFileName, dwFlags) end
        encoded_function 'CreateSymbolicLink', [:string, :string, SymbolicLinkFlag], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createsymboliclinktransacteda
        # BOOLEAN CreateSymbolicLinkTransacted(
        #   _In_ LPTSTR lpSymlinkFileName,
        #   _In_ LPTSTR lpTargetFileName,
        #   _In_ DWORD  dwFlags,
        #   _In_ HANDLE hTransaction)
        def self.CreateSymbolicLinkTransacted(lpSymlinkFileName, lpTargetFileName, dwFlags, hTransaction) end
        encoded_function 'CreateSymbolicLinkTransacted', [:string, :string, SymbolicLinkFlag, :handle], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-deletefiletransacteda
        # BOOL DeleteFileTransacted(_In_ LPCTSTR lpFileName, _In_ HANDLE  hTransaction)
        def self.DeleteFileTransacted(lpFileName, hTransaction) end
        encoded_function 'DeleteFileTransacted', [:string, :handle], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findfirstfilenametransactedw
        # HANDLE FindFirstFileNameTransactedW(
        #   _In_     LPCWSTR lpFileName,
        #   _In_     DWORD   dwFlags,
        #   _Inout_  LPDWORD StringLength,
        #   _Inout_  PWCHAR  LinkName,
        #   _In_opt_ HANDLE  hTransaction)
        def self.FindFirstFileNameTransactedW(lpFileName, dwFlags, stringLength, linkName, hTransaction) end
        attach_function 'FindFirstFileNameTransactedW', [:string, :dword, :pointer, :pointer, :handle], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-findfirstfilenamew
        # HANDLE FindFirstFileNameW(
        #   _In_    LPCWSTR lpFileName,
        #   _In_    DWORD   dwFlags,
        #   _Inout_ LPDWORD StringLength,
        #   _Inout_ PWCHAR  LinkName)
        def self.FindFirstFileNameW(lpFileName, dwFlags, stringLength, linkName) end
        attach_function 'FindFirstFileNameW', [:string, :dword, :pointer, :pointer], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findfirstfiletransacteda
        # HANDLE FindFirstFileTransacted(
        #   _In_       LPCTSTR            lpFileName,
        #   _In_       FINDEX_INFO_LEVELS fInfoLevelId,
        #   _Out_      LPVOID             lpFindFileData,
        #   _In_       FINDEX_SEARCH_OPS  fSearchOp,
        #   _Reserved_ LPVOID             lpSearchFilter,
        #   _In_       DWORD              dwAdditionalFlags,
        #   _In_       HANDLE             hTransaction)
        def self.FindFirstFileTransacted(lpFileName, fInfoLevelId, lpFindFileData, fSearchOp, lpSearchFilter,
            dwAdditionalFlags, hTransaction) end
        encoded_function 'FindFirstFileTransacted',
                        [:string, FINDEX_INFO_LEVELS, :pointer, FINDEX_SEARCH_OPS, :pointer, FIND_FIRST_EX_FLAG,
                         :handle], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findfirststreamtransactedw
        # HANDLE FindFirstStreamTransactedW(
        #   _In_       LPCWSTR            lpFileName,
        #   _In_       STREAM_INFO_LEVELS InfoLevel,
        #   _Out_      LPVOID             lpFindStreamData,
        #   _Reserved_ DWORD              dwFlags,
        #   _In_       HANDLE             hTransaction)
        def self.FindFirstStreamTransactedW(lpFileName, infoLevel, lpFindStreamData, dwFlags, hTransaction) end
        attach_function 'FindFirstStreamTransactedW', [:string, STREAM_INFO_LEVELS, :pointer, :dword, :handle], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-findfirststreamw
        # HANDLE FindFirstStreamW(
        #   _In_       LPCWSTR            lpFileName,
        #   _In_       STREAM_INFO_LEVELS InfoLevel,
        #   _Out_      LPVOID             lpFindStreamData,
        #   _Reserved_ DWORD              dwFlags)
        def self.FindFirstStreamW(lpFileName, infoLevel, lpFindStreamData, dwFlags) end
        attach_function 'FindFirstStreamW', [:string, STREAM_INFO_LEVELS, :pointer, :dword], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-findnextfilenamew
        # BOOL FindNextFileNameW(_In_ HANDLE  hFindStream, _Inout_ LPDWORD StringLength, _Inout_ PWCHAR LinkName)
        def self.FindNextFileNameW(hFindStream, stringLength, linkName) end
        attach_function 'FindNextFileNameW', [:handle, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-findnextstreamw
        # BOOL FindNextStreamW(_In_  HANDLE hFindStream, _Out_ LPVOID lpFindStreamData)
        def self.FindNextStreamW(hFindStream, lpFindStreamData) end
        attach_function 'FindNextStreamW', [:handle, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getcompressedfilesizetransacteda
        # DWORD GetCompressedFileSizeTransacted(
        #   _In_      LPCTSTR lpFileName,
        #   _Out_opt_ LPDWORD lpFileSizeHigh,
        #   _In_      HANDLE  hTransaction)
        def self.GetCompressedFileSizeTransacted(lpFileName, lpFileSizeHigh, hTransaction) end
        encoded_function 'GetCompressedFileSizeTransacted', [:string, :pointer, :handle], :dword

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getfileattributestransacteda
        # BOOL GetFileAttributesTransacted(
        #   _In_  LPCTSTR                lpFileName,
        #   _In_  GET_FILEEX_INFO_LEVELS fInfoLevelId,
        #   _Out_ LPVOID                 lpFileInformation,
        #   _In_  HANDLE                 hTransaction)
        def self.GetFileAttributesTransacted(lpFileName, fInfoLevelId, lpFileInformation, hTransaction) end
        encoded_function 'GetFileAttributesTransacted', [:string, GET_FILEEX_INFO_LEVELS, :pointer, :handle], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getfilebandwidthreservation
        # BOOL GetFileBandwidthReservation(
        #   _In_  HANDLE  hFile,
        #   _Out_ LPDWORD lpPeriodMilliseconds,
        #   _Out_ LPDWORD lpBytesPerPeriod,
        #   _Out_ LPBOOL  pDiscardable,
        #   _Out_ LPDWORD lpTransferSize,
        #   _Out_ LPDWORD lpNumOutstandingRequests)
        def self.GetFileBandwidthReservation(
            hFile, lpPeriodMilliseconds, lpBytesPerPeriod, pDiscardable, lpTransferSize, lpNumOutstandingRequests) end
        attach_function 'GetFileBandwidthReservation', [:handle, :pointer, :pointer, :pointer, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getfileinformationbyhandleex
        # BOOL GetFileInformationByHandleEx(
        #   _In_  HANDLE                    hFile,
        #   _In_  FILE_INFO_BY_HANDLE_CLASS FileInformationClass,
        #   _Out_ LPVOID                    lpFileInformation,
        #   _In_  DWORD                     dwBufferSize)
        def self.GetFileInformationByHandleEx(hFile, fileInformationClass, lpFileInformation, dwBufferSize) end
        attach_function 'GetFileInformationByHandleEx', [:handle, FILE_INFO_BY_HANDLE_CLASS, :pointer, :dword], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getfinalpathnamebyhandlea
        # DWORD GetFinalPathNameByHandle(
        #   _In_  HANDLE hFile,
        #   _Out_ LPTSTR lpszFilePath,
        #   _In_  DWORD  cchFilePath,
        #   _In_  DWORD  dwFlags)
        def self.GetFinalPathNameByHandle(hFile, lpszFilePath, cchFilePath, dwFlags) end
        encoded_function 'GetFinalPathNameByHandle', [:handle, :string, :dword, :dword], :dword

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getfullpathnametransacteda
        # DWORD GetFullPathNameTransacted(
        #   _In_  LPCTSTR lpFileName,
        #   _In_  DWORD   nBufferLength,
        #   _Out_ LPTSTR  lpBuffer,
        #   _Out_ LPTSTR  *lpFilePart,
        #   _In_  HANDLE  hTransaction)
        def self.GetFullPathNameTransacted(lpFileName, nBufferLength, lpBuffer, lpFilePart, hTransaction) end
        encoded_function 'GetFullPathNameTransacted', [:string, :dword, :string, :string, :handle], :dword

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getlongpathnametransacteda
        # DWORD GetLongPathNameTransacted(
        #   _In_  LPCTSTR lpszShortPath,
        #   _Out_ LPTSTR  lpszLongPath,
        #   _In_  DWORD   cchBuffer,
        #   _In_  HANDLE  hTransaction)
        def self.GetLongPathNameTransacted(lpszShortPath, lpszLongPath, cchBuffer, hTransaction) end
        encoded_function 'GetLongPathNameTransacted', [:string, :string, :dword, :handle], :dword

        # https://docs.microsoft.com/en-us/windows/desktop/FileIO/getqueuedcompletionstatusex-func
        # BOOL GetQueuedCompletionStatusEx(
        #   _In_  HANDLE             CompletionPort,
        #   _Out_ LPOVERLAPPED_ENTRY lpCompletionPortEntries,
        #   _In_  ULONG              ulCount,
        #   _Out_ PULONG             ulNumEntriesRemoved,
        #   _In_  DWORD              dwMilliseconds,
        #   _In_  BOOL               fAlertable)
        def self.GetQueuedCompletionStatusEx(completionPort, lpCompletionPortEntries, ulCount, ulNumEntriesRemoved,
            dwMilliseconds, fAlertable) end
        attach_function 'GetQueuedCompletionStatusEx',
                        [:handle, OVERLAPPED_ENTRY.ptr(:out), :ulong, :pointer, :dword, :bool], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-movefiletransacteda
        # BOOL MoveFileTransacted(
        #   _In_     LPCTSTR            lpExistingFileName,
        #   _In_opt_ LPCTSTR            lpNewFileName,
        #   _In_opt_ LPPROGRESS_ROUTINE lpProgressRoutine,
        #   _In_opt_ LPVOID             lpData,
        #   _In_     DWORD              dwFlags,
        #   _In_     HANDLE             hTransaction)
        def self.MoveFileTransacted(lpExistingFileName, lpNewFileName, lpProgressRoutine, lpData, dwFlags, hTransaction)
        end
        encoded_function 'MoveFileTransacted',
                         [:string, :string, CopyProgressRoutine, :pointer, MoveFileFlag, :handle], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-openfilebyid
        # HANDLE OpenFileById(
        #   _In_     HANDLE                hFile,
        #   _In_     LPFILE_ID_DESCRIPTOR  lpFileID,
        #   _In_     DWORD                 dwDesiredAccess,
        #   _In_     DWORD                 dwShareMode,
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpSecurityAttributes,
        #   _In_     DWORD                 dwFlags)
        def self.OpenFileById(hFile, lpFileID, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwFlags) end
        attach_function 'OpenFileById',
                        [:handle, FILE_ID_DESCRIPTOR.ptr(:in), :dword, FileShareFlag, SECURITY_ATTRIBUTES.ptr(:in),
                         FileFlag], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-reopenfile
        # HANDLE ReOpenFile(
        #   _In_ HANDLE hOriginalFile,
        #   _In_ DWORD  dwDesiredAccess,
        #   _In_ DWORD  dwShareMode,
        #   _In_ DWORD  dwFlags)
        def self.ReOpenFile(hOriginalFile, dwDesiredAccess, dwShareMode, dwFlags) end
        attach_function 'ReOpenFile', [:handle, :dword, FileShareFlag, FileFlag], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setfileattributestransacteda
        # BOOL SetFileAttributesTransacted(
        #   _In_ LPCTSTR lpFileName,
        #   _In_ DWORD   dwFileAttributes,
        #   _In_ HANDLE  hTransaction)
        def self.SetFileAttributesTransacted(lpFileName, dwFileAttributes, hTransaction) end
        encoded_function 'SetFileAttributesTransacted', [:string, FileAttributeFlag, :handle], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setfilebandwidthreservation
        # BOOL SetFileBandwidthReservation(
        #   _In_  HANDLE  hFile,
        #   _In_  DWORD   nPeriodMilliseconds,
        #   _In_  DWORD   nBytesPerPeriod,
        #   _In_  BOOL    bDiscardable,
        #   _Out_ LPDWORD lpTransferSize,
        #   _Out_ LPDWORD lpNumOutstandingRequests)
        def self.SetFileBandwidthReservation(
            hFile, nPeriodMilliseconds, nBytesPerPeriod, bDiscardable, lpTransferSize, lpNumOutstandingRequests) end
        attach_function 'SetFileBandwidthReservation', [:handle, :dword, :dword, :bool, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setfilecompletionnotificationmodes
        # BOOL SetFileCompletionNotificationModes(_In_ HANDLE FileHandle, _In_ UCHAR  Flags)
        def self.SetFileCompletionNotificationModes(fileHandle, flags) end
        attach_function 'SetFileCompletionNotificationModes', [:handle, FileCompletion], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle
        # BOOL SetFileInformationByHandle(
        #   _In_ HANDLE                    hFile,
        #   _In_ FILE_INFO_BY_HANDLE_CLASS FileInformationClass,
        #   _In_ LPVOID                    lpFileInformation,
        #   _In_ DWORD                     dwBufferSize)
        def self.SetFileInformationByHandle(hFile, fileInformationClass, lpFileInformation, dwBufferSize) end
        attach_function 'SetFileInformationByHandle', [:handle, FILE_INFO_BY_HANDLE_CLASS, :pointer, :dword], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-setfileiooverlappedrange
        # BOOL SetFileIoOverlappedRange( _In_ HANDLE FileHandle, _In_ PUCHAR OverlappedRangeStart, _In_ ULONG  Length)
        def self.SetFileIoOverlappedRange(fileHandle, overlappedRangeStart, length) end
        attach_function 'SetFileIoOverlappedRange', [:handle, :pointer, :ulong], :bool

        if WINDOWS_VERSION >= 7
          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setsearchpathmode
          # BOOL SetSearchPathMode(_In_ DWORD Flags)
          def self.SetSearchPathMode(flags) end
          attach_function 'SetSearchPathMode', [BaseSearchPath], :bool

          if WINDOWS_VERSION >= 8
            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-copyfile2
            # HRESULT CopyFile2(
            #   _In_     PCWSTR                        pwszExistingFileName,
            #   _In_     PCWSTR                        pwszNewFileName,
            #   _In_opt_ COPYFILE2_EXTENDED_PARAMETERS *pExtendedParameters)
            def self.CopyFile2( pwszExistingFileName, pwszNewFileName, pExtendedParameters) end
            attach_function 'CopyFile2', [:string, :string, COPYFILE2_EXTENDED_PARAMETERS.ptr(:in)], :hresult

            # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-createfile2
            # HANDLE CreateFile2(
            #   _In_     LPCWSTR                           lpFileName,
            #   _In_     DWORD                             dwDesiredAccess,
            #   _In_     DWORD                             dwShareMode,
            #   _In_     DWORD                             dwCreationDisposition,
            #   _In_opt_ LPCREATEFILE2_EXTENDED_PARAMETERS pCreateExParams)
            def self.CreateFile2(lpFileName, dwDesiredAccess, dwShareMode, dwCreationDisposition, pCreateExParams) end
            attach_function 'CreateFile2',
                            [:string, GenericFlag, FileShareFlag, :dword, CREATEFILE2_EXTENDED_PARAMETERS], :handle
          end
        end
      end
    end
  end
end
