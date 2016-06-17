require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ProcessDEP = enum :process_dep, [
        :DISABLE,                     0x00000000,
        :ENABLE,                      0x00000001,
        :DISABLE_ATL_THUNK_EMULATION, 0x00000002
    ]
  end
end