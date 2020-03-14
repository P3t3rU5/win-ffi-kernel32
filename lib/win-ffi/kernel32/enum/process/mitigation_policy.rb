module WinFFI
  module Kernel32
    ProcessMitigationPolicy = enum :process_mitigation_policy, [
        :ProcessDEPPolicy,
        :ProcessASLRPolicy,
        :ProcessDynamicCodePolicy,
        :ProcessStrictHandleCheckPolicy,
        :ProcessSystemCallDisablePolicy,
        :ProcessMitigationOptionsMask,
        :ProcessExtensionPointDisablePolicy,
        :ProcessReserved1Policy,
        :ProcessSignaturePolicy,
        :ProcessFontDisablePolicy,
        :MaxProcessMitigationPolicy
    ]
  end
end