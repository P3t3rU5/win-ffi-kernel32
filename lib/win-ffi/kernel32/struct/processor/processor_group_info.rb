require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405504(v=vs.85).aspx
    class PROCESSOR_GROUP_INFO < FFIStruct
      layout :MaximumProcessorCount, :byte,
             :ActiveProcessorCount,  :byte,
             :Reserved,              [:byte, 38],
             :ActiveProcessorMask,   :long # KAFFINITY
    end
  end
end