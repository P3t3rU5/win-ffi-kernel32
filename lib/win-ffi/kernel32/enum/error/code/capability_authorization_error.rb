require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Capability Authorization Error codes 0450 to 0460 ===#
        # MessageId: ERROR_CAPAUTHZ_NOT_DEVUNLOCKED
        # MessageText:
        # Neither developer unlocked mode nor side loading mode is enabled on the device.
        :CAPAUTHZ_NOT_DEVUNLOCKED, 450,
        # MessageId: ERROR_CAPAUTHZ_CHANGE_TYPE
        # MessageText:
        # Can not change application type during upgrade or re-provision.
        :CAPAUTHZ_CHANGE_TYPE, 451,
        # MessageId: ERROR_CAPAUTHZ_NOT_PROVISIONED
        # MessageText:
        # The application has not been provisioned.
        :CAPAUTHZ_NOT_PROVISIONED, 452,
        # MessageId: ERROR_CAPAUTHZ_NOT_AUTHORIZED
        # MessageText:
        # The requested capability can not be authorized for this application.
        :CAPAUTHZ_NOT_AUTHORIZED, 453,
        # MessageId: ERROR_CAPAUTHZ_NO_POLICY
        # MessageText:
        # There is no capability authorization policy on the device.
        :CAPAUTHZ_NO_POLICY, 454,
        # MessageId: ERROR_CAPAUTHZ_DB_CORRUPTED
        # MessageText:
        # The capability authorization database has been corrupted.
        :CAPAUTHZ_DB_CORRUPTED, 455,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end
