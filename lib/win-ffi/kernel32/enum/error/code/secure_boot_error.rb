module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== SecureBoot Error codes 4420 to 4439 ===#
        # MessageId: ERROR_SECUREBOOT_ROLLBACK_DETECTED
        # MessageText:
        # Secure Boot detected that rollback of protected data has been attempted.
        :SECUREBOOT_ROLLBACK_DETECTED, 4420,
        # MessageId: ERROR_SECUREBOOT_POLICY_VIOLATION
        # MessageText:
        # The value is protected by Secure Boot policy and cannot be modified or deleted.
        :SECUREBOOT_POLICY_VIOLATION, 4421,
        # MessageId: ERROR_SECUREBOOT_INVALID_POLICY
        # MessageText:
        # The Secure Boot policy is invalid.
        :SECUREBOOT_INVALID_POLICY, 4422,
        # MessageId: ERROR_SECUREBOOT_POLICY_PUBLISHER_NOT_FOUND
        # MessageText:
        # A new Secure Boot policy did not contain the current publisher on its update list.
        :SECUREBOOT_POLICY_PUBLISHER_NOT_FOUND, 4423,
        # MessageId: ERROR_SECUREBOOT_POLICY_NOT_SIGNED
        # MessageText:
        # The Secure Boot policy is either not signed or is signed by a non-trusted signer.
        :SECUREBOOT_POLICY_NOT_SIGNED, 4424,
        # MessageId: ERROR_SECUREBOOT_NOT_ENABLED
        # MessageText:
        # Secure Boot is not enabled on this machine.
        :SECUREBOOT_NOT_ENABLED, 4425,
        # MessageId: ERROR_SECUREBOOT_FILE_REPLACED
        # MessageText:
        # Secure Boot requires that certain files and drivers are not replaced by other files or drivers.
        :SECUREBOOT_FILE_REPLACED, 4426,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end