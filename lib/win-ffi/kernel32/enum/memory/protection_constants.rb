module WinFFI
  module Kernel32
    MemoryProtectionConstants = enum :memory_protection_constants,
    [
      :NOACCESS,          0x01,
      :READONLY,          0x02,
      :READWRITE,         0x04,
      :WRITECOPY,         0x08,
      :EXECUTE,           0x10,
      :EXECUTE_READ,      0x20,
      :EXECUTE_READWRITE, 0x40,
      :EXECUTE_WRITECOPY, 0x80,
      :GUARD,             0x100,
      :NOCACHE,           0x200,
      :WRITECOMBINE,      0x400
    ]
  end
end