module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== AppModel Error Codes 15700-15720 ===#
        # MessageId: APPMODEL_ERROR_NO_PACKAGE
        # MessageText:
        # The process has no package identity.
        :APPMODEL_ERROR_NO_PACKAGE, 15700,
        # MessageId: APPMODEL_ERROR_PACKAGE_RUNTIME_CORRUPT
        # MessageText:
        # The package runtime information is corrupted.
        :APPMODEL_ERROR_PACKAGE_RUNTIME_CORRUPT, 15701,
        # MessageId: APPMODEL_ERROR_PACKAGE_IDENTITY_CORRUPT
        # MessageText:
        # The package identity is corrupted.
        :APPMODEL_ERROR_PACKAGE_IDENTITY_CORRUPT, 15702,
        # MessageId: APPMODEL_ERROR_NO_APPLICATION
        # MessageText:
        # The process has no application identity.
        :APPMODEL_ERROR_NO_APPLICATION, 15703,
        # MessageId: APPMODEL_ERROR_DYNAMIC_PROPERTY_READ_FAILED
        # MessageText:
        # One or more AppModel Runtime group policy values could not be read. Please contact your system administrator
        # with the contents of your AppModel Runtime event log.
        :APPMODEL_ERROR_DYNAMIC_PROPERTY_READ_FAILED, 15704,
        # MessageId: APPMODEL_ERROR_DYNAMIC_PROPERTY_INVALID
        # MessageText:
        # One or more AppModel Runtime group policy values are invalid. Please contact your system administrator with
        # the contents of your AppModel Runtime event log.
        :APPMODEL_ERROR_DYNAMIC_PROPERTY_INVALID, 15705,
        # MessageId: APPMODEL_ERROR_PACKAGE_NOT_AVAILABLE
        # MessageText:
        # The package is currently not available.
        :APPMODEL_ERROR_PACKAGE_NOT_AVAILABLE, 15706,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end