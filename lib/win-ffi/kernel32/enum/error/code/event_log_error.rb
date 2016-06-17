module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== EventLog Error codes 1500 to 1549 ===#
        # MessageId: ERROR_EVENTLOG_FILE_CORRUPT
        # MessageText:
        # The event log file is corrupted.
        :EVENTLOG_FILE_CORRUPT, 1500,
        # MessageId: ERROR_EVENTLOG_CANT_START
        # MessageText:
        # No event log file could be opened, so the event logging service did not start.
        :EVENTLOG_CANT_START, 1501,
        # MessageId: ERROR_LOG_FILE_FULL
        # MessageText:
        # The event log file is full.
        :LOG_FILE_FULL, 1502,
        # MessageId: ERROR_EVENTLOG_FILE_CHANGED
        # MessageText:
        # The event log file has changed between read operations.
        :EVENTLOG_FILE_CHANGED, 1503,
        # MessageId: ERROR_CONTAINER_ASSIGNED
        # MessageText:
        # The specified Job already has a container assigned to it.
        :CONTAINER_ASSIGNED, 1504,
        # MessageId: ERROR_JOB_NO_CONTAINER
        # MessageText:
        # The specified Job does not have a container assigned to it.
        :JOB_NO_CONTAINER, 1505,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end