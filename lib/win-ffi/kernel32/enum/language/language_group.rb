module WinFFI
  module Kernel32
    # Language Group ID Values (Deprecated)
    # typedef DWORD LGRPID;
    LanguageGroup = enum :language_group, [
        :WESTERN_EUROPE,      0x0001,
        :CENTRAL_EUROPE,      0x0002,
        :BALTIC,              0x0003,
        :GREEK,               0x0004,
        :CYRILLIC,            0x0005,
        :TURKIC,              0x0006,
        :TURKISH,             0x0006,
        :JAPANESE,            0x0007,
        :KOREAN,              0x0008,
        :TRADITIONAL_CHINESE, 0x0009,
        :SIMPLIFIED_CHINESE,  0x000a,
        :THAI,                0x000b,
        :HEBREW,              0x000c,
        :ARABIC,              0x000d,
        :VIETNAMESE,          0x000e,
        :INDIC,               0x000f,
        :GEORGIAN,            0x0010,
        :ARMENIAN,            0x0011,
    ]

    define_prefix(:LGRPID, LanguageGroup)
  end
end