module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # More GEOCLASS defines will be listed here
      # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/ne-winnls-sysgeoclass
      SYSGEOCLASS = enum :sys_geoc_lass, [:NATION, 16, :REGION, 14, :ALL, 0]

      define_prefix(:GEOCLASS, SYSGEOCLASS)
    end
  end
end