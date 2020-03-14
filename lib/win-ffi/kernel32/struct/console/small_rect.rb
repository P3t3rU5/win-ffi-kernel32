module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/console/small-rect-str
    class SMALL_RECT < FFIAdditions::Struct
      attr_accessor :Left, :Top, :Right, :Bottom

      layout Left:   :short,
             Top:    :short,
             Right:  :short,
             Bottom: :short
    end
  end
end