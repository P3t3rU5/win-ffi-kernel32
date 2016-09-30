require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa383718(v=vs.85).aspx
    # int MulDiv(_In_ int nNumber, _In_ int nNumerator, _In_ int nDenominator)
    attach_function 'MulDiv', [:int, :int, :int], :int
  end
end