module WinFFI
  module Kernel32
    VerifyScriptsFlag = enum :verify_scripts_flag, [:ALLOW_LATIN , 0x0001]

    define_prefix(:VS, VerifyScriptsFlag)
  end
end
