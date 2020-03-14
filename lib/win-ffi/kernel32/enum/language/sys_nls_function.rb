module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/ne-winnls-sysnls_function
    SYSNLS_FUNCTION = enum :sysnls_function, [:COMPARE_STRING, 0x0001]
  end
end