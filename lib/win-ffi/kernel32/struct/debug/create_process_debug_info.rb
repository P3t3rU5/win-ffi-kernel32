require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679286?f=255&MSPPError=-2147217396
      class CREATE_PROCESS_DEBUG_INFO < FFIAdditions::Struct
        layout hFile:                :handle,
               hProcess:             :handle,
               hThread:              :handle,
               lpBaseOfImage:       :pointer,
               dwDebugInfoFileOffset: :dword,
               nDebugInfoSize:        :dword,
               lpThreadLocalBase:   :pointer,
               lpStartAddress:      :pointer, # LPTHREAD_START_ROUTINE
               lpImageName:         :pointer,
               fUnicode:               :word
      end
    end
  end
end