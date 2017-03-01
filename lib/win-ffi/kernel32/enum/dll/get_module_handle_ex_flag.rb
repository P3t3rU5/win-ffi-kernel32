require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      GetModuleHandleExFlag = enum :get_module_handle_ex_flag, [
          :NONE,               (0x00000000),
          :PIN,                (0x00000001),
          :UNCHANGED_REFCOUNT, (0x00000002),
          :FROM_ADDRESS,       (0x00000004)
      ]
    end
  end
end