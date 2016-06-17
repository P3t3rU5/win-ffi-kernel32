module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== PeerDist Error codes 4050 to 4099 ===#
        # MessageId: PEERDIST_ERROR_CONTENTINFO_VERSION_UNSUPPORTED
        # MessageText:
        # The version of the supplied content information is not supported.
        :PEERDIST_ERROR_CONTENTINFO_VERSION_UNSUPPORTED, 4050,
        # MessageId: PEERDIST_ERROR_CANNOT_PARSE_CONTENTINFO
        # MessageText:
        # The supplied content information is malformed.
        :PEERDIST_ERROR_CANNOT_PARSE_CONTENTINFO, 4051,
        # MessageId: PEERDIST_ERROR_MISSING_DATA
        # MessageText:
        # The requested data cannot be found in local or peer caches.
        :PEERDIST_ERROR_MISSING_DATA, 4052,
        # MessageId: PEERDIST_ERROR_NO_MORE
        # MessageText:
        # No more data is available or required.
        :PEERDIST_ERROR_NO_MORE, 4053,
        # MessageId: PEERDIST_ERROR_NOT_INITIALIZED
        # MessageText:
        # The supplied object has not been initialized.
        :PEERDIST_ERROR_NOT_INITIALIZED, 4054,
        # MessageId: PEERDIST_ERROR_ALREADY_INITIALIZED
        # MessageText:
        # The supplied object has already been initialized.
        :PEERDIST_ERROR_ALREADY_INITIALIZED, 4055,
        # MessageId: PEERDIST_ERROR_SHUTDOWN_IN_PROGRESS
        # MessageText:
        # A shutdown operation is already in progress.
        :PEERDIST_ERROR_SHUTDOWN_IN_PROGRESS, 4056,
        # MessageId: PEERDIST_ERROR_INVALIDATED
        # MessageText:
        # The supplied object has already been invalidated.
        :PEERDIST_ERROR_INVALIDATED, 4057,
        # MessageId: PEERDIST_ERROR_ALREADY_EXISTS
        # MessageText:
        # An element already exists and was not replaced.
        :PEERDIST_ERROR_ALREADY_EXISTS, 4058,
        # MessageId: PEERDIST_ERROR_OPERATION_NOTFOUND
        # MessageText:
        # Can not cancel the requested operation as it has already been completed.
        :PEERDIST_ERROR_OPERATION_NOTFOUND, 4059,
        # MessageId: PEERDIST_ERROR_ALREADY_COMPLETED
        # MessageText:
        # Can not perform the reqested operation because it has already been carried out.
        :PEERDIST_ERROR_ALREADY_COMPLETED, 4060,
        # MessageId: PEERDIST_ERROR_OUT_OF_BOUNDS
        # MessageText:
        # An operation accessed data beyond the bounds of valid data.
        :PEERDIST_ERROR_OUT_OF_BOUNDS, 4061,
        # MessageId: PEERDIST_ERROR_VERSION_UNSUPPORTED
        # MessageText:
        # The requested version is not supported.
        :PEERDIST_ERROR_VERSION_UNSUPPORTED, 4062,
        # MessageId: PEERDIST_ERROR_INVALID_CONFIGURATION
        # MessageText:
        # A configuration value is invalid.
        :PEERDIST_ERROR_INVALID_CONFIGURATION, 4063,
        # MessageId: PEERDIST_ERROR_NOT_LICENSED
        # MessageText:
        # The SKU is not licensed.
        :PEERDIST_ERROR_NOT_LICENSED, 4064,
        # MessageId: PEERDIST_ERROR_SERVICE_UNAVAILABLE
        # MessageText:
        # PeerDist Service is still initializing and will be available shortly.
        :PEERDIST_ERROR_SERVICE_UNAVAILABLE, 4065,
        # MessageId: PEERDIST_ERROR_TRUST_FAILURE
        # MessageText:
        # Communication with one or more computers will be temporarily blocked due to recent errors.
        :PEERDIST_ERROR_TRUST_FAILURE,     4066,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end