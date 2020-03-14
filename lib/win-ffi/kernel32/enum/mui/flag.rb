module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # MUI function flag values
      MuiFlag = enum :mui_flag, [
          :LANGUAGE_ID,                      0x4,
          :LANGUAGE_NAME,                    0x8,
          :MERGE_SYSTEM_FALLBACK,           0x10,
          :LANGUAGE_EXACT,                  0x10,
          :MERGE_USER_FALLBACK,             0x20,
          :UI_FALLBACK,                     0x30,
          :THREAD_LANGUAGES,                0x40,
          :CONSOLE_FILTER,                 0x100,
          :COMPLEX_SCRIPT_FILTER,          0x200,
          :RESET_FILTERS,                  0x001,
          :USER_PREFERRED_UI_LANGUAGES,     0x10,
          :USE_INSTALLED_LANGUAGES,         0x20,
          :USE_SEARCH_ALL_LANGUAGES,        0x40,
          :LANG_NEUTRAL_PE_FILE,           0x100,
          :NON_LANG_NEUTRAL_FILE,          0x200,
          :MACHINE_LANGUAGE_SETTINGS,      0x400,
          :FILETYPE_NOT_LANGUAGE_NEUTRAL,  0x001,
          :FILETYPE_LANGUAGE_NEUTRAL_MAIN, 0x002,
          :FILETYPE_LANGUAGE_NEUTRAL_MUI,  0x004,
          :QUERY_TYPE,                     0x001,
          :QUERY_CHECKSUM,                 0x002,
          :QUERY_LANGUAGE_NAME,            0x004,
          :QUERY_RESOURCE_TYPES,           0x008,
          :FILEINFO_VERSION,               0x001,

          :FULL_LANGUAGE,                   0x01,
          :PARTIAL_LANGUAGE,                0x02,
          :LIP_LANGUAGE,                    0x04,
          :LANGUAGE_INSTALLED,              0x20,
          :LANGUAGE_LICENSED,               0x40,

      # :CALLBACK_ALL_FLAGS  MUI_CALLBACK_FLAG_UPGRADED_INSTALLATION
      ]

      define_prefix(:MUI, MuiFlag)
    end
  end
end