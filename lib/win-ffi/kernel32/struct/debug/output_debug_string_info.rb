require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680545(v=vs.85).aspx
      class OUTPUT_DEBUG_STRING_INFO < FFIAdditions::Struct
        layout lpDebugStringData: :string,
               fUnicode:            :word,
               nDebugStringLength:  :word
      end
    end
  end
end
