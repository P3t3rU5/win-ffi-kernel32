module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/ns-processthreadsapi-startupinfoa
      # https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/ns-processthreadsapi-startupinfow
      class STARTUPINFO < FFIAdditions::Struct
        attr_accessor :cb,
                      :lpReserved,
                      :lpDesktop,
                      :lpTitle,
                      :dwX,
                      :dwY,
                      :dwXSize,
                      :dwYSize,
                      :dwXCountChars,
                      :dwYCountChars,
                      :dwFillAttribute,
                      :dwFlags,
                      :wShowWindow,
                      :cbReserved2,
                      :lpReserved2,
                      :hStdInput,
                      :hStdOutput,
                      :hStdError

        layout cb:              :dword,
               lpReserved:      :string,
               lpDesktop:       :string,
               lpTitle:         :string,
               dwX:             :dword,
               dwY:             :dword,
               dwXSize:         :dword,
               dwYSize:         :dword,
               dwXCountChars:   :dword,
               dwYCountChars:   :dword,
               dwFillAttribute: :dword,
               dwFlags:         :dword,
               wShowWindow:     :word,
               cbReserved2:     :word,
               lpReserved2:     :pointer,
               hStdInput:       :handle,
               hStdOutput:      :handle,
               hStdError:       :handle

        def initialize
          super
          self.cb = self.size
        end
      end
    end
  end
end