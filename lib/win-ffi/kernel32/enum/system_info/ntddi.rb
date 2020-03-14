require 'win-ffi/kernel32'

module WinFFI
  # NTDDI version constants
  NTDDI = enum :ntddi, [
      :WIN2K,        0x05000000,
      :WIN2KSP1,     0x05000100,
      :WIN2KSP2,     0x05000200,
      :WIN2KSP3,     0x05000300,
      :WIN2KSP4,     0x05000400,

      :WINXP,        0x05010000,
      :WINXPSP1,     0x05010100,
      :WINXPSP2,     0x05010200,
      :WINXPSP3,     0x05010300,
      :WINXPSP4,     0x05010400,

      :WS03,         0x05020000,
      :WS03SP1,      0x05020100,
      :WS03SP2,      0x05020200,
      :WS03SP3,      0x05020300,
      :WS03SP4,      0x05020400,

      :WIN6,         0x06000000,
      :WIN6SP1,      0x06000100,
      :WIN6SP2,      0x06000200,
      :WIN6SP3,      0x06000300,
      :WIN6SP4,      0x06000400,

      :VISTA,        0x06000000,
      :VISTASP1,     0x06000100,
      :VISTASP2,     0x06000200,
      :VISTASP3,     0x06000300,
      :VISTASP4,     0x06000400,

      :LONGHORN,     0x06000000,

      :WS08,         0x06000100,
      :WS08SP2,      0x06000200,
      :WS08SP3,      0x06000300,
      :WS08SP4,      0x06000400,

      :WIN7,         0x06010000,
      :WIN8,         0x06020000,
      :WINBLUE,      0x06030000,
      :WINTHRESHOLD, 0x0A000000,
      :WIN10,        0x0A000000,
      :WIN10_TH2,    0x0A000001,
      :WIN10_RS1,    0x0A000002,
      :WIN10_RS2,    0x0A000003,
      :WIN10_RS3,    0x0A000004,
      :WIN10_RS4,    0x0A000005
  ]

  define_prefix(:NTDDI, NTDDI)
end