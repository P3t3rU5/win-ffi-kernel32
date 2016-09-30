require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    PowerRequestType = enum :power_request_type, [
        :DisplayRequired,
        :SystemRequired,
        :AwayModeRequired,
        :ExecutionRequired
    ]

    define_prefix(:PowerRequest, PowerRequestType, true)
  end
end