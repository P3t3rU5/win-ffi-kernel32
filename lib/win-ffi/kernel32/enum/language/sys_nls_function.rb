require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374072(v=vs.85).aspx
    SYSNLS_FUNCTION = enum :sysnls_function, [:COMPARE_STRING, 0x0001]
  end
end