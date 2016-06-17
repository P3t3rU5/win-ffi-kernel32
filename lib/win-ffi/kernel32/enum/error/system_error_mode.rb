require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    SystemErrorMessage = enum :system_error_message, [
        :FAILCRITICALERRORS,     0x0001,
        :NOGPFAULTERRORBOX,      0x0002,
        :NOALIGNMENTFAULTEXCEPT, 0x0004,
        :NOOPENFILEERRORBOX,     0x8000
    ]
  end
end
