module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-create_thread_debug_info
      class CREATE_THREAD_DEBUG_INFO < FFIAdditions::Struct
        attr_accessor :hThread, :lpThreadLocalBase, :lpStartAddress

        layout hThread:           :handle,
               lpThreadLocalBase: :pointer,
               lpStartAddress:    :pointer  # LPTHREAD_START_ROUTINE
      end
    end
  end
end