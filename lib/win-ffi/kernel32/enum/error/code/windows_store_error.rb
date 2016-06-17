module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Windows Store Codes 15861-15880===#
        # MessageId: STORE_ERROR_UNLICENSED
        # MessageText:
        # This PC does not have a valid license for the application or product.
        :STORE_ERROR_UNLICENSED, 15861,
        # MessageId: STORE_ERROR_UNLICENSED_USER
        # MessageText:
        # The authenticated user does not have a valid license for the application or product.
        :STORE_ERROR_UNLICENSED_USER, 15862,
        # MessageId: STORE_ERROR_PENDING_COM_TRANSACTION
        # MessageText:
        # The commerce transaction associated with this license is still pending verification.
        :STORE_ERROR_PENDING_COM_TRANSACTION, 15863,
        # MessageId: STORE_ERROR_LICENSE_REVOKED
        # MessageText:
        # The license has been revoked for this user.
        :STORE_ERROR_LICENSE_REVOKED, 15864,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end