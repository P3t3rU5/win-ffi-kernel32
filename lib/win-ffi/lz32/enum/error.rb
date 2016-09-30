require 'win-ffi/lz32'

module WinFFI
  module Lz32
    Error = enum :error, [
        :BADINHANDLE,  (-1),
        :BADOUTHANDLE, (-2),
        :READ,         (-3),
        :WRITE,        (-4),
        :GLOBALLOC,    (-5),
        :GLOBLOCK,     (-6),
        :BADVALUE,     (-7),
        :UNKNOWNALG,   (-8),
    ]

    define_prefix(:LZERROR, Error)
  end
end