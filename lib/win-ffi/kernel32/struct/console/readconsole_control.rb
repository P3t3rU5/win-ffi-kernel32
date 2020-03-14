require_relative '../../enum/console/control_key_state'

module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/console/console-readconsole-control
      class CONSOLE_READCONSOLE_CONTROL < FFIAdditions::Struct
        attr_accessor :nLength, :nInitialChars, :dwCtrlWakeupMask, :dwControlKeyState

        layout nLength:           :ulong,
               nInitialChars:     :ulong,
               dwCtrlWakeupMask:  :ulong,
               dwControlKeyState: ControlKeyState
      end
    end
  end
end