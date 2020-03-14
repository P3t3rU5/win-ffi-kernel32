require_relative 'coord'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/console/window-buffer-size-record-str
    class WINDOW_BUFFER_SIZE_RECORD < FFIAdditions::Struct
      attr_accessor :dwSize

      layout dwSize: COORD
    end
  end
end