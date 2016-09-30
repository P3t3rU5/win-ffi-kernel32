require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    FileCompletion = enum :file_completion, [
        :FILE_SKIP_COMPLETION_PORT_ON_SUCCESS, 0x1,
        :FILE_SKIP_SET_EVENT_ON_HANDLE,        0x2,
    ]
  end
end