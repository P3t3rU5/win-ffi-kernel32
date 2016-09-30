require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679334(v=vs.85).aspx
      class EXIT_PROCESS_DEBUG_INFO < FFIAdditions::Struct
        layout dwExitCode: :dword
      end
    end
  end
end
