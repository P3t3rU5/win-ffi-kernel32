module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/console/coord-str
    class COORD < FFIAdditions::Struct
      attr_accessor :X, :Y

      layout X: :short,
             Y: :short
    end
  end
end