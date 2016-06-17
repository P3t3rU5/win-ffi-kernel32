module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Transactional File Services (TxF) Error codes 6800 to 6899 ===#
        # MessageId: ERROR_TRANSACTIONAL_CONFLICT
        # MessageText:
        # The function attempted to use a name that is reserved for use by another transaction.
        :TRANSACTIONAL_CONFLICT, 6800,
        # MessageId: ERROR_RM_NOT_ACTIVE
        # MessageText:
        # Transaction support within the specified resource manager is not started or was shut down due to an error.
        :RM_NOT_ACTIVE, 6801,
        # MessageId: ERROR_RM_METADATA_CORRUPT
        # MessageText:
        # The metadata of the RM has been corrupted. The RM will not function.
        :RM_METADATA_CORRUPT, 6802,
        # MessageId: ERROR_DIRECTORY_NOT_RM
        # MessageText:
        # The specified directory does not contain a resource manager.
        :DIRECTORY_NOT_RM, 6803,
        # MessageId: ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE
        # MessageText:
        # The remote server or share does not support transacted file operations.
        :TRANSACTIONS_UNSUPPORTED_REMOTE, 6805,
        # MessageId: ERROR_LOG_RESIZE_INVALID_SIZE
        # MessageText:
        # The requested log size is invalid.
        :LOG_RESIZE_INVALID_SIZE, 6806,
        # MessageId: ERROR_OBJECT_NO_LONGER_EXISTS
        # MessageText:
        # The object (file, stream, link) corresponding to the handle has been deleted by a Transaction Savepoint
        # Rollback.
        :OBJECT_NO_LONGER_EXISTS, 6807,
        # MessageId: ERROR_STREAM_MINIVERSION_NOT_FOUND
        # MessageText:
        # The specified file miniversion was not found for this transacted file open.
        :STREAM_MINIVERSION_NOT_FOUND, 6808,
        # MessageId: ERROR_STREAM_MINIVERSION_NOT_VALID
        # MessageText:
        # The specified file miniversion was found but has been invalidated. Most likely cause is a transaction
        # savepoint rollback.
        :STREAM_MINIVERSION_NOT_VALID, 6809,
        # MessageId: ERROR_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION
        # MessageText:
        # A miniversion may only be opened in the context of the transaction that created it.
        :MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION, 6810,
        # MessageId: ERROR_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT
        # MessageText:
        # It is not possible to open a miniversion with modify access.
        :CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT, 6811,
        # MessageId: ERROR_CANT_CREATE_MORE_STREAM_MINIVERSIONS
        # MessageText:
        # It is not possible to create any more miniversions for this stream.
        :CANT_CREATE_MORE_STREAM_MINIVERSIONS, 6812,
        # MessageId: ERROR_REMOTE_FILE_VERSION_MISMATCH
        # MessageText:
        # The remote server sent mismatching version number or Fid for a file opened with transactions.
        :REMOTE_FILE_VERSION_MISMATCH, 6814,
        # MessageId: ERROR_HANDLE_NO_LONGER_VALID
        # MessageText:
        # The handle has been invalidated by a transaction. The most likely cause is the presence of memory mapping on a
        # file or an open handle when the transaction ended or rolled back to savepoint.
        :HANDLE_NO_LONGER_VALID, 6815,
        # MessageId: ERROR_NO_TXF_METADATA
        # MessageText:
        # There is no transaction metadata on the file.
        :NO_TXF_METADATA, 6816,
        # MessageId: ERROR_LOG_CORRUPTION_DETECTED
        # MessageText:
        # The log data is corrupt.
        :LOG_CORRUPTION_DETECTED, 6817,
        # MessageId: ERROR_CANT_RECOVER_WITH_HANDLE_OPEN
        # MessageText:
        # The file can't be recovered because there is a handle still open on it.
        :CANT_RECOVER_WITH_HANDLE_OPEN, 6818,
        # MessageId: ERROR_RM_DISCONNECTED
        # MessageText:
        # The transaction outcome is unavailable because the resource manager responsible for it has disconnected.
        :RM_DISCONNECTED, 6819,
        # MessageId: ERROR_ENLISTMENT_NOT_SUPERIOR
        # MessageText:
        # The request was rejected because the enlistment in question is not a superior enlistment.
        :ENLISTMENT_NOT_SUPERIOR, 6820,
        # MessageId: ERROR_RECOVERY_NOT_NEEDED
        # MessageText:
        # The transactional resource manager is already consistent. Recovery is not needed.
        :RECOVERY_NOT_NEEDED, 6821,
        # MessageId: ERROR_RM_ALREADY_STARTED
        # MessageText:
        # The transactional resource manager has already been started.
        :RM_ALREADY_STARTED, 6822,
        # MessageId: ERROR_FILE_IDENTITY_NOT_PERSISTENT
        # MessageText:
        # The file cannot be opened transactionally, because its identity depends on the outcome of an unresolved
        # transaction.
        :FILE_IDENTITY_NOT_PERSISTENT, 6823,
        # MessageId: ERROR_CANT_BREAK_TRANSACTIONAL_DEPENDENCY
        # MessageText:
        # The operation cannot be performed because another transaction is depending on the fact that this property will
        # not change.
        :CANT_BREAK_TRANSACTIONAL_DEPENDENCY, 6824,
        # MessageId: ERROR_CANT_CROSS_RM_BOUNDARY
        # MessageText:
        # The operation would involve a single file with two transactional resource managers and is therefore not
        # allowed.
        :CANT_CROSS_RM_BOUNDARY, 6825,
        # MessageId: ERROR_TXF_DIR_NOT_EMPTY
        # MessageText:
        # The $Txf directory must be empty for this operation to succeed.
        :TXF_DIR_NOT_EMPTY, 6826,
        # MessageId: ERROR_INDOUBT_TRANSACTIONS_EXIST
        # MessageText:
        # The operation would leave a transactional resource manager in an inconsistent state and is therefore not
        # allowed.
        :INDOUBT_TRANSACTIONS_EXIST, 6827,
        # MessageId: ERROR_TM_VOLATILE
        # MessageText:
        # The operation could not be completed because the transaction manager does not have a log.
        :TM_VOLATILE, 6828,
        # MessageId: ERROR_ROLLBACK_TIMER_EXPIRED
        # MessageText:
        # A rollback could not be scheduled because a previously scheduled rollback has already executed or been queued
        # for execution.
        :ROLLBACK_TIMER_EXPIRED, 6829,
        # MessageId: ERROR_TXF_ATTRIBUTE_CORRUPT
        # MessageText:
        # The transactional metadata attribute on the file or directory is corrupt and unreadable.
        :TXF_ATTRIBUTE_CORRUPT, 6830,
        # MessageId: ERROR_EFS_NOT_ALLOWED_IN_TRANSACTION
        # MessageText:
        # The encryption operation could not be completed because a transaction is active.
        :EFS_NOT_ALLOWED_IN_TRANSACTION, 6831,
        # MessageId: ERROR_TRANSACTIONAL_OPEN_NOT_ALLOWED
        # MessageText:
        # This object is not allowed to be opened in a transaction.
        :TRANSACTIONAL_OPEN_NOT_ALLOWED, 6832,
        # MessageId: ERROR_LOG_GROWTH_FAILED
        # MessageText:
        # An attempt to create space in the transactional resource manager's log failed. The failure status has been
        # recorded in the event log.
        :LOG_GROWTH_FAILED, 6833,
        # MessageId: ERROR_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE
        # MessageText:
        # Memory mapping (creating a mapped section) a remote file under a transaction is not supported.
        :TRANSACTED_MAPPING_UNSUPPORTED_REMOTE, 6834,
        # MessageId: ERROR_TXF_METADATA_ALREADY_PRESENT
        # MessageText:
        # Transaction metadata is already present on this file and cannot be superseded.
        :TXF_METADATA_ALREADY_PRESENT, 6835,
        # MessageId: ERROR_TRANSACTION_SCOPE_CALLBACKS_NOT_SET
        # MessageText:
        # A transaction scope could not be entered because the scope handler has not been initialized.
        :TRANSACTION_SCOPE_CALLBACKS_NOT_SET, 6836,
        # MessageId: ERROR_TRANSACTION_REQUIRED_PROMOTION
        # MessageText:
        # Promotion was required in order to allow the resource manager to enlist, but the transaction was set to
        # disallow it.
        :TRANSACTION_REQUIRED_PROMOTION, 6837,
        # MessageId: ERROR_CANNOT_EXECUTE_FILE_IN_TRANSACTION
        # MessageText:
        # This file is open for modification in an unresolved transaction and may be opened for execute only by a
        # transacted reader.
        :CANNOT_EXECUTE_FILE_IN_TRANSACTION, 6838,
        # MessageId: ERROR_TRANSACTIONS_NOT_FROZEN
        # MessageText:
        # The request to thaw frozen transactions was ignored because transactions had not previously been frozen.
        :TRANSACTIONS_NOT_FROZEN, 6839,
        # MessageId: ERROR_TRANSACTION_FREEZE_IN_PROGRESS
        # MessageText:
        # Transactions cannot be frozen because a freeze is already in progress.
        :TRANSACTION_FREEZE_IN_PROGRESS, 6840,
        # MessageId: ERROR_NOT_SNAPSHOT_VOLUME
        # MessageText:
        # The target volume is not a snapshot volume. This operation is only valid on a volume mounted as a snapshot.
        :NOT_SNAPSHOT_VOLUME, 6841,
        # MessageId: ERROR_NO_SAVEPOINT_WITH_OPEN_FILES
        # MessageText:
        # The savepoint operation failed because files are open on the transaction. This is not permitted.
        :NO_SAVEPOINT_WITH_OPEN_FILES, 6842,
        # MessageId: ERROR_DATA_LOST_REPAIR
        # MessageText:
        # Windows has discovered corruption in a file, and that file has since been repaired. Data loss may have
        # occurred.
        :DATA_LOST_REPAIR, 6843,
        # MessageId: ERROR_SPARSE_NOT_ALLOWED_IN_TRANSACTION
        # MessageText:
        # The sparse operation could not be completed because a transaction is active on the file.
        :SPARSE_NOT_ALLOWED_IN_TRANSACTION, 6844,
        # MessageId: ERROR_TM_IDENTITY_MISMATCH
        # MessageText:
        # The call to create a TransactionManager object failed because the Tm Identity stored in the logfile does not
        # match the Tm Identity that was passed in as an argument.
        :TM_IDENTITY_MISMATCH, 6845,
        # MessageId: ERROR_FLOATED_SECTION
        # MessageText:
        # I/O was attempted on a section object that has been floated as a result of a transaction ending. There is no
        # valid data.
        :FLOATED_SECTION, 6846,
        # MessageId: ERROR_CANNOT_ACCEPT_TRANSACTED_WORK
        # MessageText:
        # The transactional resource manager cannot currently accept transacted work due to a transient condition such
        # as low resources.
        :CANNOT_ACCEPT_TRANSACTED_WORK, 6847,
        # MessageId: ERROR_CANNOT_ABORT_TRANSACTIONS
        # MessageText:
        # The transactional resource manager had too many tranactions outstanding that could not be aborted. The
        # transactional resource manger has been shut down.
        :CANNOT_ABORT_TRANSACTIONS, 6848,
        # MessageId: ERROR_BAD_CLUSTERS
        # MessageText:
        # The operation could not be completed due to bad clusters on disk.
        :BAD_CLUSTERS, 6849,
        # MessageId: ERROR_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION
        # MessageText:
        # The compression operation could not be completed because a transaction is active on the file.
        :COMPRESSION_NOT_ALLOWED_IN_TRANSACTION, 6850,
        # MessageId: ERROR_VOLUME_DIRTY
        # MessageText:
        # The operation could not be completed because the volume is dirty. Please run chkdsk and try again.
        :VOLUME_DIRTY, 6851,
        # MessageId: ERROR_NO_LINK_TRACKING_IN_TRANSACTION
        # MessageText:
        # The link tracking operation could not be completed because a transaction is active.
        :NO_LINK_TRACKING_IN_TRANSACTION, 6852,
        # MessageId: ERROR_OPERATION_NOT_SUPPORTED_IN_TRANSACTION
        # MessageText:
        # This operation cannot be performed in a transaction.
        :OPERATION_NOT_SUPPORTED_IN_TRANSACTION, 6853,
        # MessageId: ERROR_EXPIRED_HANDLE
        # MessageText:
        # The handle is no longer properly associated with its transaction.  It may have been opened in a transactional
        # resource manager that was subsequently forced to restart.  Please close the handle and open a new one.
        :EXPIRED_HANDLE, 6854,
        # MessageId: ERROR_TRANSACTION_NOT_ENLISTED
        # MessageText:
        # The specified operation could not be performed because the resource manager is not enlisted in the transaction
        :TRANSACTION_NOT_ENLISTED, 6855,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end