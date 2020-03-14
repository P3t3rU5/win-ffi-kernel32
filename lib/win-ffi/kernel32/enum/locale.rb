module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/Intl/locale-information-constants
    buffer = [
        :NAME_MAX_LENGTH,        85,

        :SYSTEM_DEFAULT,         0x0800,
        :USER_DEFAULT,           0x0400,

        :CUSTOM_DEFAULT,         0x0C00,
        :CUSTOM_UNSPECIFIED,     0x1000,
        :CUSTOM_UI_DEFAULT,      0x1400,
        :NEUTRAL,                0x0000,
        :INVARIANT,              0x007F,

        :TRANSIENT_KEYBOARD1,    0x2000,
        :TRANSIENT_KEYBOARD2,    0x2400,
        :TRANSIENT_KEYBOARD3,    0x2800,
        :TRANSIENT_KEYBOARD4,    0x2c00,

        :UNASSIGNED_LCID,        0x1000,

        :NOUSEROVERRIDE,         0x80000000,
        :USE_CP_ACP,             0x40000000,

        :RETURN_NUMBER,          0x20000000,

        :SLANGUAGE,              0x00000002,
        :SLOCALIZEDDISPLAYNAME,  0x00000002,

        :SENGLANGUAGE,           0x00001001,
        :SENGLISHLANGUAGENAME,   0x00001001,
        :SNATIVELANGNAME,        0x00000004,
        :SNATIVELANGUAGENAME,    0x00000004,

        :SCOUNTRY,               0x00000006,
        :SLOCALIZEDCOUNTRYNAME,  0x00000006,
        :SENGCOUNTRY,            0x00001002,
        :SENGLISHCOUNTRYNAME,    0x00001002,
        :SNATIVECTRYNAME,        0x00000008,
        :SNATIVECOUNTRYNAME,     0x00000008,

        :ICOUNTRY,               0x00000005,
        :IDIALINGCODE,           0x00000005,

        :SLIST,                  0x0000000C,
        :IMEASURE,               0x0000000D,

        :SDECIMAL,               0x0000000E,
        :STHOUSAND,              0x0000000F,
        :SGROUPING,              0x00000010,
        :IDIGITS,                0x00000011,
        :ILZERO,                 0x00000012,
        :INEGNUMBER,             0x00001010,
        :SNATIVEDIGITS,          0x00000013,

        :SCURRENCY,              0x00000014,
        :SINTLSYMBOL,            0x00000015,
        :SMONDECIMALSEP,         0x00000016,
        :SMONTHOUSANDSEP,        0x00000017,
        :SMONGROUPING,           0x00000018,
        :ICURRDIGITS,            0x00000019,
        :ICURRENCY,              0x0000001B,
        :INEGCURR,               0x0000001C,

        :SSHORTDATE,             0x0000001F,
        :SLONGDATE,              0x00000020,
        :STIMEFORMAT,            0x00001003,
        :S1159,                  0x00000028,
        :SAM,                    0x00000028,
        :S2359,                  0x00000029,
        :SPM,                    0x00000029,

        :ICALENDARTYPE,          0x00001009,
        :IOPTIONALCALENDAR,      0x0000100B,
        :IFIRSTDAYOFWEEK,        0x0000100C,
        :IFIRSTWEEKOFYEAR,       0x0000100D,

        :SDAYNAME1,              0x0000002A,
        :SDAYNAME2,              0x0000002B,
        :SDAYNAME3,              0x0000002C,
        :SDAYNAME4,              0x0000002D,
        :SDAYNAME5,              0x0000002E,
        :SDAYNAME6,              0x0000002F,
        :SDAYNAME7,              0x00000030,
        :SABBREVDAYNAME1,        0x00000031,
        :SABBREVDAYNAME2,        0x00000032,
        :SABBREVDAYNAME3,        0x00000033,
        :SABBREVDAYNAME4,        0x00000034,
        :SABBREVDAYNAME5,        0x00000035,
        :SABBREVDAYNAME6,        0x00000036,
        :SABBREVDAYNAME7,        0x00000037,
        :SMONTHNAME1,            0x00000038,
        :SMONTHNAME2,            0x00000039,
        :SMONTHNAME3,            0x0000003A,
        :SMONTHNAME4,            0x0000003B,
        :SMONTHNAME5,            0x0000003C,
        :SMONTHNAME6,            0x0000003D,
        :SMONTHNAME7,            0x0000003E,
        :SMONTHNAME8,            0x0000003F,
        :SMONTHNAME9,            0x00000040,
        :SMONTHNAME10,           0x00000041,
        :SMONTHNAME11,           0x00000042,
        :SMONTHNAME12,           0x00000043,
        :SMONTHNAME13,           0x0000100E,
        :SABBREVMONTHNAME1,      0x00000044,
        :SABBREVMONTHNAME2,      0x00000045,
        :SABBREVMONTHNAME3,      0x00000046,
        :SABBREVMONTHNAME4,      0x00000047,
        :SABBREVMONTHNAME5,      0x00000048,
        :SABBREVMONTHNAME6,      0x00000049,
        :SABBREVMONTHNAME7,      0x0000004A,
        :SABBREVMONTHNAME8,      0x0000004B,
        :SABBREVMONTHNAME9,      0x0000004C,
        :SABBREVMONTHNAME10,     0x0000004D,
        :SABBREVMONTHNAME11,     0x0000004E,
        :SABBREVMONTHNAME12,     0x0000004F,
        :SABBREVMONTHNAME13,     0x0000100F,

        :SPOSITIVESIGN,          0x00000050,
        :SNEGATIVESIGN,          0x00000051,
        :IPOSSIGNPOSN,           0x00000052,
        :INEGSIGNPOSN,           0x00000053,
        :IPOSSYMPRECEDES,        0x00000054,
        :IPOSSEPBYSPACE,         0x00000055,
        :INEGSYMPRECEDES,        0x00000056,
        :INEGSEPBYSPACE,         0x00000057,

        :FONTSIGNATURE,          0x00000058,
        :SISO639LANGNAME,        0x00000059,
        :SISO3166CTRYNAME,       0x0000005A,

        :IPAPERSIZE,             0x0000100A,
        :SENGCURRNAME,           0x00001007,
        :SNATIVECURRNAME,        0x00001008,
        :SYEARMONTH,             0x00001006,
        :SSORTNAME,              0x00001013,
        :IDIGITSUBSTITUTION,     0x00001014,

        :IDEFAULTCODEPAGE,       0x0000000B,
        :IDEFAULTANSICODEPAGE,   0x00001004,
        :IDEFAULTMACCODEPAGE,    0x00001011,

        :IDEFAULTEBCDICCODEPAGE, 0x00001012,

        :ILANGUAGE,              0x00000001,
        :SABBREVLANGNAME,        0x00000003,
        :SABBREVCTRYNAME,        0x00000007,
        :IGEOID,                 0x0000005B,
        :IDEFAULTLANGUAGE,       0x00000009,
        :IDEFAULTCOUNTRY,        0x0000000A,
        :IINTLCURRDIGITS,        0x0000001A,

        :SDATE,                  0x0000001D,
        :STIME,                  0x0000001E,
        :IDATE,                  0x00000021,
        :ILDATE,                 0x00000022,
        :ITIME,                  0x00000023,
        :ITIMEMARKPOSN,          0x00001005,
        :ICENTURY,               0x00000024,
        :ITLZERO,                0x00000025,
        :IDAYLZERO,              0x00000026,
        :IMONLZERO,              0x00000027,
    ]

    if WINDOWS_VERSION >= :vista
      buffer += [
          :ALL,                    0,
          :WINDOWS,                0x00000001,
          :SUPPLEMENTAL,           0x00000002,
          :ALTERNATE_SORTS,        0x00000004,
          :REPLACEMENT,            0x00000008,

          :SLOCALIZEDLANGUAGENAME, 0x0000006f,
          :SLANGDISPLAYNAME,       0x0000006f,

          :SNAME,                  0x0000005c,
          :SDURATION,              0x0000005d,
          :SSHORTESTDAYNAME1,      0x00000060,
          :SSHORTESTDAYNAME2,      0x00000061,
          :SSHORTESTDAYNAME3,      0x00000062,
          :SSHORTESTDAYNAME4,      0x00000063,
          :SSHORTESTDAYNAME5,      0x00000064,
          :SSHORTESTDAYNAME6,      0x00000065,
          :SSHORTESTDAYNAME7,      0x00000066,
          :SISO639LANGNAME2,       0x00000067,
          :SISO3166CTRYNAME2,      0x00000068,
          :SNAN,                   0x00000069,
          :SPOSINFINITY,           0x0000006a,
          :SNEGINFINITY,           0x0000006b,
          :SSCRIPTS,               0x0000006c,
          :SPARENT,                0x0000006d,
          :SCONSOLEFALLBACKNAME,   0x0000006e,

          :SKEYBOARDSTOINSTALL,    0x0000005e,
      ]
      if WINDOWS_VERSION >= 7
        buffer += [
            :NEUTRALDATA,           0x00000010,
            :SPECIFICDATA,          0x00000020,

            :RETURN_GENITIVE_NAMES, 0x10000000,
            :ALLOW_NEUTRAL_NAMES,   0x08000000,

            :SENGLISHDISPLAYNAME,   0x00000072,
            :SNATIVEDISPLAYNAME,    0x00000073,

            :IREADINGLAYOUT,        0x00000070,

            :INEUTRAL,              0x00000071,
            :INEGATIVEPERCENT,      0x00000074,
            :IPOSITIVEPERCENT,      0x00000075,
            :SPERCENT,              0x00000076,
            :SPERMILLE,             0x00000077,
            :SMONTHDAY,             0x00000078,
            :SSHORTTIME,            0x00000079,
            :SOPENTYPELANGUAGETAG,  0x0000007a,
            :SSORTLOCALE,           0x0000007b,
        ]

        if WINDOWS_VERSION >= 8
          buffer += [:SRELATIVELONGDATE, 0x0000007c]
          buffer += [:SSHORTESTAM, 0x0000007e, :SSHORTESTPM, 0x0000007f] if WINDOWS_VERSION >= 10
        end
      end
    end

    Locale = enum :locale, buffer

    define_prefix(:LOCALE, Locale)
  end
end