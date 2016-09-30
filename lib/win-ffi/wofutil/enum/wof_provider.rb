require 'win-ffi/wofutil'

module WinFFI
  module Wofutil
    # List of providers supported by WOF
    WofProvider = enum :wof_provider, [
        :WIM,  (0x00000001),
        :FILE, (0x00000002),
    ]

    define_prefix(:WOF_PROVIDER, WofProvider)
  end
end