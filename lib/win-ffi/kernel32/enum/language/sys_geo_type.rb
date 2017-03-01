require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # GEO information types for clients to query
      SYSGEOTYPE = enum :sys_geo_type, [
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
          :PARENT,            0x000D
      ]

      define_prefix(:GEO, SYSGEOTYPE)
    end
  end
end