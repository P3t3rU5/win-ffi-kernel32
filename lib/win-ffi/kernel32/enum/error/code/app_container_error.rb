module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== app container Specific Error Codes 4250 to 4299 ===#
        # MessageId: ERROR_NOT_APPCONTAINER
        # MessageText:
        # This operation is only valid in the context of an app container.
        :NOT_APPCONTAINER, 4250,
        # MessageId: ERROR_APPCONTAINER_REQUIRED
        # MessageText:
        # This application can only run in the context of an app container.
        :APPCONTAINER_REQUIRED, 4251,
        # MessageId: ERROR_NOT_SUPPORTED_IN_APPCONTAINER
        # MessageText:
        # This functionality is not supported in the context of an app container.
        :NOT_SUPPORTED_IN_APPCONTAINER, 4252,
        # MessageId: ERROR_INVALID_PACKAGE_SID_LENGTH
        # MessageText:
        # The length of the SID supplied is not a valid length for app container SIDs.
        :INVALID_PACKAGE_SID_LENGTH, 4253,
    )

    remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end