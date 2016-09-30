require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    if WindowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681419(v=vs.85).aspx
      # LONG CALLBACK VectoredHandler(_In_ PEXCEPTION_POINTERS ExceptionInfo)
      VectoredHandler = callback 'VectoredHandler', [], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679274(v=vs.85).aspx
      # PVOID WINAPI AddVectoredExceptionHandler(
      #   _In_ ULONG                       FirstHandler,
      #   _In_ PVECTORED_EXCEPTION_HANDLER VectoredHandler)
      attach_function 'AddVectoredExceptionHandler', [:ulong, VectoredHandler], :pointer

      if WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679273(v=vs.85).aspx
        # PVOID WINAPI AddVectoredContinueHandler(
        #   _In_ ULONG                       FirstHandler,
        #   _In_ PVECTORED_EXCEPTION_HANDLER VectoredHandler)
        attach_function 'AddVectoredContinueHandler', [:ulong, VectoredHandler], :pointer
      end
    end
  end
end