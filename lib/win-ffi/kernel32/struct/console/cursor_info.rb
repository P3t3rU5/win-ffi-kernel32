module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/console/console-cursor-info-str
    class CONSOLE_CURSOR_INFO < FFIAdditions::Struct
      attr_accessor :dwSize, :bVisible

      layout dwSize:   :dword,
             bVisible: :bool
    end
  end
end