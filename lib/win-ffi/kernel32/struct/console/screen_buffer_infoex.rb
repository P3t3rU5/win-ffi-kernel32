module WinFFI
  if WINDOWS_VERSION >= :vista
    require_relative 'coord'
    require_relative 'small_rect'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/console/console-screen-buffer-infoex
      class CONSOLE_SCREEN_BUFFER_INFOEX < FFIAdditions::Struct
        attr_accessor :cbSize,
                      :dwSize,
                      :dwCursorPosition,
                      :wAttributes,
                      :srWindow,
                      :dwMaximumWindowSize,
                      :wPopupAttributes,
                      :bFullscreenSupported,
                      :ColorTable

        layout cbSize:               :ulong,
               dwSize:               COORD,
               dwCursorPosition:     COORD,
               wAttributes:          :word,
               srWindow:             SMALL_RECT,
               dwMaximumWindowSize:  COORD,
               wPopupAttributes:     :word,
               bFullscreenSupported: :bool,
               ColorTable:           [:colorref, 16]

        def initialize
          super
          self.cbSize = self.size
        end

        private :cbSize=
      end
    end
  end
end