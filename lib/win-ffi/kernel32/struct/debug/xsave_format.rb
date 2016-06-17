require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/debug/m128a'

module WinFFI
  module Kernel32
    class XSAVE_FORMAT < FFIStruct
      layout :ControlWord,    :word,
             :StatusWord,     :word,
             :TagWord,        :byte,
             :Reserved1,      :byte,
             :ErrorOpcode,    :word,
             :ErrorOffset,    :dword,
             :ErrorSelector,  :word,
             :Reserved2,      :word,
             :DataOffset,     :dword,
             :DataSelector,   :word,
             :Reserved3,      :word,
             :MxCsr,          :dword,
             :MxCsr_Mask,     :dword,
             :FloatRegisters, [M128A, 8],
             :XmmRegisters,   [M128A, (Architecture == 'x64-mingw32' ? 16 : 8)],
             :Reserved4,      [:byte, (Architecture == 'x64-mingw32' ? 96 : 224)]
    end
  end
end