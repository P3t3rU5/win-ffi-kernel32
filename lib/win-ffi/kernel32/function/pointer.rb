module WinFFI
  module Kernel32
    if WINDOWS_VERSION >= :vista || WINDOWS_VERSION == :xp && WINDOWS_VERSION.sp == 2
      # https://msdn.microsoft.com/en-us/library/bb432242
      # PVOID DecodePointer(PVOID Ptr)
      def self.DecodePointer(ptr) end
      attach_function 'DecodePointer', [:pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/bb432243
      # PVOID DecodeSystemPointer(PVOID Ptr)
      def self.DecodeSystemPointer(ptr) end
      attach_function 'DecodeSystemPointer', [:pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/bb432254
      # PVOID EncodePointer(_In_ PVOID Ptr)
      def self.EncodePointer(ptr) end
      attach_function 'EncodePointer', [:pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/bb432255
      # PVOID EncodeSystemPointer(PVOID Ptr)
      def self.EncodeSystemPointer(ptr) end
      attach_function 'EncodeSystemPointer', [:pointer], :pointer

      if WINDOWS_VERSION >= 10
        # https://msdn.microsoft.com/en-us/library/dn877133
        # HRESULT DecodeRemotePointer( _In_ HANDLE    ProcessHandle, _In_opt_ PVOID Ptr, _Out_ PVOID *  DecodedPtr)
        def self.DecodeRemotePointer(processHandle, ptr, decodedPtr) end
        attach_function 'DecodeRemotePointer', [:handle, :pointer, :pointer], :hresult

        # https://msdn.microsoft.com/en-us/library/dn877135(v=vs.85).aspx
        # HRESULT EncodeRemotePointer( _In_ HANDLE    ProcessHandle, _In_opt_ PVOID Ptr, _Out_ PVOID *  EncodedPtr)
        def self.EncodeRemotePointer(processHandle, ptr, encodedPtr) end
        attach_function 'EncodeRemotePointer', [:handle, :pointer, :pointer], :hresult
      end
    end
  end
end