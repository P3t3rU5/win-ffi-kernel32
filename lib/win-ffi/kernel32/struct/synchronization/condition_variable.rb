module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/sync/condition-variables
    class CONDITION_VARIABLE < FFIAdditions::Struct
      attr_accessor :Ptr

      layout Ptr: :pointer
    end
  end
end