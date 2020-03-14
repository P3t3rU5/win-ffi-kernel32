module WinFFI
  if WINDOWS_VERSION >= 7
    module Kernel32
      LoadStringByReferenceFlag = enum :load_string_by_reference_flag, [
          :FORMAT_REG_COMPAT,  0x0001,
          :FORMAT_INF_COMPAT,  0x0002,
          :VERIFY_FILE_EXISTS, 0x0004,
          :SKIP_STRING_CACHE,  0x0008,
          :IMMUTABLE_LOOKUP,   0x0010,
      ]

      define_prefix(:MUI, LoadStringByReferenceFlag)
    end
  end
end
