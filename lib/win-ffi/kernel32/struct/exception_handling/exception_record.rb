require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    EXCEPTION_MAXIMUM_PARAMETERS = 15

    class EXCEPTION_RECORD < FFIAdditions::Struct; end

    # Exception record definition.
    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363082(v=vs.85).aspx
    class EXCEPTION_RECORD < FFIAdditions::Struct
      layout ExceptionCode:                                       :dword,
             ExceptionFlags:                                      :dword,
             ExceptionRecord:                       EXCEPTION_RECORD.ptr,
             ExceptionAddress:                                  :pointer,
             NumberParameters:                                    :dword,
             ExceptionInformation: [:ulong, EXCEPTION_MAXIMUM_PARAMETERS]
    end
  end
end