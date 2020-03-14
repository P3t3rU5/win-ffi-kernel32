require_relative 'exception_record'
require_relative '../debug/context'

module WinFFI
  module Kernel32
    # Typedef for pointer returned by exception_info()
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-exception_pointers
    class EXCEPTION_POINTERS < FFIAdditions::Struct
      attr_accessor :ExceptionRecord, :ContextRecord

      layout ExceptionRecord: EXCEPTION_RECORD,
             ContextRecord:   CONTEXT
    end
  end
end