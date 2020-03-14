module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/tlhelp32/ns-tlhelp32-processentry32
      class PROCESSENTRY32 < FFIAdditions::Struct
        attr_accessor :dwSize,
                      :cntUsage,
                      :th32ProcessID,
                      :th32DefaultHeapID,
                      :th32ModuleID,
                      :cntThreads,
                      :th32ParentProcessID,
                      :pcPriClassBase,
                      :dwFlags,
                      :szExeFile

        layout dwSize:              :dword,
               cntUsage:            :dword,
               th32ProcessID:       :dword,
               th32DefaultHeapID:   :ulong_ptr,
               th32ModuleID:        :dword,
               cntThreads:          :dword,
               th32ParentProcessID: :dword,
               pcPriClassBase:      :long,
               dwFlags:             :dword,
               szExeFile:           [:tchar, MAX_PATH]

        def initialize
          super
          self.dwSize = self.size
        end

        private :dwSize, :dwSize=
      end
    end
  end
end