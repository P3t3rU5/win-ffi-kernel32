require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/time/system_time'
require 'win-ffi/kernel32/struct/language/cal_date_time'
require 'win-ffi/kernel32/struct/language/number_fmt'
require 'win-ffi/kernel32/struct/language/cp_info'
require 'win-ffi/kernel32/struct/language/cp_info_ex'
require 'win-ffi/kernel32/struct/language/currency_fmt'
require 'win-ffi/kernel32/struct/language/nls_version_info'
require 'win-ffi/kernel32/struct/language/nls_version_info_ex'

require 'win-ffi/kernel32/enum/language/cal_date_time_date_unit'
require 'win-ffi/kernel32/enum/language/language_group'
require 'win-ffi/kernel32/enum/language/language_group_enumeration_flag'
require 'win-ffi/kernel32/enum/language/compare_string_flag'
require 'win-ffi/kernel32/enum/language/calendar_id'
require 'win-ffi/kernel32/enum/language/calendar_type'
require 'win-ffi/kernel32/enum/language/date_format'
require 'win-ffi/kernel32/enum/language/code_page_enumeration_flag'
require 'win-ffi/kernel32/enum/language/map_flag'
require 'win-ffi/kernel32/enum/language/locale_enumeration_flag'
require 'win-ffi/kernel32/enum/language/code_page_value'
require 'win-ffi/kernel32/enum/language/time_flag'
require 'win-ffi/kernel32/enum/language/named_based_enumeration_flag'
require 'win-ffi/kernel32/enum/language/sys_geo_class'
require 'win-ffi/kernel32/enum/language/sys_geo_type'
require 'win-ffi/kernel32/enum/language/sys_nls_function'
require 'win-ffi/kernel32/enum/language/get_string_script_flag'
require 'win-ffi/kernel32/enum/language/international_domain_name_flag'
require 'win-ffi/kernel32/enum/language/norm_form'

