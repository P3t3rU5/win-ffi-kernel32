require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    Month = enum :month, [
        :January, 1,
        :February,
        :March,
        :April,
        :May,
        :June,
        :July,
        :August,
        :September,
        :October,
        :November,
        :December
    ]
  end
end