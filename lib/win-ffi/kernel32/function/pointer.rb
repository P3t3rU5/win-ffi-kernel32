require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    if WindowsVersion >= :vista || WindowsVersion == :xp && WindowsVersion.sp == 2
      # https://msdn.microsoft.com/en-us/library/bb432242(v=vs.85).aspx
      # PVOID DecodePointer(PVOID Ptr)
      attach_function 'DecodePointer', [:pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/bb432243(v=vs.85).aspx
      # PVOID DecodeSystemPointer(PVOID Ptr)
      attach_function 'DecodeSystemPointer', [:pointer], :pointer


      # https://msdn.microsoft.com/en-us/library/bb432254(v=vs.85).aspx
      # PVOID EncodePointer(_In_ PVOID Ptr)
      attach_function 'EncodePointer', [:pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/bb432255%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
      # PVOID EncodeSystemPointer(PVOID Ptr)
      attach_function 'EncodeSystemPointer', [:pointer], :pointer

      if WindowsVersion >= 10
        # https://msdn.microsoft.com/en-us/library/dn877133(v=vs.85).aspx
        # HRESULT WINAPI DecodeRemotePointer(
        #   _In_ HANDLE    ProcessHandle,
        #   _In_opt_ PVOID Ptr,
        #   _Out_ PVOID *  DecodedPtr)

        # https://msdn.microsoft.com/en-us/library/dn877135(v=vs.85).aspx
        # HRESULT WINAPI EncodeRemotePointer(
        #   _In_ HANDLE    ProcessHandle,
        #   _In_opt_ PVOID Ptr,
        #   _Out_ PVOID *  EncodedPtr)
      end
    end
  end
end