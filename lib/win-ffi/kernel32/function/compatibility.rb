require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    if WINDOWS_VERSION >= :xp
      # https://msdn.microsoft.com/en-us/library/bb432197(v=vs.85).aspx
      # BOOL WINAPI BaseFlushAppcompatCache(void)
      attach_function 'BaseFlushAppcompatCache', [], :bool
    end
  end
end