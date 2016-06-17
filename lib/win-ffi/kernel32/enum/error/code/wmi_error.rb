module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== WMI Error codes 4200 to 4249 ===#
        # MessageId: ERROR_WMI_GUID_NOT_FOUND
        # MessageText:
        # The GUID passed was not recognized as valid by a WMI data provider.
        :WMI_GUID_NOT_FOUND, 4200,
        # MessageId: ERROR_WMI_INSTANCE_NOT_FOUND
        # MessageText:
        # The instance name passed was not recognized as valid by a WMI data provider.
        :WMI_INSTANCE_NOT_FOUND, 4201,
        # MessageId: ERROR_WMI_ITEMID_NOT_FOUND
        # MessageText:
        # The data item ID passed was not recognized as valid by a WMI data provider.
        :WMI_ITEMID_NOT_FOUND, 4202,
        # MessageId: ERROR_WMI_TRY_AGAIN
        # MessageText:
        # The WMI request could not be completed and should be retried.
        :WMI_TRY_AGAIN, 4203,
        # MessageId: ERROR_WMI_DP_NOT_FOUND
        # MessageText:
        # The WMI data provider could not be located.
        :WMI_DP_NOT_FOUND, 4204,
        # MessageId: ERROR_WMI_UNRESOLVED_INSTANCE_REF
        # MessageText:
        # The WMI data provider references an instance set that has not been registered.
        :WMI_UNRESOLVED_INSTANCE_REF, 4205,
        # MessageId: ERROR_WMI_ALREADY_ENABLED
        # MessageText:
        # The WMI data block or event notification has already been enabled.
        :WMI_ALREADY_ENABLED, 4206,
        # MessageId: ERROR_WMI_GUID_DISCONNECTED
        # MessageText:
        # The WMI data block is no longer available.
        :WMI_GUID_DISCONNECTED, 4207,
        # MessageId: ERROR_WMI_SERVER_UNAVAILABLE
        # MessageText:
        # The WMI data service is not available.
        :WMI_SERVER_UNAVAILABLE, 4208,
        # MessageId: ERROR_WMI_DP_FAILED
        # MessageText:
        # The WMI data provider failed to carry out the request.
        :WMI_DP_FAILED, 4209,
        # MessageId: ERROR_WMI_INVALID_MOF
        # MessageText:
        # The WMI MOF information is not valid.
        :WMI_INVALID_MOF, 4210,
        # MessageId: ERROR_WMI_INVALID_REGINFO
        # MessageText:
        # The WMI registration information is not valid.
        :WMI_INVALID_REGINFO, 4211,
        # MessageId: ERROR_WMI_ALREADY_DISABLED
        # MessageText:
        # The WMI data block or event notification has already been disabled.
        :WMI_ALREADY_DISABLED, 4212,
        # MessageId: ERROR_WMI_READ_ONLY
        # MessageText:
        # The WMI data item or data block is read only.
        :WMI_READ_ONLY, 4213,
        # MessageId: ERROR_WMI_SET_FAILURE
        # MessageText:
        # The WMI data item or data block could not be changed.
        :WMI_SET_FAILURE, 4214,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end