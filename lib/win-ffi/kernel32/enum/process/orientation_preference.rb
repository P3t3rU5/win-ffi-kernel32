require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= 7
    module Kernel32
      # Orientation preference structure. This is used by applications to specify their orientation preferences to windows.
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dn629267(v=vs.85).aspx
      OrientationPreference = enum :orientation_preference, [
          :NONE,              0x0,
          :LANDSCAPE,         0x1,
          :PORTRAIT,          0x2,
          :LANDSCAPE_FLIPPED, 0x4,
          :PORTRAIT_FLIPPED,  0x8
      ]
    end
  end
end