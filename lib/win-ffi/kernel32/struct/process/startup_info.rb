require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686331(v=vs.85).aspx
      class STARTUPINFO < FFIAdditions::Struct
        layout cb:              :dword,
               lpReserved:     :string,
               lpDesktop:      :string,
               lpTitle:        :string,
               dwX:             :dword,
               dwY:             :dword,
               dwXSize:         :dword,
               dwYSize:         :dword,
               dwXCountChars:   :dword,
               dwYCountChars:   :dword,
               dwFillAttribute: :dword,
               dwFlags:         :dword,
               wShowWindow:      :word,
               cbReserved2:      :word,
               lpReserved2:   :pointer,
               hStdInput:      :handle,
               hStdOutput:     :handle,
               hStdError:      :handle

        def initialize
          super
          self.cb = self.size
        end
      end
    end
  end
end