require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    DEPSystemPolicyType = enum :dep_system_policy_type, [
        :DEPPolicyAlwaysOff, 0,
        :DEPPolicyAlwaysOn,
        :DEPPolicyOptIn,
        :DEPPolicyOptOut,
        :DEPTotalPolicyCount
    ]
  end
end