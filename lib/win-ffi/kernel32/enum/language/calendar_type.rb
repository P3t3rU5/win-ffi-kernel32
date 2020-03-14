module WinFFI
  module Kernel32
    buffer = [
        :NOUSEROVERRIDE,        0x80000000,
        :USE_CP_ACP,            0x40000000,
        :RETURN_NUMBER,         0x20000000,

        :ICALINTVALUE,          0x00000001,
        :SCALNAME,              0x00000002,
        :IYEAROFFSETRANGE,      0x00000003,
        :SERASTRING,            0x00000004,
        :SSHORTDATE,            0x00000005,
        :SLONGDATE,             0x00000006,
        :SDAYNAME1,             0x00000007,
        :SDAYNAME2,             0x00000008,
        :SDAYNAME3,             0x00000009,
        :SDAYNAME4,             0x0000000a,
        :SDAYNAME5,             0x0000000b,
        :SDAYNAME6,             0x0000000c,
        :SDAYNAME7,             0x0000000d,
        :SABBREVDAYNAME1,       0x0000000e,
        :SABBREVDAYNAME2,       0x0000000f,
        :SABBREVDAYNAME3,       0x00000010,
        :SABBREVDAYNAME4,       0x00000011,
        :SABBREVDAYNAME5,       0x00000012,
        :SABBREVDAYNAME6,       0x00000013,
        :SABBREVDAYNAME7,       0x00000014,

        :SMONTHNAME1,           0x00000015,
        :SMONTHNAME2,           0x00000016,
        :SMONTHNAME3,           0x00000017,
        :SMONTHNAME4,           0x00000018,
        :SMONTHNAME5,           0x00000019,
        :SMONTHNAME6,           0x0000001a,
        :SMONTHNAME7,           0x0000001b,
        :SMONTHNAME8,           0x0000001c,
        :SMONTHNAME9,           0x0000001d,
        :SMONTHNAME10,          0x0000001e,
        :SMONTHNAME11,          0x0000001f,
        :SMONTHNAME12,          0x00000020,
        :SMONTHNAME13,          0x00000021,
        :SABBREVMONTHNAME1,     0x00000022,
        :SABBREVMONTHNAME2,     0x00000023,
        :SABBREVMONTHNAME3,     0x00000024,
        :SABBREVMONTHNAME4,     0x00000025,
        :SABBREVMONTHNAME5,     0x00000026,
        :SABBREVMONTHNAME6,     0x00000027,
        :SABBREVMONTHNAME7,     0x00000028,
        :SABBREVMONTHNAME8,     0x00000029,
        :SABBREVMONTHNAME9,     0x0000002a,
        :SABBREVMONTHNAME10,    0x0000002b,
        :SABBREVMONTHNAME11,    0x0000002c,
        :SABBREVMONTHNAME12,    0x0000002d,
        :SABBREVMONTHNAME13,    0x0000002e,

        :SYEARMONTH,            0x0000002f,
        :ITWODIGITYEARMAX,      0x00000030
    ]

    if WINDOWS_VERSION >= :vista
      buffer += [
          :SSHORTESTDAYNAME1,   0x00000031,
          :SSHORTESTDAYNAME2,   0x00000032,
          :SSHORTESTDAYNAME3,   0x00000033,
          :SSHORTESTDAYNAME4,   0x00000034,
          :SSHORTESTDAYNAME5,   0x00000035,
          :SSHORTESTDAYNAME6,   0x00000036,
          :SSHORTESTDAYNAME7,   0x00000037,
      ]

      if WINDOWS_VERSION >= 7
        buffer += [
            :RETURN_GENITIVE_NAMES, 0x10000000,

            :SMONTHDAY, 0x00000038,
            :SABBREVERASTRING, 0x00000039,
        ]
        if WINDOWS_VERSION >= 8
          buffer += [:SRELATIVELONGDATE, 0x0000003a]
          # NTDDI_VERSION >= NTDDI_WIN10_RS2
          buffer += [:SENGLISHERANAME, 0x0000003b, :SENGLISHABBREVERANAME, 0x0000003c] if WINDOWS_VERSION >= 10
        end
      end
    end

    CalendarType = enum :calendar_type, buffer

    define_prefix(:CAL, CalendarType)
  end
end