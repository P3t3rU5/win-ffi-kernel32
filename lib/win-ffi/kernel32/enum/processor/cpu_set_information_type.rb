require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    CpuSetInformationType = enum :cpu_set_information_type, [
        :CpuSetInformation
    ]
  end
end