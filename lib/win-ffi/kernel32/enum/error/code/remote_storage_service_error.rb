module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Remote Storage Service Error codes 4350 to 4389 ===#
        # MessageId: ERROR_FILE_OFFLINE
        # MessageText:
        # This file is currently not available for use on this computer.
        :FILE_OFFLINE, 4350,
        # MessageId: ERROR_REMOTE_STORAGE_NOT_ACTIVE
        # MessageText:
        # The remote storage service is not operational at this time.
        :REMOTE_STORAGE_NOT_ACTIVE, 4351,
        # MessageId: ERROR_REMOTE_STORAGE_MEDIA_ERROR
        # MessageText:
        # The remote storage service encountered a media error.
        :REMOTE_STORAGE_MEDIA_ERROR, 4352,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end