module WinFFI
  module Kernel32

    typedef :long,  :geoid
    typedef :dword, :geotype
    typedef :dword, :geoclass
    typedef :dword, :lctype

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317806(v=vs.85).aspx
    # BOOL CALLBACK EnumCalendarInfoProc(_In_ LPTSTR lpCalendarInfoString)
    EnumCalendarInfoProc = callback 'EnumCalendarInfoProc', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317807(v=vs.85).aspx
    # BOOL CALLBACK EnumCalendarInfoProcEx(_In_ LPTSTR lpCalendarInfoString, _In_ CALID  Calendar)
    EnumCalendarInfoProcEx = callback 'EnumCalendarInfoProcEx', [:string, CalendarId], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317809(v=vs.85).aspx
    # BOOL CALLBACK EnumCodePagesProc(_In_ LPTSTR lpCodePageString)
    EnumCodePagesProc = callback 'EnumCodePagesProc', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317813(v=vs.85).aspx
    # BOOL CALLBACK EnumDateFormatsProc(_In_ LPTSTR lpDateFormatString)
    EnumDateFormatsProc = callback 'EnumDateFormatsProc', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317814(v=vs.85).aspx
    # BOOL CALLBACK EnumDateFormatsProcEx(_In_ LPTSTR lpDateFormatString, _In_ CALID  CalendarID)
    EnumDateFormatsProcEx = callback 'EnumDateFormatsProcEx', [:string, CalendarId], :bool

    # BOOL CALLBACK EnumLanguageGroupLocalesProc(
    #   _In_ LGRPID   LanguageGroup,
    #   _In_ LCID     Locale,
    #   _In_ LPTSTR   lpLocaleString,
    #   _In_ LONG_PTR lParam)
    EnumLanguageGroupLocalesProc = callback 'EnumLanguageGroupLocalesProc',
                                            [LanguageGroup, :lcid, :string, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317821(v=vs.85).aspx
    # BOOL CALLBACK EnumLanguageGroupsProc(
    #   _In_ LGRPID   LanguageGroup,
    #   _In_ LPTSTR   lpLanguageGroupString,
    #   _In_ LPTSTR   lpLanguageGroupNameString,
    #   _In_ DWORD    dwFlags,
    #   _In_ LONG_PTR lParam)
    EnumLanguageGroupsProc = callback 'EnumLanguageGroupsProc',
                                      [LanguageGroup, :string, :string, LanguageGroupEnumerationFlag, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317822(v=vs.85).aspx
    # BOOL CALLBACK EnumLocalesProc(_In_ LPTSTR lpLocaleString)
    EnumLocalesProc = callback 'EnumLocalesProc', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317832(v=vs.85).aspx
    # BOOL CALLBACK EnumTimeFormatsProc(_In_ LPTSTR lpTimeFormatString)
    EnumTimeFormatsProc = callback 'EnumTimeFormatsProc', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317759(v=vs.85).aspx
    # int CompareString(
    #   _In_ LCID    Locale,
    #   _In_ DWORD   dwCmpFlags,
    #   _In_ LPCTSTR lpString1,
    #   _In_ int     cchCount1,
    #   _In_ LPCTSTR lpString2,
    #   _In_ int     cchCount2)
    encoded_function 'CompareString', [:lcid, CompareStringFlag, :string, :int, :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317768(v=vs.85).aspx
    # LCID ConvertDefaultLocale(_In_ LCID Locale)
    attach_function 'ConvertDefaultLocale', [:lcid], :lcid

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317803(v=vs.85).aspx
    # BOOL EnumCalendarInfo(
    #   _In_ CALINFO_ENUMPROC pCalInfoEnumProc,
    #   _In_ LCID             Locale,
    #   _In_ CALID            Calendar,
    #   _In_ CALTYPE          CalType)
    encoded_function 'EnumCalendarInfo', [EnumCalendarInfoProc, :lcid, CalendarId, CalendarType], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317804(v=vs.85).aspx
    # BOOL EnumCalendarInfoEx(
    #   _In_ CALINFO_ENUMPROCEX pCalInfoEnumProcEx,
    #   _In_ LCID               Locale,
    #   _In_ CALID              Calendar,
    #   _In_ CALTYPE            CalType)
    encoded_function 'EnumCalendarInfoEx', [EnumCalendarInfoProcEx, :lcid, CalendarId, CalendarType], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317810(v=vs.85).aspx
    # BOOL EnumDateFormats(
    #   _In_ DATEFMT_ENUMPROC lpDateFmtEnumProc,
    #   _In_ LCID             Locale,
    #   _In_ DWORD            dwFlags)
    encoded_function 'EnumDateFormats', [EnumDateFormatsProc, :lcid, :dword, DateFormat], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317811(v=vs.85).aspx
    # BOOL EnumDateFormatsEx(
    #   _In_ DATEFMT_ENUMPROCEX lpDateFmtEnumProcEx,
    #   _In_ LCID               Locale,
    #   _In_ DWORD              dwFlags)
    encoded_function 'EnumDateFormatsEx', [EnumDateFormatsProcEx, :lcid, DateFormat], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317819(v=vs.85).aspx
    # BOOL EnumLanguageGroupLocales(
    #   _In_ LANGGROUPLOCALE_ENUMPROC lpLangGroupLocaleEnumProc,
    #   _In_ LGRPID                   LanguageGroup,
    #   _In_ DWORD                    dwFlags,
    #   _In_ LONG_PTR                 lParam)
    encoded_function 'EnumLanguageGroupLocales', [EnumLanguageGroupLocalesProc, LanguageGroup, :dword, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317825(v=vs.85).aspx
    # BOOL EnumSystemCodePages(_In_ CODEPAGE_ENUMPROC lpCodePageEnumProc, _In_ DWORD dwFlags)
    encoded_function 'EnumSystemCodePages', [EnumCodePagesProc, CodePageEnumerationFlag], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317827(v=vs.85).aspx
    # BOOL EnumSystemLanguageGroups(
    #   _In_ LANGUAGEGROUP_ENUMPROC lpLanguageGroupEnumProc,
    #   _In_ DWORD                  dwFlags,
    #   _In_ LONG_PTR               lParam)
    encoded_function 'EnumSystemLanguageGroups', [EnumLanguageGroupsProc, LanguageGroupEnumerationFlag, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317828(v=vs.85).aspx
    # BOOL EnumSystemLocales(_In_ LOCALE_ENUMPROC lpLocaleEnumProc, _In_ DWORD dwFlags)
    encoded_function 'EnumSystemLocales', [EnumLocalesProc, LocaleEnumerationFlag], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317830(v=vs.85).aspx
    # BOOL EnumTimeFormats(
    #   _In_ TIMEFMT_ENUMPROC lpTimeFmtEnumProc,
    #   _In_ LCID             Locale,
    #   _In_ DWORD            dwFlags)
    encoded_function 'EnumTimeFormats', [EnumTimeFormatsProc, :lcid, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318063(v=vs.85).aspx
    # int FoldString(
    #   _In_      DWORD   dwMapFlags,
    #   _In_      LPCTSTR lpSrcStr,
    #   _In_      int     cchSrc,
    #   _Out_opt_ LPTSTR  lpDestStr,
    #   _In_      int     cchDest)
    encoded_function 'FoldString', [MapFlag, :string, :int, :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318070(v=vs.85).aspx
    # UINT GetACP(void)
    attach_function 'GetACP', [], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318072(v=vs.85).aspx
    # int GetCalendarInfo(
    #   _In_      LCID    Locale,
    #   _In_      CALID   Calendar,
    #   _In_      CALTYPE CalType,
    #   _Out_opt_ LPTSTR  lpCalData,
    #   _In_      int     cchData,
    #   _Out_opt_ LPDWORD lpValue)
    encoded_function 'GetCalendarInfo', [:lcid, CalendarId, CalendarType, :string, :int, :pointer], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318078(v=vs.85).aspx
    # BOOL GetCPInfo(_In_  UINT     CodePage, _Out_ LPCPINFO lpCPInfo)
    attach_function 'GetCPInfo', [:uint, CPINFO.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318081(v=vs.85).aspx
    # BOOL GetCPInfoEx(_In_ UINT CodePage, _In_ DWORD dwFlags, _Out_ LPCPINFOEX lpCPInfoEx)
    encoded_function 'GetCPInfoEx', [:uint, CodePageValue, CPINFOEX.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318083(v=vs.85).aspx
    # int GetCurrencyFormat(
    #   _In_            LCID        Locale,
    #   _In_            DWORD       dwFlags,
    #   _In_            LPCTSTR     lpValue,
    #   _In_opt_  const CURRENCYFMT *lpFormat,
    #   _Out_opt_       LPTSTR      lpCurrencyStr,
    #   _In_            int         cchCurrency)
    encoded_function 'GetCurrencyFormat', [:lcid, :dword, :string, CURRENCYFMT.ptr(:in), :string, :int], :int

    # int GetCurrencyFormatEx(
    #   _In_opt_        LPCWSTR     lpLocaleName,
    #   _In_            DWORD       dwFlags,
    #   _In_            LPCWSTR     lpValue,
    #   _In_opt_  const CURRENCYFMT *lpFormat,
    #   _Out_opt_       LPWSTR      lpCurrencyStr,
    #   _In_            int         cchCurrency)
    attach_function 'GetCurrencyFormatEx', [:string, :dword, :string, CURRENCYFMT.ptr(:in), :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318086(v=vs.85).aspx
    # int GetDateFormat(
    #   _In_            LCID       Locale,
    #   _In_            DWORD      dwFlags,
    #   _In_opt_  const SYSTEMTIME *lpDate,
    #   _In_opt_        LPCTSTR    lpFormat,
    #   _Out_opt_       LPTSTR     lpDateStr,
    #   _In_            int        cchDate)
    encoded_function 'GetDateFormat', [:lcid, :dword, SYSTEMTIME.ptr(:in), :string, :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318101(v=vs.85).aspx
    # int GetLocaleInfo(
    #   _In_      LCID   Locale,
    #   _In_      LCTYPE LCType,
    #   _Out_opt_ LPTSTR lpLCData,
    #   _In_      int    cchData)
    encoded_function 'GetLocaleInfo', [:lcid, :lctype, :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318110(v=vs.85).aspx
    # int GetNumberFormat(
    #   _In_            LCID      Locale,
    #   _In_            DWORD     dwFlags,
    #   _In_            LPCTSTR   lpValue,
    #   _In_opt_  const NUMBERFMT *lpFormat,
    #   _Out_opt_       LPTSTR    lpNumberStr,
    #   _In_            int       cchNumber)
    encoded_function 'GetNumberFormat', [:lcid, :dword, :string, NUMBERFMT.ptr(:in), :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318114(v=vs.85).aspx
    # UINT GetOEMCP(void)
    attach_function 'GetOEMCP', [], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318117(v=vs.85).aspx

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318117(v=vs.85).aspx
    # BOOL GetStringTypeA(
    #   _In_  LCID   Locale,
    #   _In_  DWORD  dwInfoType,
    #   _In_  LPCSTR lpSrcStr,
    #   _In_  int    cchSrc,
    #   _Out_ LPWORD lpCharType)
    attach_function 'GetStringTypeA', [:lcid, :dword, :string, :int, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318118(v=vs.85).aspx
    # BOOL GetStringTypeEx(
    #   _In_  LCID    Locale,
    #   _In_  DWORD   dwInfoType,
    #   _In_  LPCTSTR lpSrcStr,
    #   _In_  int     cchSrc,
    #   _Out_ LPWORD  lpCharType)
    encoded_function 'GetStringTypeEx', [:lcid, :dword, :string, :int, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318119(v=vs.85).aspx
    # BOOL GetStringTypeW(
    #   _In_  DWORD   dwInfoType,
    #   _In_  LPCWSTR lpSrcStr,
    #   _In_  int     cchSrc,
    #   _Out_ LPWORD  lpCharType)
    attach_function 'GetStringTypeW', [:dword, :string, :int, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318120(v=vs.85).aspx
    # LANGID GetSystemDefaultLangID(void)
    attach_function 'GetSystemDefaultLangID', [], :langid

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318121(v=vs.85).aspx
    # LCID GetSystemDefaultLCID(void)
    attach_function 'GetSystemDefaultLCID', [], :lcid

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318127(v=vs.85).aspx
    # LCID GetThreadLocale(void)
    attach_function 'GetThreadLocale', [], :lcid

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318130(v=vs.85).aspx
    # int GetTimeFormat(
    #   _In_            LCID       Locale,
    #   _In_            DWORD      dwFlags,
    #   _In_opt_  const SYSTEMTIME *lpTime,
    #   _In_opt_        LPCTSTR    lpFormat,
    #   _Out_opt_       LPTSTR     lpTimeStr,
    #   _In_            int        cchTime)
    encoded_function 'GetTimeFormat', [:lcid, TimeFlag, SYSTEMTIME.ptr(:in), :string, :string, :int], :int

    # int GetTimeFormatEx(
    #     _In_opt_   LPCWSTR lpLocaleName,
    #     _In_       DWORD dwFlags,
    #     _In_opt_   const SYSTEMTIME *lpTime,
    #     _In_opt_   LPCWSTR lpFormat,
    #     _Out_opt_  LPWSTR lpTimeStr,
    #     _In_       int cchTime )
    attach_function 'GetTimeFormatEx', [:string, TimeFlag, SYSTEMTIME.ptr(:in), :string, :string, :int],  :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318134(v=vs.85).aspx
    # LANGID GetUserDefaultLangID(void)
    attach_function 'GetUserDefaultLangID', [], :langid

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318135(v=vs.85).aspx
    # LCID GetUserDefaultLCID(void)
    attach_function 'GetUserDefaultLCID', [], :lcid

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318674(v=vs.85).aspx
    # BOOL IsValidCodePage(_In_ UINT CodePage)
    attach_function 'IsValidCodePage', [:uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318677(v=vs.85).aspx
    # BOOL IsValidLanguageGroup(_In_ LGRPID LanguageGroup, _In_ DWORD  dwFlags)
    attach_function 'IsValidLanguageGroup', [LanguageGroup, LanguageGroupEnumerationFlag], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318679(v=vs.85).aspx
    # BOOL IsValidLocale(_In_ LCID  Locale, _In_ DWORD dwFlags)
    attach_function 'IsValidLocale', [:lcid, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318700(v=vs.85).aspx
    # int LCMapString(
    #   _In_      LCID    Locale,
    #   _In_      DWORD   dwMapFlags,
    #   _In_      LPCTSTR lpSrcStr,
    #   _In_      int     cchSrc,
    #   _Out_opt_ LPTSTR  lpDestStr,
    #   _In_      int     cchDest)
    encoded_function 'LCMapString', [:lcid, :dword, :string, :int, :string, :int], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374048(v=vs.85).aspx
    # BOOL SetCalendarInfo(
    #   _In_ LCID    Locale,
    #   _In_ CALID   Calendar,
    #   _In_ CALTYPE CalType,
    #   _In_ LPCTSTR lpCalData)
    encoded_function 'SetCalendarInfo', [:lcid, CalendarId, CalendarType, :string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374049(v=vs.85).aspx
    # BOOL SetLocaleInfo(_In_ LCID    Locale, _In_ LCTYPE  LCType, _In_ LPCTSTR lpLCData)
    encoded_function 'SetLocaleInfo', [:lcid, :lctype, :string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374051(v=vs.85).aspx
    # BOOL SetThreadLocale(_In_ LCID Locale)
    attach_function 'SetThreadLocale', [:lcid], :bool

    if WindowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317817(v=vs.85).aspx
      # BOOL CALLBACK EnumGeoInfoProc(_In_ GEOID GeoId)
      EnumGeoInfoProc = callback 'EnumGeoInfoProc', [:geoid], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317826(v=vs.85).aspx
      # BOOL EnumSystemGeoID(
      #   _In_ GEOCLASS     GeoClass,
      #   _In_ GEOID        ParentGeoId,
      #   _In_ GEO_ENUMPROC lpGeoEnumProc)
      attach_function 'EnumSystemGeoID', [SYSGEOCLASS, :geoid, EnumGeoInfoProc], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318099(v=vs.85).aspx
      # int GetGeoInfo(
      #   _In_      GEOID   Location,
      #   _In_      GEOTYPE GeoType,
      #   _Out_opt_ LPTSTR  lpGeoData,
      #   _In_      int     cchData,
      #   _In_      LANGID  LangId)
      encoded_function 'GetGeoInfo', [:geoid, SYSGEOTYPE, :string, :int, :langid], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318138(v=vs.85).aspx
      # GEOID GetUserGeoID(_In_ GEOCLASS GeoClass)
      attach_function 'GetUserGeoID', [SYSGEOCLASS], :geoid

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374055(v=vs.85).aspx
      # BOOL SetUserGeoID(_In_ GEOID GeoId)
      attach_function 'SetUserGeoID', [:geoid], :bool

      if WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317808(v=vs.85).aspx
        # BOOL CALLBACK EnumCalendarInfoProcExEx(
        #   _In_ LPWSTR lpCalendarInfoString,
        #   _In_ CALID  Calendar,
        #   _In_ LPWSTR lpReserved,
        #   _In_ LPARAM lParam)
        EnumCalendarInfoProcExEx = callback 'EnumCalendarInfoProcExEx', [:string, CalendarId, :string, :lparam], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317815(v=vs.85).aspx
        # BOOL CALLBACK EnumDateFormatsProcExEx(
        #   _In_ LPWSTR lpDateFormatString,
        #   _In_ CALID  CalendarID,
        #   _In_ LPARAM lParam)
        EnumDateFormatsProcExEx = callback 'EnumDateFormatsProcExEx', [:string, CalendarId, :lparam], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317823(v=vs.85).aspx
        # BOOL CALLBACK EnumLocalesProcEx(
        #   _In_ LPWSTR lpLocaleString,
        #   _In_ DWORD  dwFlags,
        #   _In_ LPARAM lParam)
        EnumLocalesProcEx = callback 'EnumLocalesProcEx', [:string, NamedBasedEnumerationFlag, :lparam], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317833(v=vs.85).aspx
        # BOOL CALLBACK EnumTimeFormatsProcEx(_In_ LPWSTR lpTimeFormatString, _In_ LPARAM lParam)
        EnumTimeFormatsProcEx = callback 'EnumTimeFormatsProcEx', [:string, :lparam], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317715(v=vs.85).aspx
        # BOOL AdjustCalendarDate(
        #   _Inout_ LPCALDATETIME        lpCalDateTime,
        #   _In_    CALDATETIME_DATEUNIT calUnit,
        #   _Out_   INT                  amount)
        attach_function 'AdjustCalendarDate', [CALDATETIME.ptr, CALDATETIME_DATEUNIT, :int], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317761(v=vs.85).aspx
        # int CompareStringEx(
        #   _In_opt_ LPCWSTR          lpLocaleName,
        #   _In_     DWORD            dwCmpFlags,
        #   _In_     LPCWSTR          lpString1,
        #   _In_     int              cchCount1,
        #   _In_     LPCWSTR          lpString2,
        #   _In_     int              cchCount2,
        #   _In_opt_ LPNLSVERSIONINFO lpVersionInformation,
        #   _In_opt_ LPVOID           lpReserved,
        #   _In_opt_ LPARAM           lParam)
        attach_function 'CompareStringEx',
                        [:string, CompareStringFlag, :string, :int, :string, :int, :pointer, :pointer, :lparam], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317762(v=vs.85).aspx
        # int CompareStringOrdinal(
        #   _In_ LPCWSTR lpString1,
        #   _In_ int     cchCount1,
        #   _In_ LPCWSTR lpString2,
        #   _In_ int     cchCount2,
        #   _In_ BOOL    bIgnoreCase)
        attach_function 'CompareStringOrdinal', [:string, :int, :string, :int, :bool], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317767(v=vs.85).aspx
        # BOOL ConvertCalDateTimeToSystemTime(
        #   _In_  const LPCALDATETIME lpCalDateTime,
        #   _Out_       SYSTEMTIME    *lpSysTime)
        attach_function 'ConvertCalDateTimeToSystemTime', [CALDATETIME.ptr(:in), SYSTEMTIME.ptr(:out)], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317769(v=vs.85).aspx
        # BOOL ConvertSystemTimeToCalDateTime(
        #   _In_  const SYSTEMTIME    lpSysTime,
        #   _In_        CALID         calId,
        #   _Out_       LPCALDATETIME lpCalDateTime)
        attach_function 'ConvertSystemTimeToCalDateTime', [SYSTEMTIME.ptr(:in), CalendarId, CALDATETIME.ptr(:out)], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317805(v=vs.85).aspx
        # BOOL EnumCalendarInfoExEx(
        #   _In_     CALINFO_ENUMPROCEXEX pCalInfoEnumProcExEx,
        #   _In_opt_ LPCWSTR              lpLocaleName,
        #   _In_     CALID                Calendar,
        #   _In_opt_ LPCWSTR              lpReserved,
        #   _In_     CALTYPE              CalType,
        #   _In_     LPARAM               lParam)
        attach_function 'EnumCalendarInfoExEx',
                        [EnumCalendarInfoProcExEx, :string, CalendarId, :string, CalendarType, :lparam], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317812(v=vs.85).aspx
        # BOOL EnumDateFormatsExEx(
        #   _In_     DATEFMT_ENUMPROCEXEX lpDateFmtEnumProcExEx,
        #   _In_opt_ LPCWSTR              lpLocaleName,
        #   _In_     DWORD                dwFlags,
        #   _In_     LPARAM               lParam)
        attach_function 'EnumDateFormatsExEx', [EnumDateFormatsProcExEx, :string, DateFormat, :lparam], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317829(v=vs.85).aspx
        # BOOL EnumSystemLocalesEx(
        #   _In_     LOCALE_ENUMPROCEX lpLocaleEnumProcEx,
        #   _In_     DWORD             dwFlags,
        #   _In_     LPARAM            lParam,
        #   _In_opt_ LPVOID            lpReserved)
        attach_function 'EnumSystemLocalesEx', [EnumLocalesProcEx, NamedBasedEnumerationFlag, :lparam, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317831(v=vs.85).aspx
        # BOOL EnumTimeFormatsEx(
        #   _In_     TIMEFMT_ENUMPROCEX lpTimeFmtEnumProcEx,
        #   _In_opt_ LPCWSTR            lpLocaleName,
        #   _In_     DWORD              dwFlags,
        #   _In_     LPARAM             lParam)
        attach_function 'EnumTimeFormatsEx', [EnumTimeFormatsProcEx, :string, TimeFlag, :lparam], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318056(v=vs.85).aspx
        # int FindNLSString(
        #   _In_      LCID    Locale,
        #   _In_      DWORD   dwFindNLSStringFlags,
        #   _In_      LPCWSTR lpStringSource,
        #   _In_      int     cchSource,
        #   _In_      LPCWSTR lpStringValue,
        #   _In_      int     cchValue,
        #   _Out_opt_ LPINT   pcchFound)
        attach_function 'FindNLSString', [:lcid, :dword, :string, :int, :string, :int, :pointer], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318059(v=vs.85).aspx
        # int FindNLSStringEx(
        #   _In_opt_  LPCWSTR          lpLocaleName,
        #   _In_      DWORD            dwFindNLSStringFlags,
        #   _In_      LPCWSTR          lpStringSource,
        #   _In_      int              cchSource,
        #   _In_      LPCWSTR          lpStringValue,
        #   _In_      int              cchValue,
        #   _Out_opt_ LPINT            pcchFound,
        #   _In_opt_  LPNLSVERSIONINFO lpVersionInformation,
        #   _In_opt_  LPVOID           lpReserved,
        #   _In_opt_  LPARAM           sortHandle)
        attach_function 'FindNLSStringEx',
                        [:string, :dword, :string, :int, :string, :int, :pointer, :pointer, :pointer, :lparam], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318071(v=vs.85).aspx
        # BOOL GetCalendarDateFormatEx(
        #   _In_        LPCWSTR       lpszLocale,
        #   _In_        DWORD         dwFlags,
        #   _In_  const LPCALDATETIME lpCalDateTime,
        #   _In_        LPCWSTR       lpFormat,
        #   _Out_       LPWSTR        lpDateStr,
        #   _In_        int           cchDate)
        attach_function 'GetCalendarDateFormatEx',
                        [:string, DateFormat, CALDATETIME.ptr(:in), :string, :string, :int], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318075(v=vs.85).aspx
        # int GetCalendarInfoEx(
        #   _In_opt_  LPCWSTR lpLocaleName,
        #   _In_      CALID   Calendar,
        #   _In_opt_  LPCWSTR lpReserved,
        #   _In_      CALTYPE CalType,
        #   _Out_opt_ LPWSTR  lpCalData,
        #   _In_      int     cchData,
        #   _Out_opt_ LPDWORD lpValue)
        attach_function 'GetCalendarInfoEx', [:string, CalendarId, :string, CalendarType, :string, :int, :pointer], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318077(v=vs.85).aspx
        # BOOL GetCalendarSupportedDateRange(
        #   _In_  CALID         Calendar,
        #   _Out_ LPCALDATETIME lpCalMinDateTime,
        #   _Out_ LPCALDATETIME lpCalMaxDateTime)
        attach_function 'GetCalendarSupportedDateRange',
                        [CalendarId, CALDATETIME.ptr(:out), CALDATETIME.ptr(:out)], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318088(v=vs.85).aspx
        # int GetDateFormatEx(
        #   _In_opt_        LPCWSTR    lpLocaleName,
        #   _In_            DWORD      dwFlags,
        #   _In_opt_  const SYSTEMTIME *lpDate,
        #   _In_opt_        LPCWSTR    lpFormat,
        #   _Out_opt_       LPWSTR     lpDateStr,
        #   _In_            int        cchDate,
        #   _In_opt_        LPCWSTR    lpCalendar)
        attach_function 'GetDateFormatEx',
                        [:string, DateFormat, SYSTEMTIME.ptr(:in), :string, :string, :int, :string], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318091(v=vs.85).aspx
        # int GetDurationFormat(
        #   _In_            LCID       Locale,
        #   _In_            DWORD      dwFlags,
        #   _In_opt_  const SYSTEMTIME *lpDuration,
        #   _In_            ULONGLONG  ullDuration,
        #   _In_opt_        LPCWSTR    lpFormat,
        #   _Out_opt_       LPWSTR     lpDurationStr,
        #   _In_            int        cchDuration)
        attach_function 'GetDurationFormat', [:lcid, :dword, SYSTEMTIME.ptr(:in), :ulonglong, :string, :string, :int], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318092(v=vs.85).aspx
        # int GetDurationFormatEx(
        #   _In_opt_        LPCWSTR    lpLocaleName,
        #   _In_            DWORD      dwFlags,
        #   _In_opt_  const SYSTEMTIME *lpDuration,
        #   _In_            ULONGLONG  ullDuration,
        #   _In_opt_        LPCWSTR    lpFormat,
        #   _Out_opt_       LPWSTR     lpDurationStr,
        #   _In_            int        cchDuration)
        attach_function 'GetDurationFormatEx',
                        [:string, :dword, SYSTEMTIME.ptr(:in), :ulonglong, :string, :string, :int], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318103(v=vs.85).aspx
        # int GetLocaleInfoEx(
        #   _In_opt_  LPCWSTR lpLocaleName,
        #   _In_      LCTYPE  LCType,
        #   _Out_opt_ LPWSTR  lpLCData,
        #   _In_      int     cchData)
        attach_function 'GetLocaleInfoEx', [:string, :lctype, :string, :int], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318105(v=vs.85).aspx
        # BOOL GetNLSVersion(
        #   _In_    NLS_FUNCTION     Function,
        #   _In_    LCID             Locale,
        #   _Inout_ LPNLSVERSIONINFO lpVersionInformation)
        attach_function 'GetNLSVersion', [SYSNLS_FUNCTION, :lcid, NLSVERSIONINFO.ptr], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318107(v=vs.85).aspx
        # BOOL GetNLSVersionEx(
        #   _In_     NLS_FUNCTION       function,
        #   _In_opt_ LPCWSTR            lpLocaleName,
        #   _Inout_  LPNLSVERSIONINFOEX lpVersionInformation)
        attach_function 'GetNLSVersionEx', [SYSNLS_FUNCTION, :string, NLSVERSIONINFOEX.ptr], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318113(v=vs.85).aspx
        # int GetNumberFormatEx(
        #   _In_opt_        LPCWSTR   lpLocaleName,
        #   _In_            DWORD     dwFlags,
        #   _In_            LPCWSTR   lpValue,
        #   _In_opt_  const NUMBERFMT *lpFormat,
        #   _Out_opt_       LPWSTR    lpNumberStr,
        #   _In_            int       cchNumber)
        attach_function 'GetNumberFormatEx', [:string, :dword, :string, NUMBERFMT.ptr(:in), :string, :int], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318116(v=vs.85).aspx
        # int GetStringScripts(
        #   _In_      DWORD   dwFlags,
        #   _In_      LPCWSTR lpString,
        #   _In_      int     cchString,
        #   _Out_opt_ LPWSTR  lpScripts,
        #   _In_      int     cchScripts)
        attach_function 'GetStringScripts', [GetStringScriptFlag, :string, :int, :string, :int], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318122(v=vs.85).aspx
        # int GetSystemDefaultLocaleName(_Out_ LPWSTR lpLocaleName, _In_  int    cchLocaleName)
        attach_function 'GetSystemDefaultLocaleName', [:string, :int], :int


        # int GetUserDefaultLocaleName(_Out_ LPWSTR lpLocaleName, _In_  int    cchLocaleName)
        attach_function 'GetUserDefaultLocaleName', [:string, :int], :int

        # int IdnToAscii(
        #   _In_      DWORD   dwFlags,
        #   _In_      LPCWSTR lpUnicodeCharStr,
        #   _In_      int     cchUnicodeChar,
        #   _Out_opt_ LPWSTR  lpASCIICharStr,
        #   _In_      int     cchASCIIChar)
        attach_function 'IdnToAscii', [InternationalDomainNameFlag, :string, :int, :string, :int], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318150(v=vs.85).aspx
        # int IdnToNameprepUnicode(
        #   _In_      DWORD   dwFlags,
        #   _In_      LPCWSTR lpUnicodeCharStr,
        #   _In_      int     cchUnicodeChar,
        #   _Out_opt_ LPWSTR  lpNameprepCharStr,
        #   _In_      int     cchNameprepChar)
        attach_function 'IdnToNameprepUnicode', [InternationalDomainNameFlag, :string, :int, :string, :int], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318151(v=vs.85).aspx
        # int IdnToUnicode(
        #   _In_      DWORD   dwFlags,
        #   _In_      LPCWSTR lpASCIICharStr,
        #   _In_      int     cchASCIIChar,
        #   _Out_opt_ LPWSTR  lpUnicodeCharStr,
        #   _In_      int     cchUnicodeChar)
        attach_function 'IdnToUnicode', [InternationalDomainNameFlag, :string, :int, :string, :int], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318663(v=vs.85).aspx
        # BOOL IsCalendarLeapYear(
        #   _In_ CALID calId,
        #   _In_ UINT  year,
        #   _In_ UINT  era)
        attach_function 'IsCalendarLeapYear', [CalendarId, :uint, :uint], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318669(v=vs.85).aspx
        # BOOL IsNLSDefinedString(
        #   _In_ NLS_FUNCTION     Function,
        #   _In_ DWORD            dwFlags,
        #   _In_ LPNLSVERSIONINFO lpVersionInformation,
        #   _In_ LPCWSTR          lpString,
        #   _In_ INT              cchStr)
        attach_function 'IsNLSDefinedString', [SYSNLS_FUNCTION, :dword, NLSVERSIONINFO.ptr(:in), :string, :int], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318671(v=vs.85).aspx
        # BOOL IsNormalizedString(
        #   _In_ NORM_FORM NormForm,
        #   _In_ LPCWSTR   lpString,
        #   _In_ int       cwLength)
        attach_function 'IsNormalizedString', [NORM_FORM, :string, :int], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318681(v=vs.85).aspx
        # BOOL IsValidLocaleName(_In_ LPCWSTR lpLocaleName)
        attach_function 'IsValidLocaleName', [:string], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318698(v=vs.85).aspx
        # int LCIDToLocaleName(
        #   _In_      LCID   Locale,
        #   _Out_opt_ LPWSTR lpName,
        #   _In_      int    cchName,
        #   _In_      DWORD  dwFlags)
        attach_function 'LCIDToLocaleName', [:lcid, :string, :int, :dword], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318702(v=vs.85).aspx
        # int LCMapStringEx(
        #   _In_opt_  LPCWSTR          lpLocaleName,
        #   _In_      DWORD            dwMapFlags,
        #   _In_      LPCWSTR          lpSrcStr,
        #   _In_      int              cchSrc,
        #   _Out_opt_ LPWSTR           lpDestStr,
        #   _In_      int              cchDest,
        #   _In_opt_  LPNLSVERSIONINFO lpVersionInformation,
        #   _In_opt_  LPVOID           lpReserved,
        #   _In_opt_  LPARAM           sortHandle)
        attach_function 'LCMapStringEx',
                        [:string, :dword, :string, :int, :string, :int, NLSVERSIONINFO.ptr(:in), :pointer, :lparam],
                        :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318711(v=vs.85).aspx
        # LCID LocaleNameToLCID(_In_ LPCWSTR lpName, _In_ DWORD   dwFlags)
        attach_function 'LocaleNameToLCID', [:string, :dword], :lcid

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd319093(v=vs.85).aspx
        # int NormalizeString(
        #   _In_      NORM_FORM NormForm,
        #   _In_      LPCWSTR   lpSrcString,
        #   _In_      int       cwSrcLength,
        #   _Out_opt_ LPWSTR    lpDstString,
        #   _In_      int       cwDstLength)
        attach_function 'NormalizeString', [NORM_FORM, :string, :int, :string, :int], :int

        # https://msdn.microsoft.com/en-us/library/windows/desktop/jj553438(v=vs.85).aspx
        # BOOL WINAPI NotifyUILanguageChange(
        #   _In_      DWORD  dwFlags,
        #   _In_opt_  PCWSTR pcwstrNewLanguage,
        #   _In_opt_  PCWSTR pcwstrPreviousLanguage,
        #   _In_      DWORD  dwReserved,
        #   _Out_opt_ PDWORD pdwStatusRtrn)
        attach_function 'NotifyUILanguageChange', [:dword, :string, :string, :dword, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd319115(v=vs.85).aspx
        # BOOL RtlIsValidLocaleName(_In_ LPCWSTR LocaleName, _In_ ULONG   Flags)
        # attach_function 'RtlIsValidLocaleName', [:string, :ulong], :bool TODO

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374097(v=vs.85).aspx
        # BOOL UpdateCalendarDayOfWeek(_Inout_ LPCALDATETIME lpCalDateTime)
        attach_function 'UpdateCalendarDayOfWeek', [CALDATETIME.ptr], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374129(v=vs.85).aspx
        # BOOL VerifyScripts(
        #   _In_ DWORD   dwFlags,
        #   _In_ LPCWSTR lpLocaleScripts,
        #   _In_ int     cchLocaleScripts,
        #   _In_ LPCWSTR lpTestScripts,
        #   _In_ int     cchTestScripts)
        attach_function 'VerifyScripts', [VerifyScriptsFlag, :string, :int, :string, :int], :bool

        if WindowsVersion >= 7
          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318061(v=vs.85).aspx
          # int FindStringOrdinal(
          #   _In_ DWORD   dwFindStringOrdinalFlags,
          #   _In_ LPCWSTR lpStringSource,
          #   _In_ int     cchSource,
          #   _In_ LPCWSTR lpStringValue,
          #   _In_ int     cchValue,
          #   _In_ BOOL    bIgnoreCase)
          attach_function 'FindStringOrdinal', [SearchFlag, :string, :int, :string, :int, :bool], :int

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd319112(v=vs.85).aspx
          # int ResolveLocaleName(
          #   _In_opt_  LPCWSTR lpNameToResolve,
          #   _Out_opt_ LPWSTR  lpLocaleName,
          #   _In_      int     cchLocaleName)
          attach_function 'ResolveLocaleName', [:string, :string, :int], :int

          # https://msdn.microsoft.com/en-us/library/windows/desktop/jj553437(v=vs.85).aspx
          # BOOL WINAPI LoadStringByReference(
          #   _In_      DWORD  Flags,
          #   _In_opt_  PCWSTR Language,
          #   _In_      PCWSTR SourceString,
          #   _Out_opt_ PWSTR  Buffer,
          #   _In_      ULONG  cchBuffer,
          #   _In_opt_  PCWSTR Directory,
          #   _Out_opt_ PULONG pcchBufferOut)
          # attach_function 'LoadStringByReference', [:dword, :string, :string, :string, :ulong, :string, :pointer], :bool

          if WindowsVersion >= 8
            # DWORD IsValidNLSVersion(
            #   _In_     NLS_FUNCTION       function,
            #   _In_opt_ LPCWSTR            lpLocaleName,
            #   _In_     LPNLSVERSIONINFOEX lpVersionInformation)
            attach_function 'IsValidNLSVersion', [SYSNLS_FUNCTION, :string, NLSVERSIONINFOEX.ptr(:in)], :dword
          end
        end
      end
    end
  end
end
