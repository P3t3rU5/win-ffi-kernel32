module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Start of Monitor Configuration API error codes 15200 to 15249 ===#
        # MessageId: ERROR_MCA_INVALID_CAPABILITIES_STRING
        # MessageText:
        # The monitor returned a DDC/CI capabilities string that did not comply with the ACCESS.bus 3.0, DDC/CI 1.1 or MCCS 2 Revision 1 specification.
        :MCA_INVALID_CAPABILITIES_STRING, 15200,
        # MessageId: ERROR_MCA_INVALID_VCP_VERSION
        # MessageText:
        # The monitor's VCP Version (0xDF) VCP code returned an invalid version value.
        :MCA_INVALID_VCP_VERSION, 15201,
        # MessageId: ERROR_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION
        # MessageText:
        # The monitor does not comply with the MCCS specification it claims to support.
        :MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION, 15202,
        # MessageId: ERROR_MCA_MCCS_VERSION_MISMATCH
        # MessageText:
        # The MCCS version in a monitor's mccs_ver capability does not match the MCCS version the monitor reports when the VCP Version (0xDF) VCP code is used.
        :MCA_MCCS_VERSION_MISMATCH, 15203,
        # MessageId: ERROR_MCA_UNSUPPORTED_MCCS_VERSION
        # MessageText:
        # The Monitor Configuration API only works with monitors that support the MCCS 1.0 specification, MCCS 2.0 specification or the MCCS 2.0 Revision 1 specification.
        :MCA_UNSUPPORTED_MCCS_VERSION, 15204,
        # MessageId: ERROR_MCA_INTERNAL_ERROR
        # MessageText:
        # An internal Monitor Configuration API error occurred.
        :MCA_INTERNAL_ERROR, 15205,
        # MessageId: ERROR_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED
        # MessageText:
        # The monitor returned an invalid monitor technology type. CRT, Plasma and LCD (TFT) are examples of monitor technology types. This error implies that the monitor violated the MCCS 2.0 or MCCS 2.0 Revision 1 specification.
        :MCA_INVALID_TECHNOLOGY_TYPE_RETURNED, 15206,
        # MessageId: ERROR_MCA_UNSUPPORTED_COLOR_TEMPERATURE
        # MessageText:
        # The caller of SetMonitorColorTemperature specified a color temperature that the current monitor did not support. This error implies that the monitor violated the MCCS 2.0 or MCCS 2.0 Revision 1 specification.
        :MCA_UNSUPPORTED_COLOR_TEMPERATURE, 15207,
        #=== End of Monitor Configuration API error codes 15200 to 15249 ===#
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end