module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Winnet32 Error codes  2100 to 2999 ===#
        # The range 2100 through 2999 is reserved for network status codes. See lmerr.h for a complete listing
        # MessageId: ERROR_CONNECTED_OTHER_PASSWORD
        # MessageText:
        # The network connection was made successfully, but the user had to be prompted for a password other than the one originally specified.
        :CONNECTED_OTHER_PASSWORD, 2108,
        # MessageId: ERROR_CONNECTED_OTHER_PASSWORD_DEFAULT
        # MessageText:
        # The network connection was made successfully using default credentials.
        :CONNECTED_OTHER_PASSWORD_DEFAULT, 2109,
        # MessageId: ERROR_BAD_USERNAME
        # MessageText:
        # The specified username is invalid.
        :BAD_USERNAME, 2202,
        # MessageId: ERROR_NOT_CONNECTED
        # MessageText:
        # This network connection does not exist.
        :NOT_CONNECTED, 2250,
        # MessageId: ERROR_OPEN_FILES
        # MessageText:
        # This network connection has files open or requests pending.
        :OPEN_FILES, 2401,
        # MessageId: ERROR_ACTIVE_CONNECTIONS
        # MessageText:
        # Active connections still exist.
        :ACTIVE_CONNECTIONS, 2402,
        # MessageId: ERROR_DEVICE_IN_USE
        # MessageText:
        # The device is in use by an active process and cannot be disconnected.
        :DEVICE_IN_USE, 2404,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end