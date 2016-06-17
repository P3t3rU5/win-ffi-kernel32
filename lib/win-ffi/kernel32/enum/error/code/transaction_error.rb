module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Transaction (KTM) Error codes 6700 to 6799 ===#
        # MessageId: ERROR_INVALID_TRANSACTION
        # MessageText:
        # The transaction handle associated with this operation is not valid.
        :INVALID_TRANSACTION, 6700,
        # MessageId: ERROR_TRANSACTION_NOT_ACTIVE
        # MessageText:
        # The requested operation was made in the context of a transaction that is no longer active.
        :TRANSACTION_NOT_ACTIVE, 6701,
        # MessageId: ERROR_TRANSACTION_REQUEST_NOT_VALID
        # MessageText:
        # The requested operation is not valid on the Transaction object in its current state.
        :TRANSACTION_REQUEST_NOT_VALID, 6702,
        # MessageId: ERROR_TRANSACTION_NOT_REQUESTED
        # MessageText:
        # The caller has called a response API, but the response is not expected because the TM did not issue the
        # corresponding request to the caller.
        :TRANSACTION_NOT_REQUESTED, 6703,
        # MessageId: ERROR_TRANSACTION_ALREADY_ABORTED
        # MessageText:
        # It is too late to perform the requested operation, since the Transaction has already been aborted.
        :TRANSACTION_ALREADY_ABORTED, 6704,
        # MessageId: ERROR_TRANSACTION_ALREADY_COMMITTED
        # MessageText:
        # It is too late to perform the requested operation, since the Transaction has already been committed.
        :TRANSACTION_ALREADY_COMMITTED, 6705,
        # MessageId: ERROR_TM_INITIALIZATION_FAILED
        # MessageText:
        # The Transaction Manager was unable to be successfully initialized. Transacted operations are not supported.
        :TM_INITIALIZATION_FAILED, 6706,
        # MessageId: ERROR_RESOURCEMANAGER_READ_ONLY
        # MessageText:
        # The specified ResourceManager made no changes or updates to the resource under this transaction.
        :RESOURCEMANAGER_READ_ONLY, 6707,
        # MessageId: ERROR_TRANSACTION_NOT_JOINED
        # MessageText:
        # The resource manager has attempted to prepare a transaction that it has not successfully joined.
        :TRANSACTION_NOT_JOINED, 6708,
        # MessageId: ERROR_TRANSACTION_SUPERIOR_EXISTS
        # MessageText:
        # The Transaction object already has a superior enlistment, and the caller attempted an operation that would
        # have created a new superior. Only a single superior enlistment is allow.
        :TRANSACTION_SUPERIOR_EXISTS, 6709,
        # MessageId: ERROR_CRM_PROTOCOL_ALREADY_EXISTS
        # MessageText:
        # The RM tried to register a protocol that already exists.
        :CRM_PROTOCOL_ALREADY_EXISTS, 6710,
        # MessageId: ERROR_TRANSACTION_PROPAGATION_FAILED
        # MessageText:
        # The attempt to propagate the Transaction failed.
        :TRANSACTION_PROPAGATION_FAILED, 6711,
        # MessageId: ERROR_CRM_PROTOCOL_NOT_FOUND
        # MessageText:
        # The requested propagation protocol was not registered as a CRM.
        :CRM_PROTOCOL_NOT_FOUND, 6712,
        # MessageId: ERROR_TRANSACTION_INVALID_MARSHALL_BUFFER
        # MessageText:
        # The buffer passed in to PushTransaction or PullTransaction is not in a valid format.
        :TRANSACTION_INVALID_MARSHALL_BUFFER, 6713,
        # MessageId: ERROR_CURRENT_TRANSACTION_NOT_VALID
        # MessageText:
        # The current transaction context associated with the thread is not a valid handle to a transaction object.
        :CURRENT_TRANSACTION_NOT_VALID, 6714,
        # MessageId: ERROR_TRANSACTION_NOT_FOUND
        # MessageText:
        # The specified Transaction object could not be opened, because it was not found.
        :TRANSACTION_NOT_FOUND, 6715,
        # MessageId: ERROR_RESOURCEMANAGER_NOT_FOUND
        # MessageText:
        # The specified ResourceManager object could not be opened, because it was not found.
        :RESOURCEMANAGER_NOT_FOUND, 6716,
        # MessageId: ERROR_ENLISTMENT_NOT_FOUND
        # MessageText:
        # The specified Enlistment object could not be opened, because it was not found.
        :ENLISTMENT_NOT_FOUND, 6717,
        # MessageId: ERROR_TRANSACTIONMANAGER_NOT_FOUND
        # MessageText:
        # The specified TransactionManager object could not be opened, because it was not found.
        :TRANSACTIONMANAGER_NOT_FOUND, 6718,
        # MessageId: ERROR_TRANSACTIONMANAGER_NOT_ONLINE
        # MessageText:
        # The object specified could not be created or opened, because its associated TransactionManager is not online.
        #  The TransactionManager must be brought fully Online by calling RecoverTransactionManager to recover to the end of its LogFile before objects in its Transaction or ResourceManager namespaces can be opened.  In addition, errors in writing records to its LogFile can cause a TransactionManager to go offline.
        :TRANSACTIONMANAGER_NOT_ONLINE, 6719,
        # MessageId: ERROR_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION
        # MessageText:
        # The specified TransactionManager was unable to create the objects contained in its logfile in the Ob namespace
        # Therefore, the TransactionManager was unable to recover.
        :TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION, 6720,
        # MessageId: ERROR_TRANSACTION_NOT_ROOT
        # MessageText:
        # The call to create a superior Enlistment on this Transaction object could not be completed, because the
        # Transaction object specified for the enlistment is a subordinate branch of the Transaction. Only the root of
        # the Transaction can be enlisted on as a superior.
        :TRANSACTION_NOT_ROOT, 6721,
        # MessageId: ERROR_TRANSACTION_OBJECT_EXPIRED
        # MessageText:
        # Because the associated transaction manager or resource manager has been closed, the handle is no longer valid.
        :TRANSACTION_OBJECT_EXPIRED, 6722,
        # MessageId: ERROR_TRANSACTION_RESPONSE_NOT_ENLISTED
        # MessageText:
        # The specified operation could not be performed on this Superior enlistment, because the enlistment was not
        # created with the corresponding completion response in the NotificationMask.
        :TRANSACTION_RESPONSE_NOT_ENLISTED, 6723,
        # MessageId: ERROR_TRANSACTION_RECORD_TOO_LONG
        # MessageText:
        # The specified operation could not be performed, because the record that would be logged was too long. This can
        # occur because of two conditions: either there are too many Enlistments on this Transaction, or the combined
        # RecoveryInformation being logged on behalf of those Enlistments is too long.
        :TRANSACTION_RECORD_TOO_LONG, 6724,
        # MessageId: ERROR_IMPLICIT_TRANSACTION_NOT_SUPPORTED
        # MessageText:
        # Implicit transaction are not supported.
        :IMPLICIT_TRANSACTION_NOT_SUPPORTED, 6725,
        # MessageId: ERROR_TRANSACTION_INTEGRITY_VIOLATED
        # MessageText:
        # The kernel transaction manager had to abort or forget the transaction because it blocked forward progress.
        :TRANSACTION_INTEGRITY_VIOLATED, 6726,
        # MessageId: ERROR_TRANSACTIONMANAGER_IDENTITY_MISMATCH
        # MessageText:
        # The TransactionManager identity that was supplied did not match the one recorded in the TransactionManager's
        # log file.
        :TRANSACTIONMANAGER_IDENTITY_MISMATCH, 6727,
        # MessageId: ERROR_RM_CANNOT_BE_FROZEN_FOR_SNAPSHOT
        # MessageText:
        # This snapshot operation cannot continue because a transactional resource manager cannot be frozen in its
        # current state.  Please try again.
        :RM_CANNOT_BE_FROZEN_FOR_SNAPSHOT, 6728,
        # MessageId: ERROR_TRANSACTION_MUST_WRITETHROUGH
        # MessageText:
        # The transaction cannot be enlisted on with the specified EnlistmentMask, because the transaction has already
        # completed the PrePrepare phase.  In order to ensure correctness, the ResourceManager must switch to a
        # write-through mode and cease caching data within this transaction.  Enlisting for only subsequent transaction
        # phases may still succeed.
        :TRANSACTION_MUST_WRITETHROUGH, 6729,
        # MessageId: ERROR_TRANSACTION_NO_SUPERIOR
        # MessageText:
        # The transaction does not have a superior enlistment.
        :TRANSACTION_NO_SUPERIOR, 6730,
        # MessageId: ERROR_HEURISTIC_DAMAGE_POSSIBLE
        # MessageText:
        # The attempt to commit the Transaction completed, but it is possible that some portion of the transaction tree
        # did not commit successfully due to heuristics.  Therefore it is possible that some data modified in the
        # transaction may not have committed, resulting in transactional inconsistency.  If possible, check the
        # consistency of the associated data.
        :HEURISTIC_DAMAGE_POSSIBLE, 6731,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end