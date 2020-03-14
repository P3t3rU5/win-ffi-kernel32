module WinFFI
  module Kernel32
    StandardHandle = enum :standard_handle, [:INPUT_HANDLE,  -10, :OUTPUT_HANDLE, -11, :ERROR_HANDLE,  -12]
  end
end