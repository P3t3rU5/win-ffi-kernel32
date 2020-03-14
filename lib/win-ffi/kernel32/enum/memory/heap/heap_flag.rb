module WinFFI
  module Kernel32
    HeapFlag = enum :heap_flag, [
        :NO_SERIALIZE,             0x00000001,
        :GROWABLE,                 0x00000002,
        :GENERATE_EXCEPTIONS,      0x00000004,
        :ZERO_MEMORY,              0x00000008,
        :REALLOC_IN_PLACE_ONLY,    0x00000010,
        :TAIL_CHECKING_ENABLED,    0x00000020,
        :FREE_CHECKING_ENABLED,    0x00000040,
        :DISABLE_COALESCE_ON_FREE, 0x00000080,
        :CREATE_ALIGN_16,          0x00010000,
        :CREATE_ENABLE_TRACING,    0x00020000,
        :CREATE_ENABLE_EXECUTE,    0x00040000,
        :MAXIMUM_TAG,              0x0FFF,
        :PSEUDO_TAG_FLAG,          0x8000,
        :TAG_SHIFT,                18,
    ]
  end
end