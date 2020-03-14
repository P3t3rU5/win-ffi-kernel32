module WinFFI
  module Kernel32
    # Language Group Enumeration Flags.
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317821(v=vs.85).aspx
    LanguageGroupEnumerationFlag = enum :language_group_enumeration_flag, [
        :INSTALLED, 0x00000001,
        :SUPPORTED, 0x00000002,
    ]

    define_prefix(:LGRPID, LanguageGroupEnumerationFlag)
  end
end