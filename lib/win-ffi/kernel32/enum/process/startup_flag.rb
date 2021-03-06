require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Dual Mode API below this line. Dual Mode Structures also included.
    buffer = [
        :USESHOWWINDOW,    0x00000001,
        :USESIZE,          0x00000002,
        :USEPOSITION,      0x00000004,
        :USECOUNTCHARS,    0x00000008,
        :USEFILLATTRIBUTE, 0x00000010,
        :RUNFULLSCREEN,    0x00000020, # ignored for non-x86 platforms
        :FORCEONFEEDBACK,  0x00000040,
        :FORCEOFFFEEDBACK, 0x00000080,
        :USESTDHANDLES,    0x00000100,
        :USEHOTKEY,        0x00000200,
        :TITLEISLINKNAME,  0x00000800,
        :TITLEISAPPID,     0x00001000,
        :PREVENTPINNING,   0x00002000,
    ]

    if WINDOWS_VERSION >= :vista
      buffer += [:UNTRUSTEDSOURCE, 0x00008000]
    end

    StartupFlag = enum :startup_flag, buffer
  end
end