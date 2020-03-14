require_relative 'coord'
require_relative 'small_rect'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/console/console-screen-buffer-info-str
    class CONSOLE_SCREEN_BUFFER_INFO < FFIAdditions::Struct
      attr_accessor :dwSize,
                    :dwCursorPosition,
                    :wAttributes,
                    :srWindow,
                    :dwMaximumWindowSize

      layout dwSize:              COORD,
             dwCursorPosition:    COORD,
             wAttributes:         :word,
             srWindow:            SMALL_RECT,
             dwMaximumWindowSize: COORD

      def initialize
        super
        self.dwSize = self.size
      end

      private :dwSize=
    end
  end
end