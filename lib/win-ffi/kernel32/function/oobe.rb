require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dn529160(v=vs.85).aspx
    # BOOL WINAPI OOBEComplete(_Out_ PBOOL OOBEComplete)
    attach_function 'OOBEComplete', [:pointer], :bool
  end
end