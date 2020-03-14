require_relative '../struct/time/system_time'
require_relative '../struct/language/cal_date_time'
require_relative '../struct/language/number_fmt'
require_relative '../struct/language/cp_info'
require_relative '../struct/language/cp_info_ex'
require_relative '../struct/language/currency_fmt'
require_relative '../struct/language/nls_version_info'
require_relative '../struct/language/nls_version_info_ex'

require_relative '../enum/language/cal_date_time_date_unit'
require_relative '../enum/language/language_group'
require_relative '../enum/language/language_group_enumeration_flag'
require_relative '../enum/language/compare_string_flag'
require_relative '../enum/language/calendar_id'
require_relative '../enum/language/calendar_type'
require_relative '../enum/language/date_format'
require_relative '../enum/language/code_page_enumeration_flag'
require_relative '../enum/language/map_flag'
require_relative '../enum/language/locale_enumeration_flag'
require_relative '../enum/language/code_page_value'
require_relative '../enum/language/time_flag'
require_relative '../enum/language/named_based_enumeration_flag'
require_relative '../enum/language/sys_geo_class'
require_relative '../enum/language/sys_geo_type'
require_relative '../enum/language/sys_nls_function'
require_relative '../enum/language/get_string_script_flag'
require_relative '../enum/language/international_domain_name_flag'
require_relative '../enum/language/norm_form'
require_relative '../enum/language/verify_scripts_flag'

require_relative '../enum/locale'

