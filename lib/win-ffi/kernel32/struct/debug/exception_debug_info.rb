require 'win-ffi/kernel32/struct/exception_handling/exception_record'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      class EXCEPTION_DEBUG_INFO < FFIAdditions::Struct
        layout ExceptionRecord: EXCEPTION_RECORD,
               dwFirstChance:             :dword
      end
    end
  end
end