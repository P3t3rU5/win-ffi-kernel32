require 'win-ffi/kernel32/enum/console/control_key_state'

module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363485(v=vs.85).aspx
      class CONSOLE_READCONSOLE_CONTROL < FFIAdditions::Struct
        layout nLength:                    :ulong,
               nInitialChars:              :ulong,
               dwCtrlWakeupMask:           :ulong,
               dwControlKeyState: ControlKeyState
      end
    end
  end
end