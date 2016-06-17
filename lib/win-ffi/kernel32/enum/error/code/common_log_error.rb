module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #===  Common Log (CLFS) Error codes 6600 to 6699 ===#
        # MessageId: ERROR_LOG_SECTOR_INVALID
        # MessageText:
        # Log service encountered an invalid log sector.
        :LOG_SECTOR_INVALID, 6600,
        # MessageId: ERROR_LOG_SECTOR_PARITY_INVALID
        # MessageText:
        # Log service encountered a log sector with invalid block parity.
        :LOG_SECTOR_PARITY_INVALID, 6601,
        # MessageId: ERROR_LOG_SECTOR_REMAPPED
        # MessageText:
        # Log service encountered a remapped log sector.
        :LOG_SECTOR_REMAPPED, 6602,
        # MessageId: ERROR_LOG_BLOCK_INCOMPLETE
        # MessageText:
        # Log service encountered a partial or incomplete log block.
        :LOG_BLOCK_INCOMPLETE, 6603,
        # MessageId: ERROR_LOG_INVALID_RANGE
        # MessageText:
        # Log service encountered an attempt access data outside the active log range.
        :LOG_INVALID_RANGE, 6604,
        # MessageId: ERROR_LOG_BLOCKS_EXHAUSTED
        # MessageText:
        # Log service user marshalling buffers are exhausted.
        :LOG_BLOCKS_EXHAUSTED, 6605,
        # MessageId: ERROR_LOG_READ_CONTEXT_INVALID
        # MessageText:
        # Log service encountered an attempt read from a marshalling area with an invalid read context.
        :LOG_READ_CONTEXT_INVALID, 6606,
        # MessageId: ERROR_LOG_RESTART_INVALID
        # MessageText:
        # Log service encountered an invalid log restart area.
        :LOG_RESTART_INVALID, 6607,
        # MessageId: ERROR_LOG_BLOCK_VERSION
        # MessageText:
        # Log service encountered an invalid log block version.
        :LOG_BLOCK_VERSION, 6608,
        # MessageId: ERROR_LOG_BLOCK_INVALID
        # MessageText:
        # Log service encountered an invalid log block.
        :LOG_BLOCK_INVALID, 6609,
        # MessageId: ERROR_LOG_READ_MODE_INVALID
        # MessageText:
        # Log service encountered an attempt to read the log with an invalid read mode.
        :LOG_READ_MODE_INVALID, 6610,
        # MessageId: ERROR_LOG_NO_RESTART
        # MessageText:
        # Log service encountered a log stream with no restart area.
        :LOG_NO_RESTART, 6611,
        # MessageId: ERROR_LOG_METADATA_CORRUPT
        # MessageText:
        # Log service encountered a corrupted metadata file.
        :LOG_METADATA_CORRUPT, 6612,
        # MessageId: ERROR_LOG_METADATA_INVALID
        # MessageText:
        # Log service encountered a metadata file that could not be created by the log file system.
        :LOG_METADATA_INVALID, 6613,
        # MessageId: ERROR_LOG_METADATA_INCONSISTENT
        # MessageText:
        # Log service encountered a metadata file with inconsistent data.
        :LOG_METADATA_INCONSISTENT, 6614,
        # MessageId: ERROR_LOG_RESERVATION_INVALID
        # MessageText:
        # Log service encountered an attempt to erroneous allocate or dispose reservation space.
        :LOG_RESERVATION_INVALID, 6615,
        # MessageId: ERROR_LOG_CANT_DELETE
        # MessageText:
        # Log service cannot delete log file or file system container.
        :LOG_CANT_DELETE, 6616,
        # MessageId: ERROR_LOG_CONTAINER_LIMIT_EXCEEDED
        # MessageText:
        # Log service has reached the maximum allowable containers allocated to a log file.
        :LOG_CONTAINER_LIMIT_EXCEEDED, 6617,
        # MessageId: ERROR_LOG_START_OF_LOG
        # MessageText:
        # Log service has attempted to read or write backward past the start of the log.
        :LOG_START_OF_LOG, 6618,
        # MessageId: ERROR_LOG_POLICY_ALREADY_INSTALLED
        # MessageText:
        # Log policy could not be installed because a policy of the same type is already present.
        :LOG_POLICY_ALREADY_INSTALLED, 6619,
        # MessageId: ERROR_LOG_POLICY_NOT_INSTALLED
        # MessageText:
        # Log policy in question was not installed at the time of the request.
        :LOG_POLICY_NOT_INSTALLED, 6620,
        # MessageId: ERROR_LOG_POLICY_INVALID
        # MessageText:
        # The installed set of policies on the log is invalid.
        :LOG_POLICY_INVALID, 6621,
        # MessageId: ERROR_LOG_POLICY_CONFLICT
        # MessageText:
        # A policy on the log in question prevented the operation from completing.
        :LOG_POLICY_CONFLICT, 6622,
        # MessageId: ERROR_LOG_PINNED_ARCHIVE_TAIL
        # MessageText:
        # Log space cannot be reclaimed because the log is pinned by the archive tail.
        :LOG_PINNED_ARCHIVE_TAIL, 6623,
        # MessageId: ERROR_LOG_RECORD_NONEXISTENT
        # MessageText:
        # Log record is not a record in the log file.
        :LOG_RECORD_NONEXISTENT, 6624,
        # MessageId: ERROR_LOG_RECORDS_RESERVED_INVALID
        # MessageText:
        # Number of reserved log records or the adjustment of the number of reserved log records is invalid.
        :LOG_RECORDS_RESERVED_INVALID, 6625,
        # MessageId: ERROR_LOG_SPACE_RESERVED_INVALID
        # MessageText:
        # Reserved log space or the adjustment of the log space is invalid.
        :LOG_SPACE_RESERVED_INVALID, 6626,
        # MessageId: ERROR_LOG_TAIL_INVALID
        # MessageText:
        # An new or existing archive tail or base of the active log is invalid.
        :LOG_TAIL_INVALID, 6627,
        # MessageId: ERROR_LOG_FULL
        # MessageText:
        # Log space is exhausted.
        :LOG_FULL, 6628,
        # MessageId: ERROR_COULD_NOT_RESIZE_LOG
        # MessageText:
        # The log could not be set to the requested size.
        :COULD_NOT_RESIZE_LOG, 6629,
        # MessageId: ERROR_LOG_MULTIPLEXED
        # MessageText:
        # Log is multiplexed, no direct writes to the physical log is allowed.
        :LOG_MULTIPLEXED, 6630,
        # MessageId: ERROR_LOG_DEDICATED
        # MessageText:
        # The operation failed because the log is a dedicated log.
        :LOG_DEDICATED, 6631,
        # MessageId: ERROR_LOG_ARCHIVE_NOT_IN_PROGRESS
        # MessageText:
        # The operation requires an archive context.
        :LOG_ARCHIVE_NOT_IN_PROGRESS, 6632,
        # MessageId: ERROR_LOG_ARCHIVE_IN_PROGRESS
        # MessageText:
        # Log archival is in progress.
        :LOG_ARCHIVE_IN_PROGRESS, 6633,
        # MessageId: ERROR_LOG_EPHEMERAL
        # MessageText:
        # The operation requires a non-ephemeral log, but the log is ephemeral.
        :LOG_EPHEMERAL, 6634,
        # MessageId: ERROR_LOG_NOT_ENOUGH_CONTAINERS
        # MessageText:
        # The log must have at least two containers before it can be read from or written to.
        :LOG_NOT_ENOUGH_CONTAINERS, 6635,
        # MessageId: ERROR_LOG_CLIENT_ALREADY_REGISTERED
        # MessageText:
        # A log client has already registered on the stream.
        :LOG_CLIENT_ALREADY_REGISTERED, 6636,
        # MessageId: ERROR_LOG_CLIENT_NOT_REGISTERED
        # MessageText:
        # A log client has not been registered on the stream.
        :LOG_CLIENT_NOT_REGISTERED, 6637,
        # MessageId: ERROR_LOG_FULL_HANDLER_IN_PROGRESS
        # MessageText:
        # A request has already been made to handle the log full condition.
        :LOG_FULL_HANDLER_IN_PROGRESS, 6638,
        # MessageId: ERROR_LOG_CONTAINER_READ_FAILED
        # MessageText:
        # Log service encountered an error when attempting to read from a log container.
        :LOG_CONTAINER_READ_FAILED, 6639,
        # MessageId: ERROR_LOG_CONTAINER_WRITE_FAILED
        # MessageText:
        # Log service encountered an error when attempting to write to a log container.
        :LOG_CONTAINER_WRITE_FAILED, 6640,
        # MessageId: ERROR_LOG_CONTAINER_OPEN_FAILED
        # MessageText:
        # Log service encountered an error when attempting open a log container.
        :LOG_CONTAINER_OPEN_FAILED, 6641,
        # MessageId: ERROR_LOG_CONTAINER_STATE_INVALID
        # MessageText:
        # Log service encountered an invalid container state when attempting a requested action.
        :LOG_CONTAINER_STATE_INVALID, 6642,
        # MessageId: ERROR_LOG_STATE_INVALID
        # MessageText:
        # Log service is not in the correct state to perform a requested action.
        :LOG_STATE_INVALID, 6643,
        # MessageId: ERROR_LOG_PINNED
        # MessageText:
        # Log space cannot be reclaimed because the log is pinned.
        :LOG_PINNED, 6644,
        # MessageId: ERROR_LOG_METADATA_FLUSH_FAILED
        # MessageText:
        # Log metadata flush failed.
        :LOG_METADATA_FLUSH_FAILED, 6645,
        # MessageId: ERROR_LOG_INCONSISTENT_SECURITY
        # MessageText:
        # Security on the log and its containers is inconsistent.
        :LOG_INCONSISTENT_SECURITY, 6646,
        # MessageId: ERROR_LOG_APPENDED_FLUSH_FAILED
        # MessageText:
        # Records were appended to the log or reservation changes were made, but the log could not be flushed.
        :LOG_APPENDED_FLUSH_FAILED, 6647,
        # MessageId: ERROR_LOG_PINNED_RESERVATION
        # MessageText:
        # The log is pinned due to reservation consuming most of the log space. Free some reserved records to make space
        # available.
        :LOG_PINNED_RESERVATION, 6648,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end