module WinFFI
  module Kernel32

    typedef :long,  :geoid
    typedef :dword, :geotype
    typedef :dword, :geoclass
    typedef :dword, :lctype

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317806
    # BOOL CALLBACK EnumCalendarInfoProc(_In_ LPTSTR lpCalendarInfoString)
    EnumCalendarInfoProc = callback 'EnumCalendarInfoProc', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317807
    # BOOL CALLBACK EnumCalendarInfoProcEx(_In_ LPTSTR lpCalendarInfoString, _In_ CALID  Calendar)
    EnumCalendarInfoProcEx = callback 'EnumCalendarInfoProcEx', [:string, CalendarId], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317809
    # BOOL CALLBACK EnumCodePagesProc(_In_ LPTSTR lpCodePageString)
    EnumCodePagesProc = callback 'EnumCodePagesProc', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317813
    # BOOL CALLBACK EnumDateFormatsProc(_In_ LPTSTR lpDateFormatString)
    EnumDateFormatsProc = callback 'EnumDateFormatsProc', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317814
    # BOOL CALLBACK EnumDateFormatsProcEx(_In_ LPTSTR lpDateFormatString, _In_ CALID  CalendarID)
    EnumDateFormatsProcEx = callback 'EnumDateFormatsProcEx', [:string, CalendarId], :bool

    # BOOL CALLBACK EnumLanguageGroupLocalesProc(
    #   _In_ LGRPID   LanguageGroup,
    #   _In_ LCID     Locale,
    #   _In_ LPTSTR   lpLocaleString,
    #   _In_ LONG_PTR lParam)
    EnumLanguageGroupLocalesProc = callback 'EnumLanguageGroupLocalesProc',
                                            [LanguageGroup, :lcid, :string, :long_ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317821
    # BOOL CALLBACK EnumLanguageGroupsProc(
    #   _In_ LGRPID   LanguageGroup,
    #   _In_ LPTSTR   lpLanguageGroupString,
    #   _In_ LPTSTR   lpLanguageGroupNameString,
    #   _In_ DWORD    dwFlags,
    #   _In_ LONG_PTR lParam)
    EnumLanguageGroupsProc = callback 'EnumLanguageGroupsProc',
                                      [LanguageGroup, :string, :string, LanguageGroupEnumerationFlag, :long_ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317822
    # BOOL CALLBACK EnumLocalesProc(_In_ LPTSTR lpLocaleString)
    EnumLocalesProc = callback 'EnumLocalesProc', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317832
    # BOOL CALLBACK EnumTimeFormatsProc(_In_ LPTSTR lpTimeFormatString)
    EnumTimeFormatsProc = callback 'EnumTimeFormatsProc', [:string], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/stringapiset/nf-stringapiset-comparestringw
    # int CompareString(
    #   _In_ LCID    Locale,
    #   _In_ DWORD   dwCmpFlags,
    #   _In_ LPCTSTR lpString1,
    #   _In_ int     cchCount1,
    #   _In_ LPCTSTR lpString2,
    #   _In_ int     cchCount2)
    def self.CompareString(locale, dwCmpFlags, lpString1, cchCount1, lpString2, cchCount2) end
    encoded_function 'CompareString', [Locale, CompareStringFlag, :string, :int, :string, :int], :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-convertdefaultlocale
    # LCID ConvertDefaultLocale(_In_ LCID Locale)
    def self.ConvertDefaultLocale(locale) end
    attach_function 'ConvertDefaultLocale', [:lcid], :lcid

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumcalendarinfoa
    # BOOL EnumCalendarInfo(
    #   _In_ CALINFO_ENUMPROC pCalInfoEnumProc,
    #   _In_ LCID             Locale,
    #   _In_ CALID            Calendar,
    #   _In_ CALTYPE          CalType)
    def self.EnumCalendarInfo(pCalInfoEnumProc, locale, calendar, calType) end
    encoded_function 'EnumCalendarInfo', [EnumCalendarInfoProc, Locale, CalendarId, CalendarType], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumcalendarinfoexa
    # BOOL EnumCalendarInfoEx(
    #   _In_ CALINFO_ENUMPROCEX pCalInfoEnumProcEx,
    #   _In_ LCID               Locale,
    #   _In_ CALID              Calendar,
    #   _In_ CALTYPE            CalType)
    def self.EnumCalendarInfoEx(pCalInfoEnumProcEx, locale, calendar, calType) end
    encoded_function 'EnumCalendarInfoEx', [EnumCalendarInfoProcEx, Locale, CalendarId, CalendarType], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumdateformatsa
    # BOOL EnumDateFormats( _In_ DATEFMT_ENUMPROC lpDateFmtEnumProc, _In_ LCID Locale, _In_ DWORD dwFlags)
    def self.EnumDateFormats(lpDateFmtEnumProc, locale, dwFlags) end
    encoded_function 'EnumDateFormats', [EnumDateFormatsProc, Locale, DateFormat], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumdateformatsexa
    # BOOL EnumDateFormatsEx( _In_ DATEFMT_ENUMPROCEX lpDateFmtEnumProcEx, _In_ LCID Locale, _In_ DWORD dwFlags)
    def self.EnumDateFormatsEx(lpDateFmtEnumProcEx, locale, dwFlags) end
    encoded_function 'EnumDateFormatsEx', [EnumDateFormatsProcEx, Locale, DateFormat], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumlanguagegrouplocalesa
    # BOOL EnumLanguageGroupLocales(
    #   _In_ LANGGROUPLOCALE_ENUMPROC lpLangGroupLocaleEnumProc,
    #   _In_ LGRPID                   LanguageGroup,
    #   _In_ DWORD                    dwFlags,
    #   _In_ LONG_PTR                 lParam)
    def self.EnumLanguageGroupLocales(lpLangGroupLocaleEnumProc, languageGroup, dwFlags, lParam) end
    encoded_function 'EnumLanguageGroupLocales', [EnumLanguageGroupLocalesProc, LanguageGroup, :dword, :long_ptr], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumsystemcodepagesa
    # BOOL EnumSystemCodePages(_In_ CODEPAGE_ENUMPROC lpCodePageEnumProc, _In_ DWORD dwFlags)
    def self.EnumSystemCodePages(lpCodePageEnumProc, dwFlags) end
    encoded_function 'EnumSystemCodePages', [EnumCodePagesProc, CodePageEnumerationFlag], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumsystemlanguagegroupsa
    # BOOL EnumSystemLanguageGroups(
    #   _In_ LANGUAGEGROUP_ENUMPROC lpLanguageGroupEnumProc,
    #   _In_ DWORD                  dwFlags,
    #   _In_ LONG_PTR               lParam)
    def self.EnumSystemLanguageGroups(lpLanguageGroupEnumProc, dwFlags, lParam) end
    encoded_function 'EnumSystemLanguageGroups', [EnumLanguageGroupsProc, LanguageGroupEnumerationFlag, :long_ptr], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumsystemlocalesa
    # BOOL EnumSystemLocales(_In_ LOCALE_ENUMPROC lpLocaleEnumProc, _In_ DWORD dwFlags)
    def self.EnumSystemLocales(lpLocaleEnumProc, dwFlags) end
    encoded_function 'EnumSystemLocales', [EnumLocalesProc, LocaleEnumerationFlag], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumtimeformatsa
    # BOOL EnumTimeFormats( _In_ TIMEFMT_ENUMPROC lpTimeFmtEnumProc, _In_ LCID Locale, _In_ DWORD dwFlags)
    def self.EnumTimeFormats(lpTimeFmtEnumProc, locale, dwFlags) end
    encoded_function 'EnumTimeFormats', [EnumTimeFormatsProc, Locale, :dword], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/stringapiset/nf-stringapiset-foldstringw
    # int FoldString(
    #   _In_      DWORD   dwMapFlags,
    #   _In_      LPCTSTR lpSrcStr,
    #   _In_      int     cchSrc,
    #   _Out_opt_ LPTSTR  lpDestStr,
    #   _In_      int     cchDest)
    def self.FoldString(dwMapFlags, lpSrcStr, cchSrc, lpDestStr, cchDest) end
    encoded_function 'FoldString', [MapFlag, :string, :int, :string, :int], :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getacp
    # UINT GetACP(void)
    def self.GetACP; end
    attach_function 'GetACP', [], :uint

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getcalendarinfoa
    # int GetCalendarInfo(
    #   _In_      LCID    Locale,
    #   _In_      CALID   Calendar,
    #   _In_      CALTYPE CalType,
    #   _Out_opt_ LPTSTR  lpCalData,
    #   _In_      int     cchData,
    #   _Out_opt_ LPDWORD lpValue)
    def self.GetCalendarInfo(locale, calendar, calType, lpCalData, cchData, lpValue) end
    encoded_function 'GetCalendarInfo', [Locale, CalendarId, CalendarType, :string, :int, :pointer], :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getcpinfo
    # BOOL GetCPInfo(_In_  UINT     CodePage, _Out_ LPCPINFO lpCPInfo)
    def self.GetCPInfo(codePage, lpCPInfo) end
    attach_function 'GetCPInfo', [:uint, CPINFO.ptr(:out)], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getcpinfoexa
    # BOOL GetCPInfoEx(_In_ UINT CodePage, _In_ DWORD dwFlags, _Out_ LPCPINFOEX lpCPInfoEx)
    def self.GetCPInfoEx(codePage, dwFlags, lpCPInfoEx) end
    encoded_function 'GetCPInfoEx', [:uint, CodePageValue, CPINFOEX.ptr(:out)], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getcurrencyformata
    # int GetCurrencyFormat(
    #   _In_            LCID        Locale,
    #   _In_            DWORD       dwFlags,
    #   _In_            LPCTSTR     lpValue,
    #   _In_opt_  const CURRENCYFMT *lpFormat,
    #   _Out_opt_       LPTSTR      lpCurrencyStr,
    #   _In_            int         cchCurrency)
    def self.GetCurrencyFormat(locale, dwFlags, lpValue, lpFormat, lpCurrencyStr, cchCurrency) end
    encoded_function 'GetCurrencyFormat', [Locale, Locale, :string, CURRENCYFMT.ptr(:in), :string, :int], :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getcurrencyformatex
    # int GetCurrencyFormatEx(
    #   _In_opt_        LPCWSTR     lpLocaleName,
    #   _In_            DWORD       dwFlags,
    #   _In_            LPCWSTR     lpValue,
    #   _In_opt_  const CURRENCYFMT *lpFormat,
    #   _Out_opt_       LPWSTR      lpCurrencyStr,
    #   _In_            int         cchCurrency)
    def self.GetCurrencyFormatEx(lpLocaleName, dwFlags, lpValue, lpFormat, lpCurrencyStr, cchCurrency) end
    attach_function 'GetCurrencyFormatEx', [:string, :dword, :string, CURRENCYFMT.ptr(:in), :string, :int], :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/datetimeapi/nf-datetimeapi-getdateformata
    # int GetDateFormat(
    #   _In_            LCID       Locale,
    #   _In_            DWORD      dwFlags,
    #   _In_opt_  const SYSTEMTIME *lpDate,
    #   _In_opt_        LPCTSTR    lpFormat,
    #   _Out_opt_       LPTSTR     lpDateStr,
    #   _In_            int        cchDate)
    def self.GetDateFormat(locale, dwFlags, lpDate, lpFormat, lpDateStr, cchDate) end
    encoded_function 'GetDateFormat', [Locale, :dword, SYSTEMTIME.ptr(:in), :string, :string, :int], :int

    # https://docs.microsoft.com/pt-pt/windows/desktop/api/winnls/nf-winnls-getlocaleinfoa
    # int GetLocaleInfo( _In_ LCID Locale, _In_ LCTYPE LCType, _Out_opt_ LPTSTR lpLCData, _In_ int cchData)
    def self.GetLocaleInfo(locale, lCType, lpLCData, cchData) end
    encoded_function 'GetLocaleInfo', [Locale, Locale, :pointer, :int], :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getnumberformata
    # int GetNumberFormat(
    #   _In_            LCID      Locale,
    #   _In_            DWORD     dwFlags,
    #   _In_            LPCTSTR   lpValue,
    #   _In_opt_  const NUMBERFMT *lpFormat,
    #   _Out_opt_       LPTSTR    lpNumberStr,
    #   _In_            int       cchNumber)
    def self.GetNumberFormat(locale, dwFlags, lpValue, lpFormat, lpNumberStr, cchNumber) end
    encoded_function 'GetNumberFormat', [Locale, Locale, :string, NUMBERFMT.ptr(:in), :string, :int], :int

    # https://docs.microsoft.com/pt-pt/windows/desktop/api/winnls/nf-winnls-getoemcp
    # UINT GetOEMCP(void)
    def self.GetOEMCP; end
    attach_function 'GetOEMCP', [], :uint

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getstringtypea
    # BOOL GetStringTypeA(
    #   _In_  LCID   Locale,
    #   _In_  DWORD  dwInfoType,
    #   _In_  LPCSTR lpSrcStr,
    #   _In_  int    cchSrc,
    #   _Out_ LPWORD lpCharType)
    def self.GetStringType(locale, dwInfoType, lpSrcStr, cchSrc, lpCharType) end
    encoded_function 'GetStringType', [:lcid, :dword, :string, :int, :pointer], :bool

    # https://docs.microsoft.com/pt-pt/windows/desktop/api/winnls/nf-winnls-getstringtypeexa
    # BOOL GetStringTypeEx(
    #   _In_  LCID    Locale,
    #   _In_  DWORD   dwInfoType,
    #   _In_  LPCTSTR lpSrcStr,
    #   _In_  int     cchSrc,
    #   _Out_ LPWORD  lpCharType)
    def self.GetStringTypeEx(locale, dwInfoType, lpSrcStr, cchSrc, lpCharType) end
    encoded_function 'GetStringTypeEx', [:lcid, :dword, :string, :int, :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getsystemdefaultlangid
    # LANGID GetSystemDefaultLangID(void)
    def self.GetSystemDefaultLangID; end
    attach_function 'GetSystemDefaultLangID', [], :langid

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getsystemdefaultlcid
    # LCID GetSystemDefaultLCID(void)
    def self.GetSystemDefaultLCID; end
    attach_function 'GetSystemDefaultLCID', [], :lcid

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getthreadlocale
    # LCID GetThreadLocale(void)
    def self.GetThreadLocale; end
    attach_function 'GetThreadLocale', [], :lcid

    # https://docs.microsoft.com/en-us/windows/desktop/api/datetimeapi/nf-datetimeapi-gettimeformata
    # int GetTimeFormat(
    #   _In_            LCID       Locale,
    #   _In_            DWORD      dwFlags,
    #   _In_opt_  const SYSTEMTIME *lpTime,
    #   _In_opt_        LPCTSTR    lpFormat,
    #   _Out_opt_       LPTSTR     lpTimeStr,
    #   _In_            int        cchTime)
    def self.GetTimeFormat(locale, dwFlags, lpTime, lpFormat, lpTimeStr, cchTime) end
    encoded_function 'GetTimeFormat', [:lcid, TimeFlag, SYSTEMTIME.ptr(:in), :string, :string, :int], :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/datetimeapi/nf-datetimeapi-gettimeformatex
    # int GetTimeFormatEx(
    #     _In_opt_   LPCWSTR          lpLocaleName,
    #     _In_       DWORD            dwFlags,
    #     _In_opt_   const SYSTEMTIME *lpTime,
    #     _In_opt_   LPCWSTR          lpFormat,
    #     _Out_opt_  LPWSTR           lpTimeStr,
    #     _In_       int              cchTime )
    def self.GetTimeFormatEx(lpLocaleName, dwFlags, lpTime, lpFormat, lpTimeStr, cchTime) end
    attach_function 'GetTimeFormatEx', [:string, TimeFlag, SYSTEMTIME.ptr(:in), :string, :string, :int],  :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getuserdefaultlangid
    # LANGID GetUserDefaultLangID(void)
    def self.GetUserDefaultLangID; end
    attach_function 'GetUserDefaultLangID', [], :langid

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getuserdefaultlcid
    # LCID GetUserDefaultLCID(void)
    def self.GetUserDefaultLCID; end
    attach_function 'GetUserDefaultLCID', [], :lcid

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-isvalidcodepage
    # BOOL IsValidCodePage(_In_ UINT CodePage)
    def self.IsValidCodePage(codePage) end
    attach_function 'IsValidCodePage', [:uint], :bool


    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-isvalidlanguagegroup
    # BOOL IsValidLanguageGroup(_In_ LGRPID LanguageGroup, _In_ DWORD  dwFlags)
    def self.IsValidLanguageGroup(languageGroup, dwFlags) end
    attach_function 'IsValidLanguageGroup', [LanguageGroup, LanguageGroupEnumerationFlag], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-isvalidlocale
    # BOOL IsValidLocale(_In_ LCID  Locale, _In_ DWORD dwFlags)
    def self.IsValidLocale(locale, dwFlags) end
    attach_function 'IsValidLocale', [Locale, LocaleEnumerationFlag], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-lcmapstringa
    # int LCMapString(
    #   _In_      LCID    Locale,
    #   _In_      DWORD   dwMapFlags,
    #   _In_      LPCTSTR lpSrcStr,
    #   _In_      int     cchSrc,
    #   _Out_opt_ LPTSTR  lpDestStr,
    #   _In_      int     cchDest)
    def self.LCMapString(locale, dwMapFlags, lpSrcStr, cchSrc, lpDestStr, cchDest) end
    encoded_function 'LCMapString', [:lcid, :dword, :string, :int, :string, :int], :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-setcalendarinfoa
    # BOOL SetCalendarInfo( _In_ LCID    Locale, _In_ CALID   Calendar, _In_ CALTYPE CalType, _In_ LPCTSTR lpCalData)
    def self.SetCalendarInfo(locale, calendar, calType, lpCalData) end
    encoded_function 'SetCalendarInfo', [Locale, CalendarId, CalendarType, :string], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-setlocaleinfoa
    # BOOL SetLocaleInfo(_In_ LCID    Locale, _In_ LCTYPE  LCType, _In_ LPCTSTR lpLCData)
    def self.SetLocaleInfo(locale, lCType, lpLCData) end
    encoded_function 'SetLocaleInfo', [Locale, Locale, :string], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-setthreadlocale
    # BOOL SetThreadLocale(_In_ LCID Locale)
    def self.SetThreadLocale(locale) end
    attach_function 'SetThreadLocale', [:lcid], :bool

    if WINDOWS_VERSION >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317817
      # BOOL CALLBACK EnumGeoInfoProc(_In_ GEOID GeoId)
      EnumGeoInfoProc = callback 'EnumGeoInfoProc', [:geoid], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumsystemgeoid
      # BOOL EnumSystemGeoID( _In_ GEOCLASS GeoClass, _In_ GEOID ParentGeoId, _In_ GEO_ENUMPROC lpGeoEnumProc)
      def self.EnumSystemGeoID(geoClass, parentGeoId, lpGeoEnumProc) end
      attach_function 'EnumSystemGeoID', [SYSGEOCLASS, :geoid, EnumGeoInfoProc], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getgeoinfoa
      # int GetGeoInfo(
      #   _In_      GEOID   Location,
      #   _In_      GEOTYPE GeoType,
      #   _Out_opt_ LPTSTR  lpGeoData,
      #   _In_      int     cchData,
      #   _In_      LANGID  LangId)
      def self.GetGeoInfo(location, geoType, lpGeoData, cchData, langId) end
      encoded_function 'GetGeoInfo', [:geoid, SYSGEOTYPE, :string, :int, :langid], :int

      # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getusergeoid
      # GEOID GetUserGeoID(_In_ GEOCLASS GeoClass)
      def self.GetUserGeoID(geoClass) end
      attach_function 'GetUserGeoID', [SYSGEOCLASS], :geoid

      # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-setusergeoid
      # BOOL SetUserGeoID(_In_ GEOID GeoId)
      def self.SetUserGeoID(geoId) end
      attach_function 'SetUserGeoID', [:geoid], :bool

      if WINDOWS_VERSION >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317808
        # BOOL CALLBACK EnumCalendarInfoProcExEx(
        #   _In_ LPWSTR lpCalendarInfoString,
        #   _In_ CALID  Calendar,
        #   _In_ LPWSTR lpReserved,
        #   _In_ LPARAM lParam)
        EnumCalendarInfoProcExEx = callback 'EnumCalendarInfoProcExEx', [:string, CalendarId, :string, :lparam], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317815
        # BOOL CALLBACK EnumDateFormatsProcExEx(
        #   _In_ LPWSTR lpDateFormatString,
        #   _In_ CALID  CalendarID,
        #   _In_ LPARAM lParam)
        EnumDateFormatsProcExEx = callback 'EnumDateFormatsProcExEx', [:string, CalendarId, :lparam], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317823
        # BOOL CALLBACK EnumLocalesProcEx( _In_ LPWSTR lpLocaleString, _In_ DWORD  dwFlags, _In_ LPARAM lParam)
        EnumLocalesProcEx = callback 'EnumLocalesProcEx', [:string, NamedBasedEnumerationFlag, :lparam], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317833
        # BOOL CALLBACK EnumTimeFormatsProcEx(_In_ LPWSTR lpTimeFormatString, _In_ LPARAM lParam)
        EnumTimeFormatsProcEx = callback 'EnumTimeFormatsProcEx', [:string, :lparam], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/Intl/adjustcalendardate
        # BOOL AdjustCalendarDate(
        #   _Inout_ LPCALDATETIME        lpCalDateTime,
        #   _In_    CALDATETIME_DATEUNIT calUnit,
        #   _Out_   INT                  amount)
        def self.AdjustCalendarDate(lpCalDateTime, calUnit, amount) end
        attach_function 'AdjustCalendarDate', [CALDATETIME.ptr, CALDATETIME_DATEUNIT, :int], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/stringapiset/nf-stringapiset-comparestringex
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
        def self.CompareStringEx(lpLocaleName, dwCmpFlags, lpString1, cchCount1, lpString2, cchCount2,
            lpVersionInformation, lpReserved, lParam) end
        attach_function 'CompareStringEx',
                        [:string, CompareStringFlag, :string, :int, :string, :int, :pointer, :pointer, :lparam], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/stringapiset/nf-stringapiset-comparestringex
        # int CompareStringOrdinal(
        #   _In_ LPCWSTR lpString1,
        #   _In_ int     cchCount1,
        #   _In_ LPCWSTR lpString2,
        #   _In_ int     cchCount2,
        #   _In_ BOOL    bIgnoreCase)
        def self.CompareStringOrdinal(lpString1, cchCount1, lpString2, cchCount2, bIgnoreCase) end
        attach_function 'CompareStringOrdinal', [:string, :int, :string, :int, :bool], :int

        # https://docs.microsoft.com/en-us/windows/desktop/Intl/convertcaldatetimetosystemtime
        # BOOL ConvertCalDateTimeToSystemTime( _In_  const LPCALDATETIME lpCalDateTime, _Out_ SYSTEMTIME *lpSysTime)
        def self.ConvertCalDateTimeToSystemTime(lpCalDateTime, lpSysTime) end
        attach_function 'ConvertCalDateTimeToSystemTime',
                        [CALDATETIME.ptr(:in), SYSTEMTIME.ptr(:out)], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/Intl/convertsystemtimetocaldatetime
        # BOOL ConvertSystemTimeToCalDateTime(
        #   _In_  const SYSTEMTIME    lpSysTime,
        #   _In_        CALID         calId,
        #   _Out_       LPCALDATETIME lpCalDateTime)
        def self.ConvertSystemTimeToCalDateTime(lpSysTime, calId, lpCalDateTime) end
        attach_function 'ConvertSystemTimeToCalDateTime',
                        [SYSTEMTIME.ptr(:in), CalendarId, CALDATETIME.ptr(:out)], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumcalendarinfoexex
        # BOOL EnumCalendarInfoExEx(
        #   _In_     CALINFO_ENUMPROCEXEX pCalInfoEnumProcExEx,
        #   _In_opt_ LPCWSTR              lpLocaleName,
        #   _In_     CALID                Calendar,
        #   _In_opt_ LPCWSTR              lpReserved,
        #   _In_     CALTYPE              CalType,
        #   _In_     LPARAM               lParam)
        def self.EnumCalendarInfoExEx(pCalInfoEnumProcExEx, lpLocaleName, calendar, lpReserved, calType, lParam) end
        attach_function 'EnumCalendarInfoExEx',
                        [EnumCalendarInfoProcExEx, :string, CalendarId, :string, CalendarType, :lparam], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumdateformatsexex
        # BOOL EnumDateFormatsExEx(
        #   _In_     DATEFMT_ENUMPROCEXEX lpDateFmtEnumProcExEx,
        #   _In_opt_ LPCWSTR              lpLocaleName,
        #   _In_     DWORD                dwFlags,
        #   _In_     LPARAM               lParam)
        def self.EnumDateFormatsExEx(lpDateFmtEnumProcExEx, lpLocaleName, dwFlags, lParam) end
        attach_function 'EnumDateFormatsExEx', [EnumDateFormatsProcExEx, :string, DateFormat, :lparam], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumsystemlocalesex
        # BOOL EnumSystemLocalesEx(
        #   _In_     LOCALE_ENUMPROCEX lpLocaleEnumProcEx,
        #   _In_     DWORD             dwFlags,
        #   _In_     LPARAM            lParam,
        #   _In_opt_ LPVOID            lpReserved)
        def self.EnumSystemLocalesEx(lpLocaleEnumProcEx, dwFlags, lParam, lpReserved) end
        attach_function 'EnumSystemLocalesEx', [EnumLocalesProcEx, NamedBasedEnumerationFlag, :lparam, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumtimeformatsex
        # BOOL EnumTimeFormatsEx(
        #   _In_     TIMEFMT_ENUMPROCEX lpTimeFmtEnumProcEx,
        #   _In_opt_ LPCWSTR            lpLocaleName,
        #   _In_     DWORD              dwFlags,
        #   _In_     LPARAM             lParam)
        def self.EnumTimeFormatsEx(lpTimeFmtEnumProcEx, lpLocaleName, dwFlags, lParam) end
        attach_function 'EnumTimeFormatsEx', [EnumTimeFormatsProcEx, :string, TimeFlag, :lparam], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-findnlsstring
        # int FindNLSString(
        #   _In_      LCID    Locale,
        #   _In_      DWORD   dwFindNLSStringFlags,
        #   _In_      LPCWSTR lpStringSource,
        #   _In_      int     cchSource,
        #   _In_      LPCWSTR lpStringValue,
        #   _In_      int     cchValue,
        #   _Out_opt_ LPINT   pcchFound)
        def self.FindNLSString(locale, dwFindNLSStringFlags, lpStringSource, cchSource, lpStringValue, cchValue,
            pcchFound) end
        attach_function 'FindNLSString', [:lcid, :dword, :string, :int, :string, :int, :pointer], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-findnlsstringex
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
        def self.FindNLSStringEx(lpLocaleName, dwFindNLSStringFlags, lpStringSource, cchSource, lpStringValue, cchValue,
            pcchFound, lpVersionInformation, lpReserved, sortHandle) end
        attach_function 'FindNLSStringEx',
                        [:string, :dword, :string, :int, :string, :int, :pointer, :pointer, :pointer, :lparam], :int

        # https://docs.microsoft.com/en-us/windows/desktop/Intl/getcalendardateformatex
        # BOOL GetCalendarDateFormatEx(
        #   _In_        LPCWSTR       lpszLocale,
        #   _In_        DWORD         dwFlags,
        #   _In_  const LPCALDATETIME lpCalDateTime,
        #   _In_        LPCWSTR       lpFormat,
        #   _Out_       LPWSTR        lpDateStr,
        #   _In_        int           cchDate)
        def self.GetCalendarDateFormatEx(lpszLocale, dwFlags, lpCalDateTime, lpFormat, lpDateStr, cchDate) end
        attach_function 'GetCalendarDateFormatEx',
                        [:string, DateFormat, CALDATETIME.ptr(:in), :string, :string, :int], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getcalendarinfoex
        # int GetCalendarInfoEx(
        #   _In_opt_  LPCWSTR lpLocaleName,
        #   _In_      CALID   Calendar,
        #   _In_opt_  LPCWSTR lpReserved,
        #   _In_      CALTYPE CalType,
        #   _Out_opt_ LPWSTR  lpCalData,
        #   _In_      int     cchData,
        #   _Out_opt_ LPDWORD lpValue)
        def self.GetCalendarInfoEx(lpLocaleName, calendar, lpReserved, calType, lpCalData, cchData, lpValue) end
        attach_function 'GetCalendarInfoEx', [:string, CalendarId, :string, CalendarType, :string, :int, :pointer], :int

        # https://docs.microsoft.com/en-us/windows/desktop/Intl/getcalendarsupporteddaterange
        # BOOL GetCalendarSupportedDateRange(
        #   _In_  CALID         Calendar,
        #   _Out_ LPCALDATETIME lpCalMinDateTime,
        #   _Out_ LPCALDATETIME lpCalMaxDateTime)
        def self.GetCalendarSupportedDateRange(calendar, lpCalMinDateTime, lpCalMaxDateTime) end
        attach_function 'GetCalendarSupportedDateRange',
                        [CalendarId, CALDATETIME.ptr(:out), CALDATETIME.ptr(:out)], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/datetimeapi/nf-datetimeapi-getdateformatex
        # int GetDateFormatEx(
        #   _In_opt_        LPCWSTR    lpLocaleName,
        #   _In_            DWORD      dwFlags,
        #   _In_opt_  const SYSTEMTIME *lpDate,
        #   _In_opt_        LPCWSTR    lpFormat,
        #   _Out_opt_       LPWSTR     lpDateStr,
        #   _In_            int        cchDate,
        #   _In_opt_        LPCWSTR    lpCalendar)
        def self.GetDateFormatEx(lpLocaleName, dwFlags, lpDate, lpFormat, lpDateStr, cchDate, lpCalendar) end
        attach_function 'GetDateFormatEx',
                        [:string, DateFormat, SYSTEMTIME.ptr(:in), :string, :string, :int, :string], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getdurationformat
        # int GetDurationFormat(
        #   _In_            LCID       Locale,
        #   _In_            DWORD      dwFlags,
        #   _In_opt_  const SYSTEMTIME *lpDuration,
        #   _In_            ULONGLONG  ullDuration,
        #   _In_opt_        LPCWSTR    lpFormat,
        #   _Out_opt_       LPWSTR     lpDurationStr,
        #   _In_            int        cchDuration)
        def self.GetDurationFormat(locale, dwFlags, lpDuration, ullDuration, lpFormat, lpDurationStr, cchDuration) end
        attach_function 'GetDurationFormat', [Locale, Locale, SYSTEMTIME.ptr(:in), :ulonglong, :string, :string, :int], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getdurationformatex
        # int GetDurationFormatEx(
        #   _In_opt_        LPCWSTR    lpLocaleName,
        #   _In_            DWORD      dwFlags,
        #   _In_opt_  const SYSTEMTIME *lpDuration,
        #   _In_            ULONGLONG  ullDuration,
        #   _In_opt_        LPCWSTR    lpFormat,
        #   _Out_opt_       LPWSTR     lpDurationStr,
        #   _In_            int        cchDuration)
        def self.GetDurationFormatEx(lpLocaleName, dwFlags, lpDuration, ullDuration, lpFormat, lpDurationStr,
            cchDuration) end
        attach_function 'GetDurationFormatEx',
                        [:string, :dword, SYSTEMTIME.ptr(:in), :ulonglong, :string, :string, :int], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getlocaleinfoex
        # int GetLocaleInfoEx(
        #   _In_opt_  LPCWSTR lpLocaleName,
        #   _In_      LCTYPE  LCType,
        #   _Out_opt_ LPWSTR  lpLCData,
        #   _In_      int     cchData)
        def self.GetLocaleInfoEx(lpLocaleName, lCType, lpLCData, cchData) end
        attach_function 'GetLocaleInfoEx', [:string, :lctype, :string, :int], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getnlsversion
        def self.GetNLSVersion(function, locale, lpVersionInformation) end
        # BOOL GetNLSVersion(
        #   _In_    NLS_FUNCTION     Function,
        #   _In_    LCID             Locale,
        #   _Inout_ LPNLSVERSIONINFO lpVersionInformation)
        attach_function 'GetNLSVersion', [SYSNLS_FUNCTION, Locale, NLSVERSIONINFO.ptr], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getnlsversionex
        # BOOL GetNLSVersionEx(
        #   _In_     NLS_FUNCTION       function,
        #   _In_opt_ LPCWSTR            lpLocaleName,
        #   _Inout_  LPNLSVERSIONINFOEX lpVersionInformation)
        def self.GetNLSVersionEx(function, lpLocaleName, lpVersionInformation) end
        attach_function 'GetNLSVersionEx', [SYSNLS_FUNCTION, :string, NLSVERSIONINFOEX.ptr], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getnumberformatex
        # int GetNumberFormatEx(
        #   _In_opt_        LPCWSTR   lpLocaleName,
        #   _In_            DWORD     dwFlags,
        #   _In_            LPCWSTR   lpValue,
        #   _In_opt_  const NUMBERFMT *lpFormat,
        #   _Out_opt_       LPWSTR    lpNumberStr,
        #   _In_            int       cchNumber)
        def self.GetNumberFormatEx(lpLocaleName, dwFlags, lpValue, lpFormat, lpNumberStr, cchNumber) end
        attach_function 'GetNumberFormatEx',
                        [:string, :dword, :string, NUMBERFMT.ptr(:in), :string, :int], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getstringscripts
        # int GetStringScripts(
        #   _In_      DWORD   dwFlags,
        #   _In_      LPCWSTR lpString,
        #   _In_      int     cchString,
        #   _Out_opt_ LPWSTR  lpScripts,
        #   _In_      int     cchScripts)
        def self.GetStringScripts(dwFlags, lpString, cchString, lpScripts, cchScripts) end
        attach_function 'GetStringScripts', [GetStringScriptFlag, :string, :int, :string, :int], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getsystemdefaultlocalename
        # int GetSystemDefaultLocaleName(_Out_ LPWSTR lpLocaleName, _In_  int    cchLocaleName)
        def self.GetSystemDefaultLocaleName(lpLocaleName, cchLocaleName) end
        attach_function 'GetSystemDefaultLocaleName', [:string, :int], :int


        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getuserdefaultlocalename
        # int GetUserDefaultLocaleName(_Out_ LPWSTR lpLocaleName, _In_  int    cchLocaleName)
        def self.GetUserDefaultLocaleName(lpLocaleName, cchLocaleName) end
        attach_function 'GetUserDefaultLocaleName', [:string, :int], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-idntoascii
        # int IdnToAscii(
        #   _In_      DWORD   dwFlags,
        #   _In_      LPCWSTR lpUnicodeCharStr,
        #   _In_      int     cchUnicodeChar,
        #   _Out_opt_ LPWSTR  lpASCIICharStr,
        #   _In_      int     cchASCIIChar)
        def self.IdnToAscii(dwFlags, lpUnicodeCharStr, cchUnicodeChar, lpASCIICharStr, cchASCIIChar) end
        attach_function 'IdnToAscii', [InternationalDomainNameFlag, :string, :int, :string, :int], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-idntonameprepunicode
        # int IdnToNameprepUnicode(
        #   _In_      DWORD   dwFlags,
        #   _In_      LPCWSTR lpUnicodeCharStr,
        #   _In_      int     cchUnicodeChar,
        #   _Out_opt_ LPWSTR  lpNameprepCharStr,
        #   _In_      int     cchNameprepChar)
        def self.IdnToNameprepUnicode(dwFlags, lpUnicodeCharStr, cchUnicodeChar, lpNameprepCharStr, cchNameprepChar) end
        attach_function 'IdnToNameprepUnicode', [InternationalDomainNameFlag, :string, :int, :string, :int], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-idntounicode
        # int IdnToUnicode(
        #   _In_      DWORD   dwFlags,
        #   _In_      LPCWSTR lpASCIICharStr,
        #   _In_      int     cchASCIIChar,
        #   _Out_opt_ LPWSTR  lpUnicodeCharStr,
        #   _In_      int     cchUnicodeChar)
        def self.IdnToUnicode(dwFlags, lpASCIICharStr, cchASCIIChar, lpUnicodeCharStr, cchUnicodeChar) end
        attach_function 'IdnToUnicode', [InternationalDomainNameFlag, :string, :int, :string, :int], :int

        # https://docs.microsoft.com/en-us/windows/desktop/Intl/iscalendarleapyear
        # BOOL IsCalendarLeapYear( _In_ CALID calId, _In_ UINT  year, _In_ UINT  era)
        def self.IsCalendarLeapYear(calId, year, era) end
        attach_function 'IsCalendarLeapYear', [CalendarId, :uint, :uint], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-isnlsdefinedstring
        # BOOL IsNLSDefinedString(
        #   _In_ NLS_FUNCTION     Function,
        #   _In_ DWORD            dwFlags,
        #   _In_ LPNLSVERSIONINFO lpVersionInformation,
        #   _In_ LPCWSTR          lpString,
        #   _In_ INT              cchStr)
        def self.IsNLSDefinedString(function, dwFlags, lpVersionInformation, lpString, cchStr) end
        attach_function 'IsNLSDefinedString',
                        [SYSNLS_FUNCTION, :dword, NLSVERSIONINFO.ptr(:in), :string, :int], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-isnormalizedstring
        # BOOL IsNormalizedString( _In_ NORM_FORM NormForm, _In_ LPCWSTR   lpString, _In_ int       cwLength)
        def self.IsNormalizedString(normForm, lpString, cwLength) end
        attach_function 'IsNormalizedString', [NORM_FORM, :string, :int], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-isvalidlocalename
        # BOOL IsValidLocaleName(_In_ LPCWSTR lpLocaleName)
        def self.IsValidLocaleName(lpLocaleName) end
        attach_function 'IsValidLocaleName', [:string], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-lcidtolocalename
        # int LCIDToLocaleName( _In_ LCID Locale, _Out_opt_ LPWSTR lpName, _In_ int cchName, _In_ DWORD dwFlags)
        def self.LCIDToLocaleName(locale, lpName, cchName, dwFlags) end
        attach_function 'LCIDToLocaleName', [Locale, :string, Locale, Locale], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-lcmapstringex
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
        def self.LCMapStringEx(lpLocaleName, dwMapFlags, lpSrcStr, cchSrc, lpDestStr, cchDest, lpVersionInformation,
            lpReserved, sortHandle) end
        attach_function 'LCMapStringEx',
                        [:string, :dword, :string, :int, :string, :int, NLSVERSIONINFO.ptr(:in), :pointer, :lparam],
                        :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-localenametolcid
        # LCID LocaleNameToLCID(_In_ LPCWSTR lpName, _In_ DWORD   dwFlags)
        def self.LocaleNameToLCID(lpName, dwFlags) end
        attach_function 'LocaleNameToLCID', [:string, Locale], :lcid

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-normalizestring
        # int NormalizeString(
        #   _In_      NORM_FORM NormForm,
        #   _In_      LPCWSTR   lpSrcString,
        #   _In_      int       cwSrcLength,
        #   _Out_opt_ LPWSTR    lpDstString,
        #   _In_      int       cwDstLength)
        def self.NormalizeString(normForm, lpSrcString, cwSrcLength, lpDstString, cwDstLength) end
        attach_function 'NormalizeString', [NORM_FORM, :string, :int, :string, :int], :int

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-notifyuilanguagechange
        # BOOL WINAPI NotifyUILanguageChange(
        #   _In_      DWORD  dwFlags,
        #   _In_opt_  PCWSTR pcwstrNewLanguage,
        #   _In_opt_  PCWSTR pcwstrPreviousLanguage,
        #   _In_      DWORD  dwReserved,
        #   _Out_opt_ PDWORD pdwStatusRtrn)
        def self.NotifyUILanguageChange(dwFlags, pcwstrNewLanguage, pcwstrPreviousLanguage, dwReserved, pdwStatusRtrn)
        end
        attach_function 'NotifyUILanguageChange', [:dword, :string, :string, :dword, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/Intl/rtlisvalidlocalename
        # BOOL RtlIsValidLocaleName(_In_ LPCWSTR LocaleName, _In_ ULONG   Flags)
        # def self.RtlIsValidLocaleName(localeName, flags) end
        # attach_function 'RtlIsValidLocaleName', [:string, :ulong], :bool TODO

        # https://docs.microsoft.com/en-us/windows/desktop/Intl/updatecalendardayofweek
        # BOOL UpdateCalendarDayOfWeek(_Inout_ LPCALDATETIME lpCalDateTime)
        def self.UpdateCalendarDayOfWeek(lpCalDateTime) end
        attach_function 'UpdateCalendarDayOfWeek', [CALDATETIME.ptr], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-verifyscripts
        # BOOL VerifyScripts(
        #   _In_ DWORD   dwFlags,
        #   _In_ LPCWSTR lpLocaleScripts,
        #   _In_ int     cchLocaleScripts,
        #   _In_ LPCWSTR lpTestScripts,
        #   _In_ int     cchTestScripts)
        def self.VerifyScripts(dwFlags, lpLocaleScripts, cchLocaleScripts, lpTestScripts, cchTestScripts) end
        attach_function 'VerifyScripts', [VerifyScriptsFlag, :string, :int, :string, :int], :bool

        if WINDOWS_VERSION >= 7
          require_relative '../enum/language/search_flag'

          # https://docs.microsoft.com/en-us/windows/desktop/api/libloaderapi/nf-libloaderapi-findstringordinal
          # int FindStringOrdinal(
          #   _In_ DWORD   dwFindStringOrdinalFlags,
          #   _In_ LPCWSTR lpStringSource,
          #   _In_ int     cchSource,
          #   _In_ LPCWSTR lpStringValue,
          #   _In_ int     cchValue,
          #   _In_ BOOL    bIgnoreCase)
          def self.FindStringOrdinal(dwFindStringOrdinalFlags, lpStringSource, cchSource, lpStringValue, cchValue,
              bIgnoreCase) end
          attach_function 'FindStringOrdinal', [SearchFlag, :string, :int, :string, :int, :bool], :int

          # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-resolvelocalename
          # int ResolveLocaleName(
          #   _In_opt_  LPCWSTR lpNameToResolve,
          #   _Out_opt_ LPWSTR  lpLocaleName,
          #   _In_      int     cchLocaleName)
          def self.ResolveLocaleName(lpNameToResolve, lpLocaleName, cchLocaleName) end
          attach_function 'ResolveLocaleName', [:string, :string, :int], :int

          # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-loadstringbyreference
          # BOOL WINAPI LoadStringByReference(
          #   _In_      DWORD  Flags,
          #   _In_opt_  PCWSTR Language,
          #   _In_      PCWSTR SourceString,
          #   _Out_opt_ PWSTR  Buffer,
          #   _In_      ULONG  cchBuffer,
          #   _In_opt_  PCWSTR Directory,
          #   _Out_opt_ PULONG pcchBufferOut)
          # def self.LoadStringByReference(flags, language, sourceString, buffer, cchBuffer, directory, pcchBufferOut)
          # end
          # attach_function 'LoadStringByReference', [:dword, :string, :string, :string, :ulong, :string, :pointer], :bool

          if WINDOWS_VERSION >= 8
            # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-isvalidnlsversion
            # DWORD IsValidNLSVersion(
            #   _In_     NLS_FUNCTION       function,
            #   _In_opt_ LPCWSTR            lpLocaleName,
            #   _In_     LPNLSVERSIONINFOEX lpVersionInformation)
            def self.IsValidNLSVersion(function, lpLocaleName, lpVersionInformation) end
            attach_function 'IsValidNLSVersion', [SYSNLS_FUNCTION, :string, NLSVERSIONINFOEX.ptr(:in)], :dword

            # NTDDI_VERSION >= NTDDI_WIN10_RS3
            if WINDOWS_VERSION >= 10
              # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-setusergeoname
              # BOOL SetUserGeoName(_In_ PWSTR geoName)
              def self.SetUserGeoName(geoName) end
              attach_function 'SetUserGeoName', [:string], :bool

              # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getuserdefaultgeoname
              # int GetUserDefaultGeoName(_Out_writes_z_(geoNameCount) LPWSTR geoName, _In_ int geoNameCount)
              def self.GetUserDefaultGeoName(geoName, geoNameCount) end
              attach_function 'GetUserDefaultGeoName', [:string, :int], :int

              # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getgeoinfoex
              # int GetGeoInfoEx(
              #   _In_ PWSTR       location,
              #   _In_ GEOTYPE     geoType,
              #   _Out_writes_opt_(geoDataCount) PWSTR    geoData,
              #   _In_ int         geoDataCount)
              def self.GetGeoInfoEx(location, geoType, geoData, geoDataCount) end
              attach_function 'GetGeoInfoEx', [:string, SYSGEOTYPE, :string, :int], :int

              # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nc-winnls-geo_enumnameproc
              # BOOL GeoEnumnameproc(PWSTR Arg1, LPARAM Arg2)
              GeoEnumnameproc = callback 'GeoEnumnameproc', [:string, :lparam], :bool

              # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumsystemgeonames
              # BOOL EnumSystemGeoNames(
              #   _In_ GEOCLASS            geoClass,
              #   _In_ GEO_ENUMNAMEPROC    geoEnumProc,
              #   _In_opt_ LPARAM          data)
              def self.EnumSystemGeoNames(geoClass, geoEnumProc, data) end
              attach_function 'EnumSystemGeoNames', [SYSGEOCLASS, GeoEnumnameproc, :lparam], :bool
            end
          end
        end
      end
    end
  end
end
