require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # GEO information types for clients to query
      buffer = [
          :NATION,            0x0001,
          :LATITUDE,          0x0002,
          :LONGITUDE,         0x0003,
          :ISO2,              0x0004,
          :ISO3,              0x0005,
          :RFC1766,           0x0006,
          :LCID,              0x0007,
          :FRIENDLYNAME,      0x0008,
          :OFFICIALNAME,      0x0009,
          :TIMEZONES,         0x000A,
          :OFFICIALLANGUAGES, 0x000B,
          :ISO_UN_NUMBER,     0x000C,
          :PARENT,            0x000D,
          :DIALINGCODE,       0x000E,
          :CURRENCYCODE,      0x000F,
          :CURRENCYSYMBOL,    0x0010,
      ]

      # NTDDI_VERSION >= NTDDI_WIN10_RS3
      buffer += [:NAME, 0x0011, :ID, 0x0012] if WINDOWS_VERSION >= 10

      SYSGEOTYPE = enum :sys_geo_type, buffer

      define_prefix(:GEO, SYSGEOTYPE)
    end
  end
end