require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp

    require 'win-ffi/core/struct/security_attributes'
    require 'win-ffi/kernel32/enum/directory/file_notify_change_flag'
    require 'win-ffi/kernel32/struct/synchronization/overlapped'
    require 'win-ffi/kernel32/function/file_management'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363855(v=vs.85).aspx
      # BOOL WINAPI CreateDirectory(
      #   _In_     LPCTSTR               lpPathName,
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpSecurityAttributes)
      encoded_function 'CreateDirectory', [:string, SECURITY_ATTRIBUTES.ptr(:in)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363856%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
      # BOOL WINAPI CreateDirectoryEx(
      #   _In_     LPCTSTR               lpTemplateDirectory,
      #   _In_     LPCTSTR               lpNewDirectory,
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpSecurityAttributes)
      encoded_function 'CreateDirectoryEx', [:string, :string, SECURITY_ATTRIBUTES.ptr(:in)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364414(v=vs.85).aspx
      # BOOL WINAPI FindCloseChangeNotification(_In_ HANDLE hChangeHandle)
      attach_function 'FindCloseChangeNotification', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364417(v=vs.85).aspx
      # HANDLE WINAPI FindFirstChangeNotification(
      #   _In_ LPCTSTR lpPathName,
      #   _In_ BOOL    bWatchSubtree,
      #   _In_ DWORD   dwNotifyFilter)
      encoded_function 'FindFirstChangeNotification', [:string, :bool, FileNotificationChangeFlag], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364427(v=vs.85).aspx
      # BOOL WINAPI FindNextChangeNotification(_In_ HANDLE hChangeHandle)
      attach_function 'FindNextChangeNotification', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364934%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
      # DWORD WINAPI GetCurrentDirectory(_In_  DWORD  nBufferLength, _Out_ LPTSTR lpBuffer)
      encoded_function 'GetCurrentDirectory', [:dword, :string], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365465(v=vs.85).aspx
      # BOOL WINAPI ReadDirectoryChangesW(
      #   _In_        HANDLE                          hDirectory,
      #   _Out_       LPVOID                          lpBuffer,
      #   _In_        DWORD                           nBufferLength,
      #   _In_        BOOL                            bWatchSubtree,
      #   _In_        DWORD                           dwNotifyFilter,
      #   _Out_opt_   LPDWORD                         lpBytesReturned,
      #   _Inout_opt_ LPOVERLAPPED                    lpOverlapped,
      #   _In_opt_    LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine)
      attach_function 'ReadDirectoryChangesW',
                      [:handle, :pointer, :dword, :bool, FileNotificationChangeFlag, :pointer, OVERLAPPED.ptr,
                       FileIOCompletionRoutine], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365488%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
      # BOOL WINAPI RemoveDirectory(_In_ LPCTSTR lpPathName)
      encoded_function 'RemoveDirectory', [:string], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365530(v=vs.85).aspx
      # BOOL WINAPI SetCurrentDirectory(_In_ LPCTSTR lpPathName)
      encoded_function 'SetCurrentDirectory', [:string], :bool

      if WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363857(v=vs.85).aspx
        # BOOL WINAPI CreateDirectoryTransacted(
        #   _In_opt_ LPCTSTR               lpTemplateDirectory,
        #   _In_     LPCTSTR               lpNewDirectory,
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpSecurityAttributes,
        #   _In_     HANDLE                hTransaction)
        encoded_function 'CreateDirectoryTransacted', [:string, :string, SECURITY_ATTRIBUTES.ptr(:in), :handle], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365490(v=vs.85).aspx
        # BOOL WINAPI RemoveDirectoryTransacted(_In_ LPCTSTR lpPathName, _In_ HANDLE  hTransaction)
        encoded_function 'RemoveDirectoryTransacted', [:string, :handle], :bool

      end
    end
  end
end