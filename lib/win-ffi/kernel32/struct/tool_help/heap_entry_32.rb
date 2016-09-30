require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class HEAPENTRY32 < FFIAdditions::Struct
      layout dwSize:        :size_t,
             hHandle:       :handle,
             dwAddress:  :ulong_ptr,
             dwBlockSize:   :size_t,
             dwFlags:        :dword,
             dwLockCount:    :dword,
             dwResvd:        :dword,
             th32ProcessID:  :dword,
             th32HeapID: :ulong_ptr,
    end
  end
end