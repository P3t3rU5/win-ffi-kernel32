require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    LocalFlag = enum :local_flag,
    [
      :FIXED,          0x0000,
      :MOVEABLE,       0x0002,
      :NOCOMPACT,      0x0010,
      :NODISCARD,      0x0020,
      :ZEROINIT,       0x0040,
      :MODIFY,         0x0080,
      :DISCARDABLE,    0x0F00,
      :VALID_FLAGS,    0x0F72,
      :INVALID_HANDLE, 0x8000,

      :LHND, (0x0002 | 0x0040),
      :LPTR, (0x0000 | 0x0040),

      :NONZEROLHND,   (0x0002),
      :NONZEROLPTR,   (0x0000),

      # Flags returned by LocalFlags (in addition to LMEM_DISCARDABLE)
      :DISCARDED,      0x4000,
      :LOCKCOUNT,      0x00FF
    ]
  end
end