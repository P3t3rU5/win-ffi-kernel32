require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      MemoryResourceNotificationType = enum :memory_resource_notification_type, [
          :LowMemory,
          :HighMemory
      ]
    end
  end
end