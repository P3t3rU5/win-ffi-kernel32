require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class RTL_BARRIER < FFIAdditions::Struct
      layout Reserved1: :dword,
             Reserved2: :dword,
             Reserved3: [:ulong_ptr, 2],
             Reserved4: :dword,
             Reserved5: :dword
    end
  end
end