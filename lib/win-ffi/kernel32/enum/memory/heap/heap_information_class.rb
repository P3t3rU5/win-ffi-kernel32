require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      buffer = [
          :HeapCompatibilityInformation,      0,
          :HeapEnableTerminationOnCorruption, 1
      ]
      buffer += [:HeapOptimizeResources, 3] if WINDOWS_VERSION >= 8

      HeapInformationClass = enum :heap_information_class, buffer
    end
  end
end