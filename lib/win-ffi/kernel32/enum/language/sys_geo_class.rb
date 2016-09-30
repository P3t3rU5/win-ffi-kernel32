require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # More GEOCLASS defines will be listed here
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374070(v=vs.85).aspx
      SYSGEOCLASS = enum :sys_geoc_lass, [
          :NATION, 16,
          :REGION, 14,
          :ALL,     0
      ]

      define_prefix(:GEOCLASS, SYSGEOCLASS)
    end
  end
end