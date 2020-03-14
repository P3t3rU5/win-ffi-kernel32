module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/tlhelp32/ns-tlhelp32-heapentry32
      class HEAPENTRY32 < FFIAdditions::Struct
        attr_accessor :dwSize,
                      :hHandle,
                      :dwAddress,
                      :dwBlockSize,
                      :dwFlags,
                      :dwLockCount,
                      :dwResvd,
                      :th32ProcessID,
                      :th32HeapID

        layout dwSize:        :size_t,
               hHandle:       :handle,
               dwAddress:     :ulong_ptr,
               dwBlockSize:   :size_t,
               dwFlags:       :dword,
               dwLockCount:   :dword,
               dwResvd:       :dword,
               th32ProcessID: :dword,
               th32HeapID:    :ulong_ptr

        def initialize
          super
          self.dwSize = self.size
        end

        private :dwSize, :dwSize=
      end
    end
  end
end