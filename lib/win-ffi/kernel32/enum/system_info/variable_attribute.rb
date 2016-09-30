require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj204594%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    VariableAttribute = enum :variable_attribute, [
        :NON_VOLATILE,                          0x00000001,
        :BOOTSERVICE_ACCESS,                    0x00000002,
        :RUNTIME_ACCESS,                        0x00000004,
        :HARDWARE_ERROR_RECORD,                 0x00000008,
        :AUTHENTICATED_WRITE_ACCESS,            0x00000010,
        :TIME_BASED_AUTHENTICATED_WRITE_ACCESS, 0x00000020,
        :APPEND_WRITE,                          0x00000040,
    ]

    define_prefix(:VARIABLE_ATTRIBUTE, VariableAttribute)
  end
end