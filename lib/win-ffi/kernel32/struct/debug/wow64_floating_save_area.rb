require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    WOW64_SIZE_OF_80387_REGISTERS = 80
    class WOW64_FLOATING_SAVE_AREA < FFIAdditions::Struct
      layout ControlWord:   :dword,
             StatusWord:    :dword,
             TagWord:       :dword,
             ErrorOffset:   :dword,
             ErrorSelector: :dword,
             DataOffset:    :dword,
             DataSelector:  :dword,
             RegisterArea: [:byte, WOW64_SIZE_OF_80387_REGISTERS],
             Cr0NpxState:   :dword
    end
  end
end