require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Thread information classes.
    ThreadInformationClass = enum :thread_information_class, [
        :ThreadMemoryPriority,
        :ThreadAbsoluteCpuPriority,
        :ThreadInformationClassMax
    ]
  end
end