
module WinFFI
  if WINDOWS_VERSION >= :xp
    require 'win-ffi/core/enum/error/set_last_error_ex_code'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-rip_info
      class RIP_INFO < FFIAdditions::Struct
        attr_accessor :dwError, :dwType

        layout dwError: :dword,
               dwType:  SetLastErrorExCode
      end
    end
  end
end
