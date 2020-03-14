module WinFFI
  module Kernel32
    UmsSchedulerReason = enum :ums_scheduler_reason, [:Startup, 0, :ThreadBlocked, :ThreadYield]
  end
end