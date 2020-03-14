require_relative 'm128a'

module WinFFI
  module Kernel32
    class XSAVE_FORMAT < FFIAdditions::Struct
      attr_accessor :ControlWord,
                    :StatusWord,
                    :TagWord,
                    :Reserved1,
                    :ErrorOpcode,
                    :ErrorOffset,
                    :ErrorSelector,
                    :Reserved2,
                    :DataOffset,
                    :DataSelector,
                    :Reserved3,
                    :MxCsr,
                    :MxCsr_Mask,
                    :FloatRegisters,
                    :XmmRegisters,
                    :Reserved4

      layout ControlWord:    :word,
             StatusWord:     :word,
             TagWord:        :byte,
             Reserved1:      :byte,
             ErrorOpcode:    :word,
             ErrorOffset:    :dword,
             ErrorSelector:  :word,
             Reserved2:      :word,
             DataOffset:     :dword,
             DataSelector:   :word,
             Reserved3:      :word,
             MxCsr:          :dword,
             MxCsr_Mask:     :dword,
             FloatRegisters: [M128A, 8],
             XmmRegisters:   [M128A, (ARCHITECTURE == 'x64-mingw32' ? 16 : 8)],
             Reserved4:      [:byte, (ARCHITECTURE == 'x64-mingw32' ? 96 : 224)]
    end
  end
end