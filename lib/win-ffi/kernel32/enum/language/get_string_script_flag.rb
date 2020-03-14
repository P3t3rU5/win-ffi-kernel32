module WinFFI
  module Kernel32
    GetStringScriptFlag = enum :get_string_script_flag, [:ALLOW_INHERITED_COMMON, 0x0001]

    define_prefix(:GSS, GetStringScriptFlag)
  end
end