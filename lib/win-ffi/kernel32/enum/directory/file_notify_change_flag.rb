require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      FileNotificationChangeFlag = enum :file_notify_change_flag, [
          :FILE_NAME,   0x00000001,
          :DIR_NAME,    0x00000002,
          :ATTRIBUTES,  0x00000004,
          :SIZE,        0x00000008,
          :LAST_WRITE,  0x00000010,
          :LAST_ACCESS, 0x00000020,
          :CREATION,    0x00000040,
          :SECURITY,    0x00000100,
      ]

      define_prefix(:FILE_NOTIFY_CHANGE, FileNotificationChangeFlag)
    end
  end
end
