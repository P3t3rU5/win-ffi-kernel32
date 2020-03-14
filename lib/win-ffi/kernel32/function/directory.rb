module WinFFI
  if WINDOWS_VERSION >= :xp
    require 'win-ffi/core/struct/security_attributes'

    require_relative '../enum/directory/file_notify_change_flag'
    require_relative '../struct/synchronization/overlapped'
    require_relative '../function/file_management'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-createdirectorya
      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-createdirectoryw
      # @param [String] lpPathName
      # @param [FFI::Pointer] lpSecurityAttributes
      # @return [true, false]
      def self.CreateDirectory(lpPathName, lpSecurityAttributes) end
      encoded_function 'CreateDirectory', [:string, SECURITY_ATTRIBUTES.ptr(:in)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-CreateDirectoryEx
      # @param [String] lpTemplateDirectory
      # @param [String] lpNewDirectory
      # @param [FFI::Pointer] lpSecurityAttributes
      # @return [true, false]
      def self.CreateDirectoryEx(lpTemplateDirectory, lpNewDirectory, lpSecurityAttributes) end
      encoded_function 'CreateDirectoryEx', [:string, :string, SECURITY_ATTRIBUTES.ptr(:in)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-FindCloseChangeNotification
      # @param [Integer] hChangeHandle
      # @return [true, false]
      def self.FindCloseChangeNotification(hChangeHandle) end
      attach_function 'FindCloseChangeNotification', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-FindFirstChangeNotification
      # @param [String] lpPathName
      # @param [true, false] bWatchSubtree
      # @param [Integer] dwNotifyFilter
      # @return [Integer]
      def self.FindFirstChangeNotification(lpPathName, bWatchSubtree, dwNotifyFilter) end
      encoded_function 'FindFirstChangeNotification', [:string, :bool, FileNotificationChangeFlag], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-FindNextChangeNotification
      # @param [Integer] hChangeHandle
      # @return [true, false]
      def self.FindNextChangeNotification(hChangeHandle) end
      attach_function 'FindNextChangeNotification', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-GetCurrentDirectory
      # @param [Integer] nBufferLength
      # @param [String] lpBuffer
      def self.GetCurrentDirectory(nBufferLength, lpBuffer) end
      encoded_function 'GetCurrentDirectory', %i[dword string], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-ReadDirectoryChangesW
      # @param [Integer] hDirectory
      # @param [FFI::Pointer] lpBuffer
      # @param [Integer] nBufferLength
      # @param [true, false] bWatchSubtree
      # @param [Integer] dwNotifyFilter
      # @param [FFI::Pointer] lpBytesReturned
      # @param [FFI::Pointer] lpOverlapped
      # @param [Integer] lpCompletionRoutine
      # @return [true, false]
      def self.ReadDirectoryChangesW(hDirectory, lpBuffer, nBufferLength, bWatchSubtree, dwNotifyFilter,
          lpBytesReturned, lpOverlapped, lpCompletionRoutine); end
      attach_function 'ReadDirectoryChangesW',
                      [:handle, :pointer, :dword, :bool, FileNotificationChangeFlag, :pointer, OVERLAPPED.ptr,
                       FileIOCompletionRoutine], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-RemoveDirectory
      # @param [String] lpPathName
      # @return [true, false]
      def self.RemoveDirectory(lpPathName) end
      encoded_function 'RemoveDirectory', [:string], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-SetCurrentDirectory
      # @param [String] lpPathName
      # @return [true, false]
      def self.SetCurrentDirectory(lpPathName) end
      encoded_function 'SetCurrentDirectory', [:string], :bool

      if WINDOWS_VERSION >= :vista
        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createdirectorytransacteda
        # @param [String] lpTemplateDirectory
        # @param [String] lpNewDirectory
        # @param [FFI::Pointer] lpSecurityAttributes
        # @param [Integer] hTransaction
        # @return [true, false]
        def self.CreateDirectoryTransacted(lpTemplateDirectory, lpNewDirectory, lpSecurityAttributes, hTransaction) end
        encoded_function 'CreateDirectoryTransacted',
                         [:string, :string, SECURITY_ATTRIBUTES.ptr(:in), :handle], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-removedirectorytransacteda
        # @param [String] lpPathName
        # @param [Integer] hTransaction
        # @return [true, false]
        def self.RemoveDirectoryTransacted(lpPathName, hTransaction) end
        encoded_function 'RemoveDirectoryTransacted', [:string, :handle], :bool

      end
    end
  end
end