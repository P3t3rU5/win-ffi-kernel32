module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== File System Supported Features Error Codes 4440 to 4499 ===#
        # MessageId: ERROR_OFFLOAD_READ_FLT_NOT_SUPPORTED
        # MessageText:
        # The copy offload read operation is not supported by a filter.
        :OFFLOAD_READ_FLT_NOT_SUPPORTED, 4440,
        # MessageId: ERROR_OFFLOAD_WRITE_FLT_NOT_SUPPORTED
        # MessageText:
        # The copy offload write operation is not supported by a filter.
        :OFFLOAD_WRITE_FLT_NOT_SUPPORTED, 4441,
        # MessageId: ERROR_OFFLOAD_READ_FILE_NOT_SUPPORTED
        # MessageText:
        # The copy offload read operation is not supported for the file.
        :OFFLOAD_READ_FILE_NOT_SUPPORTED, 4442,
        # MessageId: ERROR_OFFLOAD_WRITE_FILE_NOT_SUPPORTED
        # MessageText:
        # The copy offload write operation is not supported for the file.
        :OFFLOAD_WRITE_FILE_NOT_SUPPORTED, 4443,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end