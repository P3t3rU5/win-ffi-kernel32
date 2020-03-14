module WinFFI
  module Kernel32
    ConsoleDisplayMode = enum :console_display_mode, [:FULLSCREEN_MODE, 1, :WINDOWED_MODE, 2]

    define_prefix(:CONSOLE, ConsoleDisplayMode)
  end
end