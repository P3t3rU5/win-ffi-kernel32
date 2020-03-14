module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-output_debug_string_info
      class OUTPUT_DEBUG_STRING_INFO < FFIAdditions::Struct
        attr_accessor :lpDebugStringData, :fUnicode, :nDebugStringLength

        layout lpDebugStringData:  :string,
               fUnicode:           :word,
               nDebugStringLength: :word
      end
    end
  end
end
