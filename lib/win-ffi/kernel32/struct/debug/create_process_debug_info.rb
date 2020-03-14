module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-create_process_debug_info
      class CREATE_PROCESS_DEBUG_INFO < FFIAdditions::Struct
        attr_accessor :hFile,
                      :hProcess,
                      :hThread,
                      :lpBaseOfImage,
                      :dwDebugInfoFileOffset,
                      :nDebugInfoSize,
                      :lpThreadLocalBase,
                      :lpStartAddress,
                      :lpImageName,
                      :fUnicode

        layout hFile:                 :handle,
               hProcess:              :handle,
               hThread:               :handle,
               lpBaseOfImage:         :pointer,
               dwDebugInfoFileOffset: :dword,
               nDebugInfoSize:        :dword,
               lpThreadLocalBase:     :pointer,
               lpStartAddress:        :pointer, # LPTHREAD_START_ROUTINE
               lpImageName:           :pointer,
               fUnicode:              :word
      end
    end
  end
end