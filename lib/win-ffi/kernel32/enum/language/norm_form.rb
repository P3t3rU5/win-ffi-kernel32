module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # Normalization forms
      # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/ne-winnls-_norm_form
      NORM_FORM = enum :norm_form, [:Other, 0, :C, 0x1, :D, 0x2, :KC, 0x5, :KD, 0x6]

      define_prefix(:Normalization, NORM_FORM, true)
    end
  end
end