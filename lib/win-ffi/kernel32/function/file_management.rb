require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    require 'win-ffi/core/struct/large_integer'
    require 'win-ffi/core/struct/security_attributes'

    require 'win-ffi/kernel32/enum/file_management/copy_file_ex_state'
    require 'win-ffi/kernel32/enum/file_management/copy_file_flag'
    require 'win-ffi/kernel32/enum/file_management/file_share_flag'
    require 'win-ffi/kernel32/enum/file_management/file_attribute_flag'
    require 'win-ffi/kernel32/enum/file_management/file_position'
    require 'win-ffi/kernel32/enum/file_management/findex_info_levels'
    require 'win-ffi/kernel32/enum/file_management/findex_search_ops'
    require 'win-ffi/kernel32/enum/file_management/get_fileex_info_levels'
    require 'win-ffi/kernel32/enum/file_management/find_first_ex_flag'
    require 'win-ffi/kernel32/enum/file_management/move_file_flag'
    require 'win-ffi/kernel32/enum/generic_flag'
    require 'win-ffi/kernel32/struct/file_management/by_handle_file_information'
    require 'win-ffi/kernel32/enum/file_management/symbolic_link_flag'
    require 'win-ffi/kernel32/enum/file_management/replace_flag'
    require 'win-ffi/kernel32/enum/file_management/base_search_path'
    require 'win-ffi/kernel32/enum/file_management/stream_info_files'

    require 'win-ffi/kernel32/struct/file_management/file_id_descriptor'
    require 'win-ffi/kernel32/struct/file_management/file_segment_element'
    require 'win-ffi/kernel32/struct/file_management/of_struct'
    require 'win-ffi/kernel32/struct/synchronization/overlapped'
    require 'win-ffi/kernel32/struct/file_management/win32_find_data'

    module Kernel32

      typedef :handle, :hfile

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363854(v=vs.85).aspx
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

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364052(v=vs.85).aspx
      # VOID CALLBACK FileIOCompletionRoutine(
      #   _In_    DWORD        dwErrorCode,
      #   _In_    DWORD        dwNumberOfBytesTransfered,
      #   _Inout_ LPOVERLAPPED lpOverlapped)
      FileIOCompletionRoutine = callback 'FileIOCompletionRoutine', [:dword, :dword, OVERLAPPED.ptr], :void


      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363781(v=vs.85).aspx
      # BOOL WINAPI AreFileApisANSI(void)
      attach_function 'AreFileApisANSI', [], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363791(v=vs.85).aspx
      # BOOL WINAPI CancelIo(_In_ HANDLE hFile)
      attach_function 'CancelIo', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363851(v=vs.85).aspx
      # BOOL WINAPI CopyFile(
      #   _In_ LPCTSTR lpExistingFileName,
      #   _In_ LPCTSTR lpNewFileName,
      #   _In_ BOOL    bFailIfExists)
      encoded_function 'CopyFile', [:string, :string, :bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363852(v=vs.85).aspx
      # BOOL WINAPI CopyFileEx(
      #   _In_     LPCTSTR            lpExistingFileName,
      #   _In_     LPCTSTR            lpNewFileName,
      #   _In_opt_ LPPROGRESS_ROUTINE lpProgressRoutine,
      #   _In_opt_ LPVOID             lpData,
      #   _In_opt_ LPBOOL             pbCancel,
      #   _In_     DWORD              dwCopyFlags)
      encoded_function 'CopyFileEx', [:string, :string, CopyProgressRoutine, :pointer, :pointer, CopyFileFlag], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363858(v=vs.85).aspx
      # HANDLE WINAPI CreateFile(
      #   _In_     LPCTSTR               lpFileName,
      #   _In_     DWORD                 dwDesiredAccess,
      #   _In_     DWORD                 dwShareMode,
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpSecurityAttributes,
      #   _In_     DWORD                 dwCreationDisposition,
      #   _In_     DWORD                 dwFlagsAndAttributes,
      #   _In_opt_ HANDLE                hTemplateFile)
      encoded_function 'CreateFile',
                       [:string, GenericFlag, FileShareFlag, SECURITY_ATTRIBUTES, :dword, :dword, :handle], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363860(v=vs.85).aspx
      # BOOL WINAPI CreateHardLink(
      #   _In_       LPCTSTR               lpFileName,
      #   _In_       LPCTSTR               lpExistingFileName,
      #   _Reserved_ LPSECURITY_ATTRIBUTES lpSecurityAttributes)
      encoded_function 'CreateHardLink', [:string, :string, SECURITY_ATTRIBUTES], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363862(v=vs.85).aspx
      # HANDLE WINAPI CreateIoCompletionPort(
      #   _In_     HANDLE    FileHandle,
      #   _In_opt_ HANDLE    ExistingCompletionPort,
      #   _In_     ULONG_PTR CompletionKey,
      #   _In_     DWORD     NumberOfConcurrentThreads)
      # encoded_function 'CreateIoCompletionPort', [:handle, :handle, :ulong, :dword], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363915(v=vs.85).aspx
      # BOOL WINAPI DeleteFile(_In_ LPCTSTR lpFileName)
      encoded_function 'DeleteFile', [:string], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364413(v=vs.85).aspx
      # BOOL WINAPI FindClose(_Inout_ HANDLE hFindFile)
      attach_function 'FindClose', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364418(v=vs.85).aspx
      # HANDLE WINAPI FindFirstFile(
      #   _In_  LPCTSTR           lpFileName,
      #   _Out_ LPWIN32_FIND_DATA lpFindFileData)
      encoded_function 'FindFirstFile', [:string, WIN32_FIND_DATA.ptr(:out)], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364419(v=vs.85).aspx
      # HANDLE WINAPI FindFirstFileEx(
      #   _In_       LPCTSTR            lpFileName,
      #   _In_       FINDEX_INFO_LEVELS fInfoLevelId,
      #   _Out_      LPVOID             lpFindFileData,
      #   _In_       FINDEX_SEARCH_OPS  fSearchOp,
      #   _Reserved_ LPVOID             lpSearchFilter,
      #   _In_       DWORD              dwAdditionalFlags)
      encoded_function 'FindFirstFileEx',
                       [:string, FINDEX_INFO_LEVELS, :pointer, FINDEX_SEARCH_OPS, :pointer,
                        FIND_FIRST_EX_FLAG], :handle

      # BOOL WINAPI FindNextFile(
      #   _In_  HANDLE            hFindFile,
      #   _Out_ LPWIN32_FIND_DATA lpFindFileData)
      encoded_function 'FindNextFile', [:handle, WIN32_FIND_DATA.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364439(v=vs.85).aspx
      # BOOL WINAPI FlushFileBuffers(_In_ HANDLE hFile)
      attach_function 'FlushFileBuffers', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364819(v=vs.85).aspx
      # BOOL WINAPI GetBinaryType(_In_  LPCTSTR lpApplicationName, _Out_ LPDWORD lpBinaryType)
      attach_function 'GetBinaryType', [:string, :pointer], :bool
      encoded_function 'GetBinaryType', [:string, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364930(v=vs.85).aspx
      # DWORD WINAPI GetCompressedFileSize(
      #   _In_      LPCTSTR lpFileName,
      #   _Out_opt_ LPDWORD lpFileSizeHigh)
      encoded_function 'GetCompressedFileSize', [:string, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364944(v=vs.85).aspx
      # DWORD WINAPI GetFileAttributes(_In_ LPCTSTR lpFileName)
      encoded_function 'GetFileAttributes', [:string], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364946(v=vs.85).aspx
      # BOOL WINAPI GetFileAttributesEx(
      #   _In_  LPCTSTR                lpFileName,
      #   _In_  GET_FILEEX_INFO_LEVELS fInfoLevelId,
      #   _Out_ LPVOID                 lpFileInformation)
      encoded_function 'GetFileAttributesEx', [:string, GET_FILEEX_INFO_LEVELS, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364952(v=vs.85).aspx
      # BOOL WINAPI GetFileInformationByHandle(
      #   _In_  HANDLE                       hFile,
      #   _Out_ LPBY_HANDLE_FILE_INFORMATION lpFileInformation)
      attach_function 'GetFileInformationByHandle', [:handle, BY_HANDLE_FILE_INFORMATION.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364955(v=vs.85).aspx
      # DWORD WINAPI GetFileSize(_In_      HANDLE  hFile, _Out_opt_ LPDWORD lpFileSizeHigh)
      attach_function 'GetFileSize', [:handle, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364957(v=vs.85).aspx
      # BOOL WINAPI GetFileSizeEx(_In_  HANDLE hFile, _Out_ PLARGE_INTEGER lpFileSize)
      attach_function 'GetFileSizeEx', [:handle, LARGE_INTEGER.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364960(v=vs.85).aspx
      # DWORD WINAPI GetFileType(_In_ HANDLE hFile)
      attach_function 'GetFileType', [:handle], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364963(v=vs.85).aspx
      # DWORD WINAPI GetFullPathName(
      #   _In_  LPCTSTR lpFileName,
      #   _In_  DWORD   nBufferLength,
      #   _Out_ LPTSTR  lpBuffer,
      #   _Out_ LPTSTR  *lpFilePart)
      encoded_function 'GetFullPathName', [:string, :dword, :string, :string], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364980(v=vs.85).aspx
      # DWORD WINAPI GetLongPathName(
      #   _In_  LPCTSTR lpszShortPath,
      #   _Out_ LPTSTR  lpszLongPath,
      #   _In_  DWORD   cchBuffer)
      encoded_function 'GetLongPathName', [:string, :string, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364986(v=vs.85).aspx
      # BOOL WINAPI GetQueuedCompletionStatus(
      #   _In_  HANDLE       CompletionPort,
      #   _Out_ LPDWORD      lpNumberOfBytes,
      #   _Out_ PULONG_PTR   lpCompletionKey,
      #   _Out_ LPOVERLAPPED *lpOverlapped,
      #   _In_  DWORD        dwMilliseconds)
      attach_function 'GetQueuedCompletionStatus', [:handle, :pointer, :pointer, OVERLAPPED.ptr(:out), :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364989(v=vs.85).aspx
      # DWORD WINAPI GetShortPathName(
      #   _In_  LPCTSTR lpszLongPath,
      #   _Out_ LPTSTR  lpszShortPath,
      #   _In_  DWORD   cchBuffer)
      encoded_function 'GetShortPathName', [:string, :string, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364991(v=vs.85).aspx
      # UINT WINAPI GetTempFileName(
      #   _In_  LPCTSTR lpPathName,
      #   _In_  LPCTSTR lpPrefixString,
      #   _In_  UINT    uUnique,
      #   _Out_ LPTSTR  lpTempFileName)
      encoded_function 'GetTempFileName', [:string, :string, :uint, :string], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364992(v=vs.85).aspx
      # DWORD WINAPI GetTempPath(_In_  DWORD  nBufferLength, _Out_ LPTSTR lpBuffer)
      encoded_function 'GetTempPath', [:dword, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365202(v=vs.85).aspx
      # BOOL WINAPI LockFile(
      #   _In_ HANDLE hFile,
      #   _In_ DWORD  dwFileOffsetLow,
      #   _In_ DWORD  dwFileOffsetHigh,
      #   _In_ DWORD  nNumberOfBytesToLockLow,
      #   _In_ DWORD  nNumberOfBytesToLockHigh)
      attach_function 'LockFile', [:handle, :dword, :dword, :dword, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365203(v=vs.85).aspx
      # BOOL WINAPI LockFileEx(
      #   _In_       HANDLE       hFile,
      #   _In_       DWORD        dwFlags,
      #   _Reserved_ DWORD        dwReserved,
      #   _In_       DWORD        nNumberOfBytesToLockLow,
      #   _In_       DWORD        nNumberOfBytesToLockHigh,
      #   _Inout_    LPOVERLAPPED lpOverlapped)
      attach_function 'LockFileEx', [:handle, :dword, :dword, :dword, :dword, OVERLAPPED.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365239(v=vs.85).aspx
      # BOOL WINAPI MoveFile(_In_ LPCTSTR lpExistingFileName, _In_ LPCTSTR lpNewFileName)
      encoded_function 'MoveFile', [:string, :string], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365240(v=vs.85).aspx
      # BOOL WINAPI MoveFileEx(
      #   _In_     LPCTSTR lpExistingFileName,
      #   _In_opt_ LPCTSTR lpNewFileName,
      #   _In_     DWORD   dwFlags)
      encoded_function 'MoveFileEx', [:string, :string, MoveFileFlag], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365242(v=vs.85).aspx
      # BOOL WINAPI MoveFileWithProgress(
      #   _In_     LPCTSTR            lpExistingFileName,
      #   _In_opt_ LPCTSTR            lpNewFileName,
      #   _In_opt_ LPPROGRESS_ROUTINE lpProgressRoutine,
      #   _In_opt_ LPVOID             lpData,
      #   _In_     DWORD              dwFlags)
      encoded_function 'MoveFileWithProgress', [:string, :string, CopyProgressRoutine, :pointer, MoveFileFlag], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365430(v=vs.85).aspx
      # HFILE WINAPI OpenFile(
      #   _In_  LPCSTR     lpFileName,
      #   _Out_ LPOFSTRUCT lpReOpenBuff,
      #   _In_  UINT       uStyle)
      attach_function 'OpenFile', [:string, OFSTRUCT.ptr(:out), OpenFileFlag], :hfile

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365458(v=vs.85).aspx
      # BOOL WINAPI PostQueuedCompletionStatus(
      #   _In_     HANDLE       CompletionPort,
      #   _In_     DWORD        dwNumberOfBytesTransferred,
      #   _In_     ULONG_PTR    dwCompletionKey,
      #   _In_opt_ LPOVERLAPPED lpOverlapped)
      attach_function 'PostQueuedCompletionStatus', [:handle, :dword, :ulong, OVERLAPPED.ptr(:in)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365467(v=vs.85).aspx
      # BOOL WINAPI ReadFile(
      #   _In_        HANDLE       hFile,
      #   _Out_       LPVOID       lpBuffer,
      #   _In_        DWORD        nNumberOfBytesToRead,
      #   _Out_opt_   LPDWORD      lpNumberOfBytesRead,
      #   _Inout_opt_ LPOVERLAPPED lpOverlapped)
      attach_function 'ReadFile', [:handle, :pointer, :dword, :pointer, OVERLAPPED.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365468(v=vs.85).aspx
      # BOOL WINAPI ReadFileEx(
      #   _In_      HANDLE                          hFile,
      #   _Out_opt_ LPVOID                          lpBuffer,
      #   _In_      DWORD                           nNumberOfBytesToRead,
      #   _Inout_   LPOVERLAPPED                    lpOverlapped,
      #   _In_      LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine)
      attach_function 'ReadFileEx', [:handle, :pointer, :dword, OVERLAPPED.ptr, FileIOCompletionRoutine], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365469(v=vs.85).aspx
      # BOOL WINAPI ReadFileScatter(
      #   _In_       HANDLE               hFile,
      #   _In_       FILE_SEGMENT_ELEMENT aSegmentArray[],
      #   _In_       DWORD                nNumberOfBytesToRead,
      #   _Reserved_ LPDWORD              lpReserved,
      #   _Inout_    LPOVERLAPPED         lpOverlapped)
      attach_function 'ReadFileScatter', [:handle, :pointer, :dword, :pointer, OVERLAPPED.ptr], :bool

      # BOOL WINAPI ReplaceFile(
      #   _In_       LPCTSTR lpReplacedFileName,
      #   _In_       LPCTSTR lpReplacementFileName,
      #   _In_opt_   LPCTSTR lpBackupFileName,
      #   _In_       DWORD   dwReplaceFlags,
      #   _Reserved_ LPVOID  lpExclude,
      #   _Reserved_ LPVOID  lpReserved)
      encoded_function 'ReplaceFile', [:string, :string, :string, ReplaceFlag, :pointer, :pointer], :bool
      attach_function 'ReplaceFile', [:string, :string, :string, ReplaceFlag, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365527(v=vs.85).aspx
      # DWORD WINAPI SearchPath(
      #   _In_opt_  LPCTSTR lpPath,
      #   _In_      LPCTSTR lpFileName,
      #   _In_opt_  LPCTSTR lpExtension,
      #   _In_      DWORD   nBufferLength,
      #   _Out_     LPTSTR  lpBuffer,
      #   _Out_opt_ LPTSTR  *lpFilePart)
      encoded_function 'SearchPath', [:string, :string, :string, :dword, :string, :string], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365531(v=vs.85).aspx
      # BOOL WINAPI SetEndOfFile( _In_ HANDLE hFile)
      attach_function 'SetEndOfFile', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365533(v=vs.85).aspx
      # void WINAPI SetFileApisToANSI(void)
      attach_function 'SetFileApisToANSI', [], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365534(v=vs.85).aspx
      # void WINAPI SetFileApisToOEM(void)
      attach_function 'SetFileApisToOEM', [], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365535(v=vs.85).aspx
      # BOOL WINAPI SetFileAttributes(_In_ LPCTSTR lpFileName, _In_ DWORD   dwFileAttributes)
      encoded_function 'SetFileAttributes', [:string, FileAttributeFlag], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365541(v=vs.85).aspx
      # DWORD WINAPI SetFilePointer(
      #   _In_        HANDLE hFile,
      #   _In_        LONG   lDistanceToMove,
      #   _Inout_opt_ PLONG  lpDistanceToMoveHigh,
      #   _In_        DWORD  dwMoveMethod)
      attach_function 'SetFilePointer', [:handle, :long, :pointer, FilePosition], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365542(v=vs.85).aspx
      # BOOL WINAPI SetFilePointerEx(
      #   _In_      HANDLE         hFile,
      #   _In_      LARGE_INTEGER  liDistanceToMove,
      #   _Out_opt_ PLARGE_INTEGER lpNewFilePointer,
      #   _In_      DWORD          dwMoveMethod)
      attach_function 'SetFilePointerEx', [:handle, LARGE_INTEGER.ptr(:in), LARGE_INTEGER.ptr(:out), FilePosition], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365543(v=vs.85).aspx
      # BOOL WINAPI SetFileShortName(_In_ HANDLE  hFile, _In_ LPCTSTR lpShortName)
      encoded_function 'SetFileShortName', [:handle, :string], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365544(v=vs.85).aspx
      # BOOL WINAPI SetFileValidData(_In_ HANDLE   hFile, _In_ LONGLONG ValidDataLength)
      attach_function 'SetFileValidData', [:handle, :long_long], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365715(v=vs.85).aspx
      # BOOL WINAPI UnlockFile(
      #   _In_ HANDLE hFile,
      #   _In_ DWORD  dwFileOffsetLow,
      #   _In_ DWORD  dwFileOffsetHigh,
      #   _In_ DWORD  nNumberOfBytesToUnlockLow,
      #   _In_ DWORD  nNumberOfBytesToUnlockHigh)
      attach_function 'UnlockFile', [:handle, :dword, :dword, :dword, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365716(v=vs.85).aspx
      # BOOL WINAPI UnlockFileEx(
      #   _In_       HANDLE       hFile,
      #   _Reserved_ DWORD        dwReserved,
      #   _In_       DWORD        nNumberOfBytesToUnlockLow,
      #   _In_       DWORD        nNumberOfBytesToUnlockHigh,
      #   _Inout_    LPOVERLAPPED lpOverlapped)
      attach_function 'UnlockFileEx', [:handle, :dword, :dword, :dword, OVERLAPPED.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365747(v=vs.85).aspx
      # BOOL WINAPI WriteFile(
      #   _In_        HANDLE       hFile,
      #   _In_        LPCVOID      lpBuffer,
      #   _In_        DWORD        nNumberOfBytesToWrite,
      #   _Out_opt_   LPDWORD      lpNumberOfBytesWritten,
      #   _Inout_opt_ LPOVERLAPPED lpOverlapped)
      attach_function 'WriteFile', [:handle, :pointer, :dword, :pointer, OVERLAPPED.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365748(v=vs.85).aspx
      # BOOL WINAPI WriteFileEx(
      #   _In_     HANDLE                          hFile,
      #   _In_opt_ LPCVOID                         lpBuffer,
      #   _In_     DWORD                           nNumberOfBytesToWrite,
      #   _Inout_  LPOVERLAPPED                    lpOverlapped,
      #   _In_     LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine)
      attach_function 'WriteFileEx', [:handle, :pointer, :dword, OVERLAPPED.ptr, FileIOCompletionRoutine], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365749(v=vs.85).aspx
      # BOOL WINAPI WriteFileGather(
      #   _In_       HANDLE               hFile,
      #   _In_       FILE_SEGMENT_ELEMENT aSegmentArray[],
      #   _In_       DWORD                nNumberOfBytesToWrite,
      #   _Reserved_ LPDWORD              lpReserved,
      #   _Inout_    LPOVERLAPPED         lpOverlapped)
      attach_function 'WriteFileGather',
                      [:handle, FILE_SEGMENT_ELEMENT.ptr(:in), :dword, :pointer, OVERLAPPED.ptr], :bool

      if WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363792(v=vs.85).aspx
        # BOOL WINAPI CancelIoEx(_In_ HANDLE hFile, _In_opt_ LPOVERLAPPED lpOverlapped)
        attach_function 'CancelIoEx', [:handle, OVERLAPPED.ptr(:in)], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363794(v=vs.85).aspx
        # BOOL WINAPI CancelSynchronousIo(_In_ HANDLE hThread)
        attach_function 'CancelSynchronousIo', [:handle], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363807(v=vs.85).aspx
        # BOOL WINAPI CheckNameLegalDOS8Dot3(
        #   _In_      LPCTSTR lpName,
        #   _Out_opt_ LPSTR   lpOemName,
        #   _In_      DWORD   OemNameSize,
        #   _Out_opt_ PBOOL   pbNameContainsSpaces,
        #   _Out_     PBOOL   pbNameLegal)
        encoded_function 'CheckNameLegalDOS8Dot3', [:string, :string, :dword, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363853(v=vs.85).aspx
        # BOOL WINAPI CopyFileTransacted(
        #   _In_     LPCTSTR            lpExistingFileName,
        #   _In_     LPCTSTR            lpNewFileName,
        #   _In_opt_ LPPROGRESS_ROUTINE lpProgressRoutine,
        #   _In_opt_ LPVOID             lpData,
        #   _In_opt_ LPBOOL             pbCancel,
        #   _In_     DWORD              dwCopyFlags,
        #   _In_     HANDLE             hTransaction)
        encoded_function 'CopyFileTransacted',
                         [:string, :string, CopyProgressRoutine, :pointer, :pointer, CopyFileFlag, :handle], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363859(v=vs.85).aspx
        # HANDLE WINAPI CreateFileTransacted(
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
        encoded_function 'CreateFileTransacted',
                         [:string, :dword, :dword, SECURITY_ATTRIBUTES, :dword, :dword, :handle, :handle, :pointer,
                          :pointer], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363861(v=vs.85).aspx
        # BOOL WINAPI CreateHardLinkTransacted(
        #   _In_       LPCTSTR               lpFileName,
        #   _In_       LPCTSTR               lpExistingFileName,
        #   _Reserved_ LPSECURITY_ATTRIBUTES lpSecurityAttributes,
        #   _In_       HANDLE                hTransaction)
        encoded_function 'CreateHardLinkTransacted', [:string, :string, SECURITY_ATTRIBUTES, :handle], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363866(v=vs.85).aspx
        # BOOLEAN WINAPI CreateSymbolicLink(
        #   _In_ LPTSTR lpSymlinkFileName,
        #   _In_ LPTSTR lpTargetFileName,
        #   _In_ DWORD  dwFlags)
        encoded_function 'CreateSymbolicLink', [:string, :string, SymbolicLinkFlag], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363867(v=vs.85).aspx
        # BOOLEAN WINAPI CreateSymbolicLinkTransacted(
        #   _In_ LPTSTR lpSymlinkFileName,
        #   _In_ LPTSTR lpTargetFileName,
        #   _In_ DWORD  dwFlags,
        #   _In_ HANDLE hTransaction)
        encoded_function 'CreateSymbolicLinkTransacted', [:string, :string, SymbolicLinkFlag, :handle], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363916(v=vs.85).aspx
        # BOOL WINAPI DeleteFileTransacted(_In_ LPCTSTR lpFileName, _In_ HANDLE  hTransaction)
        encoded_function 'DeleteFileTransacted', [:string, :handle], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364420(v=vs.85).aspx
        # HANDLE WINAPI FindFirstFileNameTransactedW(
        #   _In_     LPCWSTR lpFileName,
        #   _In_     DWORD   dwFlags,
        #   _Inout_  LPDWORD StringLength,
        #   _Inout_  PWCHAR  LinkName,
        #   _In_opt_ HANDLE  hTransaction)
        attach_function 'FindFirstFileNameTransactedW', [:string, :dword, :pointer, :pointer, :handle], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364421(v=vs.85).aspx
        # HANDLE WINAPI FindFirstFileNameW(
        #   _In_    LPCWSTR lpFileName,
        #   _In_    DWORD   dwFlags,
        #   _Inout_ LPDWORD StringLength,
        #   _Inout_ PWCHAR  LinkName)
        attach_function 'FindFirstFileNameW', [:string, :dword, :pointer, :pointer], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364422(v=vs.85).aspx
        # HANDLE WINAPI FindFirstFileTransacted(
        #   _In_       LPCTSTR            lpFileName,
        #   _In_       FINDEX_INFO_LEVELS fInfoLevelId,
        #   _Out_      LPVOID             lpFindFileData,
        #   _In_       FINDEX_SEARCH_OPS  fSearchOp,
        #   _Reserved_ LPVOID             lpSearchFilter,
        #   _In_       DWORD              dwAdditionalFlags,
        #   _In_       HANDLE             hTransaction)
        encoded_function 'FindFirstFileTransacted',
                        [:string, FINDEX_INFO_LEVELS, :pointer, FINDEX_SEARCH_OPS, :pointer, FIND_FIRST_EX_FLAG,
                         :handle], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364423(v=vs.85).aspx
        # HANDLE WINAPI FindFirstStreamTransactedW(
        #   _In_       LPCWSTR            lpFileName,
        #   _In_       STREAM_INFO_LEVELS InfoLevel,
        #   _Out_      LPVOID             lpFindStreamData,
        #   _Reserved_ DWORD              dwFlags,
        #   _In_       HANDLE             hTransaction)
        attach_function 'FindFirstStreamTransactedW', [:string, STREAM_INFO_LEVELS, :pointer, :dword, :handle], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364424(v=vs.85).aspx
        # HANDLE WINAPI FindFirstStreamW(
        #   _In_       LPCWSTR            lpFileName,
        #   _In_       STREAM_INFO_LEVELS InfoLevel,
        #   _Out_      LPVOID             lpFindStreamData,
        #   _Reserved_ DWORD              dwFlags)
        attach_function 'FindFirstStreamW', [:string, STREAM_INFO_LEVELS, :pointer, :dword], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364429(v=vs.85).aspx
        # BOOL WINAPI FindNextFileNameW(
        #   _In_    HANDLE  hFindStream,
        #   _Inout_ LPDWORD StringLength,
        #   _Inout_ PWCHAR  LinkName)
        attach_function 'FindNextFileNameW', [:handle, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364430(v=vs.85).aspx
        # BOOL WINAPI FindNextStreamW(_In_  HANDLE hFindStream, _Out_ LPVOID lpFindStreamData)
        attach_function 'FindNextStreamW', [:handle, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364933(v=vs.85).aspx
        # DWORD WINAPI GetCompressedFileSizeTransacted(
        #   _In_      LPCTSTR lpFileName,
        #   _Out_opt_ LPDWORD lpFileSizeHigh,
        #   _In_      HANDLE  hTransaction)
        encoded_function 'GetCompressedFileSizeTransacted', [:string, :pointer, :handle], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364949(v=vs.85).aspx
        # BOOL WINAPI GetFileAttributesTransacted(
        #   _In_  LPCTSTR                lpFileName,
        #   _In_  GET_FILEEX_INFO_LEVELS fInfoLevelId,
        #   _Out_ LPVOID                 lpFileInformation,
        #   _In_  HANDLE                 hTransaction)
        encoded_function 'GetFileAttributesTransacted', [:string, GET_FILEEX_INFO_LEVELS, :pointer, :handle], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364951(v=vs.85).aspx
        # BOOL WINAPI GetFileBandwidthReservation(
        #   _In_  HANDLE  hFile,
        #   _Out_ LPDWORD lpPeriodMilliseconds,
        #   _Out_ LPDWORD lpBytesPerPeriod,
        #   _Out_ LPBOOL  pDiscardable,
        #   _Out_ LPDWORD lpTransferSize,
        #   _Out_ LPDWORD lpNumOutstandingRequests)
        attach_function 'GetFileBandwidthReservation', [:handle, :pointer, :pointer, :pointer, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364953(v=vs.85).aspx
        # BOOL WINAPI GetFileInformationByHandleEx(
        #   _In_  HANDLE                    hFile,
        #   _In_  FILE_INFO_BY_HANDLE_CLASS FileInformationClass,
        #   _Out_ LPVOID                    lpFileInformation,
        #   _In_  DWORD                     dwBufferSize)
        attach_function 'GetFileInformationByHandleEx', [:handle, FILE_INFO_BY_HANDLE_CLASS, :pointer, :dword], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364962(v=vs.85).aspx
        # DWORD WINAPI GetFinalPathNameByHandle(
        #   _In_  HANDLE hFile,
        #   _Out_ LPTSTR lpszFilePath,
        #   _In_  DWORD  cchFilePath,
        #   _In_  DWORD  dwFlags)
        encoded_function 'GetFinalPathNameByHandle', [:handle, :string, :dword, :dword], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364966(v=vs.85).aspx
        # DWORD WINAPI GetFullPathNameTransacted(
        #   _In_  LPCTSTR lpFileName,
        #   _In_  DWORD   nBufferLength,
        #   _Out_ LPTSTR  lpBuffer,
        #   _Out_ LPTSTR  *lpFilePart,
        #   _In_  HANDLE  hTransaction)
        encoded_function 'GetFullPathNameTransacted', [:string, :dword, :string, :string, :handle], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364982(v=vs.85).aspx
        # DWORD WINAPI GetLongPathNameTransacted(
        #   _In_  LPCTSTR lpszShortPath,
        #   _Out_ LPTSTR  lpszLongPath,
        #   _In_  DWORD   cchBuffer,
        #   _In_  HANDLE  hTransaction)
        encoded_function 'GetLongPathNameTransacted', [:string, :string, :dword, :handle], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364988(v=vs.85).aspx
        # BOOL WINAPI GetQueuedCompletionStatusEx(
        #   _In_  HANDLE             CompletionPort,
        #   _Out_ LPOVERLAPPED_ENTRY lpCompletionPortEntries,
        #   _In_  ULONG              ulCount,
        #   _Out_ PULONG             ulNumEntriesRemoved,
        #   _In_  DWORD              dwMilliseconds,
        #   _In_  BOOL               fAlertable)
        attach_function 'GetQueuedCompletionStatusEx',
                        [:handle, OVERLAPPED_ENTRY.ptr(:out), :ulong, :pointer, :dword, :bool], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365241(v=vs.85).aspx
        # BOOL WINAPI MoveFileTransacted(
        #   _In_     LPCTSTR            lpExistingFileName,
        #   _In_opt_ LPCTSTR            lpNewFileName,
        #   _In_opt_ LPPROGRESS_ROUTINE lpProgressRoutine,
        #   _In_opt_ LPVOID             lpData,
        #   _In_     DWORD              dwFlags,
        #   _In_     HANDLE             hTransaction)
        encoded_function 'MoveFileTransacted',
                         [:string, :string, CopyProgressRoutine, :pointer, MoveFileFlag, :handle], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365432(v=vs.85).aspx
        # HANDLE WINAPI OpenFileById(
        #   _In_     HANDLE                hFile,
        #   _In_     LPFILE_ID_DESCRIPTOR  lpFileID,
        #   _In_     DWORD                 dwDesiredAccess,
        #   _In_     DWORD                 dwShareMode,
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpSecurityAttributes,
        #   _In_     DWORD                 dwFlags)
        attach_function 'OpenFileById',
                        [:handle, FILE_ID_DESCRIPTOR.ptr(:in), :dword, FileShareFlag, SECURITY_ATTRIBUTES.ptr(:in),
                         FileFlag], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365497(v=vs.85).aspx
        # HANDLE WINAPI ReOpenFile(
        #   _In_ HANDLE hOriginalFile,
        #   _In_ DWORD  dwDesiredAccess,
        #   _In_ DWORD  dwShareMode,
        #   _In_ DWORD  dwFlags)
        attach_function 'ReOpenFile', [:handle, :dword, FileShareFlag, FileFlag], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365536(v=vs.85).aspx
        # BOOL WINAPI SetFileAttributesTransacted(
        #   _In_ LPCTSTR lpFileName,
        #   _In_ DWORD   dwFileAttributes,
        #   _In_ HANDLE  hTransaction)
        encoded_function 'SetFileAttributesTransacted', [:string, :FileAttributeFlag, :handle], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365537(v=vs.85).aspx
        # BOOL WINAPI SetFileBandwidthReservation(
        #   _In_  HANDLE  hFile,
        #   _In_  DWORD   nPeriodMilliseconds,
        #   _In_  DWORD   nBytesPerPeriod,
        #   _In_  BOOL    bDiscardable,
        #   _Out_ LPDWORD lpTransferSize,
        #   _Out_ LPDWORD lpNumOutstandingRequests)
        attach_function 'SetFileBandwidthReservation', [:handle, :dword, :dword, :bool, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365538(v=vs.85).aspx
        # BOOL WINAPI SetFileCompletionNotificationModes(_In_ HANDLE FileHandle, _In_ UCHAR  Flags)
        attach_function 'SetFileCompletionNotificationModes', [:handle, FileCompletion], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365539(v=vs.85).aspx
        # BOOL WINAPI SetFileInformationByHandle(
        #   _In_ HANDLE                    hFile,
        #   _In_ FILE_INFO_BY_HANDLE_CLASS FileInformationClass,
        #   _In_ LPVOID                    lpFileInformation,
        #   _In_ DWORD                     dwBufferSize)
        attach_function 'SetFileInformationByHandle', [:handle, FILE_INFO_BY_HANDLE_CLASS, :pointer, :dword], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365540(v=vs.85).aspx
        # BOOL WINAPI SetFileIoOverlappedRange(
        #   _In_ HANDLE FileHandle,
        #   _In_ PUCHAR OverlappedRangeStart,
        #   _In_ ULONG  Length)
        attach_function 'SetFileIoOverlappedRange', [:handle, :pointer, :ulong], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365743(v=vs.85).aspx
        # BOOL WINAPI Wow64DisableWow64FsRedirection(_Out_ PVOID *OldValue)
        attach_function 'Wow64DisableWow64FsRedirection', [:pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365744(v=vs.85).aspx
        # BOOLEAN WINAPI Wow64EnableWow64FsRedirection(_In_ BOOLEAN Wow64FsEnableRedirection)
        attach_function 'Wow64EnableWow64FsRedirection', [:bool], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365745(v=vs.85).aspx
        # BOOL WINAPI Wow64RevertWow64FsRedirection( _In_ PVOID OldValue)
        attach_function 'Wow64RevertWow64FsRedirection', [:pointer], :bool


        if WindowsVersion >= 7
          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd266735(v=vs.85).aspx
          # BOOL WINAPI SetSearchPathMode(_In_ DWORD Flags)
          attach_function 'SetSearchPathMode', [BaseSearchPath], :bool

          if WindowsVersion >= 8
            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh449404(v=vs.85).aspx
            # HRESULT WINAPI CopyFile2(
            #   _In_     PCWSTR                        pwszExistingFileName,
            #   _In_     PCWSTR                        pwszNewFileName,
            #   _In_opt_ COPYFILE2_EXTENDED_PARAMETERS *pExtendedParameters)
            attach_function 'CopyFile2', [:string, :string, COPYFILE2_EXTENDED_PARAMETERS.ptr(:in)], :hresult

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh449422(v=vs.85).aspx
            # HANDLE WINAPI CreateFile2(
            #   _In_     LPCWSTR                           lpFileName,
            #   _In_     DWORD                             dwDesiredAccess,
            #   _In_     DWORD                             dwShareMode,
            #   _In_     DWORD                             dwCreationDisposition,
            #   _In_opt_ LPCREATEFILE2_EXTENDED_PARAMETERS pCreateExParams)
            attach_function 'CreateFile2',
                            [:string, GenericFlag, FileShareFlag, :dword, CREATEFILE2_EXTENDED_PARAMETERS], :handle
          end
        end
      end
    end
  end
end
