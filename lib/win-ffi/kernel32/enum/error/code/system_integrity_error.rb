module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== System Integrity Error codes 4550 to 4559 ===#
        # MessageId: ERROR_SYSTEM_INTEGRITY_ROLLBACK_DETECTED
        # MessageText:
        # System Integrity detected that policy rollback has been attempted.
        :SYSTEM_INTEGRITY_ROLLBACK_DETECTED, 4550,
        # MessageId: ERROR_SYSTEM_INTEGRITY_POLICY_VIOLATION
        # MessageText:
        # This program was blocked by Device Guard because it violates the code integrity policy installed on this
        # system.
        :SYSTEM_INTEGRITY_POLICY_VIOLATION, 4551,
        # MessageId: ERROR_SYSTEM_INTEGRITY_INVALID_POLICY
        # MessageText:
        # The System Integrity policy is invalid.
        :SYSTEM_INTEGRITY_INVALID_POLICY, 4552,
        # MessageId: ERROR_SYSTEM_INTEGRITY_POLICY_NOT_SIGNED
        # MessageText:
        # The System Integrity policy is either not signed or is signed by a non-trusted signer.
        :SYSTEM_INTEGRITY_POLICY_NOT_SIGNED, 4553,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end