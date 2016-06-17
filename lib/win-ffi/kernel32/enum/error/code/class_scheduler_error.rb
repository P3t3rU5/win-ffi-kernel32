module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Class Scheduler Error codes 1550 to 1599 ===#
        # MessageId: ERROR_INVALID_TASK_NAME
        # MessageText:
        # The specified task name is invalid.
        :INVALID_TASK_NAME, 1550,
        # MessageId: ERROR_INVALID_TASK_INDEX
        # MessageText:
        # The specified task index is invalid.
        :INVALID_TASK_INDEX, 1551,
        # MessageId: ERROR_THREAD_ALREADY_IN_TASK
        # MessageText:
        # The specified thread is already joining a task.
        :THREAD_ALREADY_IN_TASK, 1552,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end