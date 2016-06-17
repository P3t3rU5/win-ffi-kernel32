module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Fast Cache Specific Error Codes 4400 to 4419 ===#
        # MessageId: ERROR_APP_DATA_NOT_FOUND
        # MessageText:
        # Fast Cache data not found.
        :APP_DATA_NOT_FOUND, 4400,
        # MessageId: ERROR_APP_DATA_EXPIRED
        # MessageText:
        # Fast Cache data expired.
        :APP_DATA_EXPIRED, 4401,
        # MessageId: ERROR_APP_DATA_CORRUPT
        # MessageText:
        # Fast Cache data corrupt.
        :APP_DATA_CORRUPT, 4402,
        # MessageId: ERROR_APP_DATA_LIMIT_EXCEEDED
        # MessageText:
        # Fast Cache data has exceeded its max size and cannot be updated.
        :APP_DATA_LIMIT_EXCEEDED, 4403,
        # MessageId: ERROR_APP_DATA_REBOOT_REQUIRED
        # MessageText:
        # Fast Cache has been ReArmed and requires a reboot until it can be updated.
        :APP_DATA_REBOOT_REQUIRED, 4404,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end