module WinFFI
  module Kernel32
    # Standard Access Rights
    # The following are masks for the predefined standard access types
    DELETE                   = 0x00010000
    READ_CONTROL             = 0x00020000
    WRITE_DAC                = 0x00040000
    WRITE_OWNER              = 0x00080000

    STILL_ACTIVE = 259

    STACK_SIZE_PARAM_IS_A_RESERVATION = 0x00010000

    ANYSIZE_ARRAY = 1

    MAXLONG = 0x7fffffff

    MAX_COMPUTERNAME_LENGTH = 15

    MAX_MODULE_NAME32      = 255
  end
end