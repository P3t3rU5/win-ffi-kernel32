module WinFFI
  module Kernel32
    class RTL_BARRIER < FFIAdditions::Struct
      attr_accessor :Reserved1, :Reserved2, :Reserved3, :Reserved4, :Reserved5

      layout Reserved1: :dword,
             Reserved2: :dword,
             Reserved3: [:ulong_ptr, 2],
             Reserved4: :dword,
             Reserved5: :dword
    end
  end
end