module WinFFI
  module Kernel32
    WOW64_SIZE_OF_80387_REGISTERS = 80
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-wow64_floating_save_area
    class WOW64_FLOATING_SAVE_AREA < FFIAdditions::Struct
      attr_accessor :ControlWord,
                    :StatusWord,
                    :TagWord,
                    :ErrorOffset,
                    :ErrorSelector,
                    :DataOffset,
                    :DataSelector,
                    :RegisterArea,
                    :Cr0NpxState

      layout ControlWord:   :dword,
             StatusWord:    :dword,
             TagWord:       :dword,
             ErrorOffset:   :dword,
             ErrorSelector: :dword,
             DataOffset:    :dword,
             DataSelector:  :dword,
             RegisterArea:  [:byte, WOW64_SIZE_OF_80387_REGISTERS],
             Cr0NpxState:   :dword
    end
  end
end