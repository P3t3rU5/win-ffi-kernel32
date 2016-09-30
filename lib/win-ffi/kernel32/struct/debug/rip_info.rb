require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    require 'win-ffi/core/enum/error/set_last_error_ex_code'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680587(v=vs.85).aspx
      class RIP_INFO < FFIAdditions::Struct
        layout dwError:           :dword,
               dwType:SetLastErrorExCode
      end
    end
  end
end
