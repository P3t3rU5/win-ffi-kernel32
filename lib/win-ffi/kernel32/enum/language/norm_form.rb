require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :vista
    # Normalization forms
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd319094(v=vs.85).aspx
    module Kernel32
      NORM_FORM = enum :norm_form, [
          :Other,   0,
          :C,     0x1,
          :D,     0x2,
          :KC,    0x5,
          :KD,    0x6
      ]

      define_prefix(:Normalization, NORM_FORM, true)
    end
  end
end