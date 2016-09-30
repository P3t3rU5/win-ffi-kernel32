require 'win-ffi/kernel32/struct/exception_handling/exception_record'
require 'win-ffi/kernel32/struct/debug/context'
module WinFFI
  module Kernel32
    # Typedef for pointer returned by exception_info()
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679331(v=vs.85).aspx
    class EXCEPTION_POINTERS < FFIAdditions::Struct
      layout ExceptionRecord: EXCEPTION_RECORD,
             ContextRecord:            CONTEXT
    end
  end
end