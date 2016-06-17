module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Wins Error codes 4000 to 4049 ===#
        # MessageId: ERROR_WINS_INTERNAL
        # MessageText:
        # WINS encountered an error while processing the command.
        :WINS_INTERNAL, 4000,
        # MessageId: ERROR_CAN_NOT_DEL_LOCAL_WINS
        # MessageText:
        # The local WINS cannot be deleted.
        :CAN_NOT_DEL_LOCAL_WINS, 4001,
        # MessageId: ERROR_STATIC_INIT
        # MessageText:
        # The importation from the file failed.
        :STATIC_INIT, 4002,
        # MessageId: ERROR_INC_BACKUP
        # MessageText:
        # The backup failed. Was a full backup done before?
        :INC_BACKUP, 4003,
        # MessageId: ERROR_FULL_BACKUP
        # MessageText:
        # The backup failed. Check the directory to which you are backing the database.
        :FULL_BACKUP, 4004,
        # MessageId: ERROR_REC_NON_EXISTENT
        # MessageText:
        # The name does not exist in the WINS database.
        :REC_NON_EXISTENT, 4005,
        # MessageId: ERROR_RPL_NOT_ALLOWED
        # MessageText:
        # Replication with a nonconfigured partner is not allowed.
        :RPL_NOT_ALLOWED, 4006,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end