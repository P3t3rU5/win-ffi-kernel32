module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../../constant'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/tlhelp32/ns-tlhelp32-moduleentry32
      # https://docs.microsoft.com/en-us/windows/win32/api/tlhelp32/ns-tlhelp32-moduleentry32w
      class MODULEENTRY32 < FFIAdditions::Struct
        attr_accessor :dwSize,
                      :th32ModuleID,
                      :th32ProcessID,
                      :GlblcntUsage,
                      :ProccntUsage,
                      :modBaseAddr,
                      :modBaseSize,
                      :hModule,
                      :szModule,
                      :szExePath

        layout dwSize:        :dword,
               th32ModuleID:  :dword,
               th32ProcessID: :dword,
               GlblcntUsage:  :dword,
               ProccntUsage:  :dword,
               modBaseAddr:   :pointer,
               modBaseSize:   :dword,
               hModule:       :hmodule,
               szModule:      [:tchar, MAX_MODULE_NAME32 + 1],
               szExePath:     [:tchar, MAX_PATH]

        def initialize
          super
          self.dwSize = self.size
        end

        private :dwSize, :dwSize=
      end
    end
  end
end
