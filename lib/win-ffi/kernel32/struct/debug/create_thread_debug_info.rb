require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679287(v=vs.85).aspx
      class CREATE_THREAD_DEBUG_INFO < FFIAdditions::Struct
        layout hThread:            :handle,
               lpThreadLocalBase: :pointer,
               lpStartAddress:    :pointer  # LPTHREAD_START_ROUTINE
      end
    end
  end
end