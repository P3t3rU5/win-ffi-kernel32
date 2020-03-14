module WinFFI
  module Kernel32
    ConditionVariable = enum :condition_variable, [:LOCKMODE_SHARED, 0x1]

    define_prefix(:CONDITION_VARIABLE, ConditionVariable)
  end
end