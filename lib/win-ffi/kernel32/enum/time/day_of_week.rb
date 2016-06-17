require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    DayOfWeek = enum :day_of_week, [
        :Sunday,
        :Monday,
        :Tuesday,
        :Wednesday,
        :Thursday,
        :Friday,
        :Saturday
    ]
  end
end