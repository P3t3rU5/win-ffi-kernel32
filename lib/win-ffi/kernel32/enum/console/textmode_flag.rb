module WinFFI
  module Kernel32
    ConsoleTextmodeFlag = enum :console_textmode_flag, [:BUFFER, 1]

    define_prefix(:CONSOLE_TEXTMODE, ConsoleTextmodeFlag)
  end
end