require_relative '../exception_handling/exception_record'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-exception_debug_info
      class EXCEPTION_DEBUG_INFO < FFIAdditions::Struct
        attr_accessor :ExceptionRecord, :dwFirstChance

        layout ExceptionRecord: EXCEPTION_RECORD,
               dwFirstChance:   :dword
      end
    end
  end
end