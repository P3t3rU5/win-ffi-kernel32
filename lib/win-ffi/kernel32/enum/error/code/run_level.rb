module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Start of Run Level error codes 15400 - 15500 ===#
        # MessageId: ERROR_CANNOT_SWITCH_RUNLEVEL
        # MessageText:
        # The requested run level switch cannot be completed successfully.
        :CANNOT_SWITCH_RUNLEVEL, 15400,
        # MessageId: ERROR_INVALID_RUNLEVEL_SETTING
        # MessageText:
        # The service has an invalid run level setting. The run level for a service
        # must not be higher than the run level of its dependent services.
        :INVALID_RUNLEVEL_SETTING, 15401,
        # MessageId: ERROR_RUNLEVEL_SWITCH_TIMEOUT
        # MessageText:
        # The requested run level switch cannot be completed successfully since
        # one or more services will not stop or restart within the specified timeout.
        :RUNLEVEL_SWITCH_TIMEOUT, 15402,
        # MessageId: ERROR_RUNLEVEL_SWITCH_AGENT_TIMEOUT
        # MessageText:
        # A run level switch agent did not respond within the specified timeout.
        :RUNLEVEL_SWITCH_AGENT_TIMEOUT, 15403,
        # MessageId: ERROR_RUNLEVEL_SWITCH_IN_PROGRESS
        # MessageText:
        # A run level switch is currently in progress.
        :RUNLEVEL_SWITCH_IN_PROGRESS, 15404,
        # MessageId: ERROR_SERVICES_FAILED_AUTOSTART
        # MessageText:
        # One or more services failed to start during the service startup phase of a run level switch.
        :SERVICES_FAILED_AUTOSTART, 15405,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end