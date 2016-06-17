require 'win-ffi/kernel32'

module WinFFI
  module Kernel32

    EXCEPTION_MAXIMUM_PARAMETERS = 15
    class EXCEPTION_RECORD < FFIStruct; end

    class EXCEPTION_RECORD
      layout :ExceptionCode,        :dword,
             :ExceptionFlags,       :dword,
             :ExceptionRecord,      EXCEPTION_RECORD.ptr,
             :ExceptionAddress,     :pointer,
             :NumberParameters,     :dword,
             :ExceptionInformation, [:ulong_ptr, EXCEPTION_MAXIMUM_PARAMETERS]
    end
  end
end