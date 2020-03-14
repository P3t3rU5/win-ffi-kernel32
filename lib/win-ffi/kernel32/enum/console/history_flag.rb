module WinFFI
  module Kernel32
    HistoryFlag = enum :history_flag, [:NO_DUP_FLAG, 0x1]

    define_prefix(:HISTORY, HistoryFlag)
  end
end