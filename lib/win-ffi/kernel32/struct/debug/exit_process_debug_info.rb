module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-exit_process_debug_info
      class EXIT_PROCESS_DEBUG_INFO < FFIAdditions::Struct
        attr_accessor :dwExitCode

        layout dwExitCode: :dword
      end
    end
  end
end
