module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../struct/exception_handling/exception_pointers'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681419
      # LONG CALLBACK VectoredHandler(_In_ PEXCEPTION_POINTERS ExceptionInfo)
      VectoredHandler = callback 'VectoredHandler', [EXCEPTION_POINTERS.ptr(:in)], :long


      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679274
      # @param [Integer] firstHandler
      # @param [VectoredHandler] vectoredHandler
      # @return [FFI::Pointer]
      def self.AddVectoredExceptionHandler(firstHandler, vectoredHandler) end
      attach_function 'AddVectoredExceptionHandler', [:ulong, VectoredHandler], :pointer

      if WINDOWS_VERSION >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679273
        # @param [Integer] firstHandler
        # @param [VectoredHandler] vectoredHandler
        # @return [FFI::Pointer]
        def self.AddVectoredContinueHandler(firstHandler, vectoredHandler) end
        attach_function 'AddVectoredContinueHandler', [:ulong, VectoredHandler], :pointer
      end
    end
  end
end