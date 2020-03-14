module WinFFI
  module Kernel32

    EXCEPTION_MAXIMUM_PARAMETERS ||= 15

    class EXCEPTION_RECORD < FFIAdditions::Struct; end

    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-exception_record
    class EXCEPTION_RECORD
      attr_accessor :ExceptionCode,
                    :ExceptionFlags,
                    :ExceptionRecord,
                    :ExceptionAddress,
                    :NumberParameters,
                    :ExceptionInformation

      layout ExceptionCode:        :dword,
             ExceptionFlags:       :dword,
             ExceptionRecord:      EXCEPTION_RECORD.ptr,
             ExceptionAddress:     :pointer,
             NumberParameters:     :dword,
             ExceptionInformation: [:ulong_ptr, EXCEPTION_MAXIMUM_PARAMETERS]
    end
  end
end