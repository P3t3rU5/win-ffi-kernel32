require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      buffer = [
          :HeapCompatibilityInformation,      0,
          :HeapEnableTerminationOnCorruption, 1
      ]
      buffer += [:HeapOptimizeResources, 3] if WindowsVersion >= 8

      HeapInformationClass = enum :heap_information_class, buffer
    end
  end
end