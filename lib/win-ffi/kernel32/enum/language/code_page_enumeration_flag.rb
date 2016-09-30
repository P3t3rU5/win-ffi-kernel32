require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Code Page Enumeration Flags.
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317825(v=vs.85).aspx
    CodePageEnumerationFlag = enum :code_page_enumeration_flag, [
        :INSTALLED, 0x00000001,
        :SUPPORTED, 0x00000002,
    ]
  end
end