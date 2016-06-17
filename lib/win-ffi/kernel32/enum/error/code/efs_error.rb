module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== EFS Error codes 6000 to 6099 ===#
        # MessageId: ERROR_ENCRYPTION_FAILED
        # MessageText:
        # The specified file could not be encrypted.
        :ENCRYPTION_FAILED, 6000,
        # MessageId: ERROR_DECRYPTION_FAILED
        # MessageText:
        # The specified file could not be decrypted.
        :DECRYPTION_FAILED, 6001,
        # MessageId: ERROR_FILE_ENCRYPTED
        # MessageText:
        # The specified file is encrypted and the user does not have the ability to decrypt it.
        :FILE_ENCRYPTED, 6002,
        # MessageId: ERROR_NO_RECOVERY_POLICY
        # MessageText:
        # There is no valid encryption recovery policy configured for this system.
        :NO_RECOVERY_POLICY, 6003,
        # MessageId: ERROR_NO_EFS
        # MessageText:
        # The required encryption driver is not loaded for this system.
        :NO_EFS, 6004,
        # MessageId: ERROR_WRONG_EFS
        # MessageText:
        # The file was encrypted with a different encryption driver than is currently loaded.
        :WRONG_EFS, 6005,
        # MessageId: ERROR_NO_USER_KEYS
        # MessageText:
        # There are no EFS keys defined for the user.
        :NO_USER_KEYS, 6006,
        # MessageId: ERROR_FILE_NOT_ENCRYPTED
        # MessageText:
        # The specified file is not encrypted.
        :FILE_NOT_ENCRYPTED, 6007,
        # MessageId: ERROR_NOT_EXPORT_FORMAT
        # MessageText:
        # The specified file is not in the defined EFS export format.
        :NOT_EXPORT_FORMAT, 6008,
        # MessageId: ERROR_FILE_READ_ONLY
        # MessageText:
        # The specified file is read only.
        :FILE_READ_ONLY, 6009,
        # MessageId: ERROR_DIR_EFS_DISALLOWED
        # MessageText:
        # The directory has been disabled for encryption.
        :DIR_EFS_DISALLOWED, 6010,
        # MessageId: ERROR_EFS_SERVER_NOT_TRUSTED
        # MessageText:
        # The server is not trusted for remote encryption operation.
        :EFS_SERVER_NOT_TRUSTED, 6011,
        # MessageId: ERROR_BAD_RECOVERY_POLICY
        # MessageText:
        # Recovery policy configured for this system contains invalid recovery certificate.
        :BAD_RECOVERY_POLICY, 6012,
        # MessageId: ERROR_EFS_ALG_BLOB_TOO_BIG
        # MessageText:
        # The encryption algorithm used on the source file needs a bigger key buffer than the one on the destination file.
        :EFS_ALG_BLOB_TOO_BIG, 6013,
        # MessageId: ERROR_VOLUME_NOT_SUPPORT_EFS
        # MessageText:
        # The disk partition does not support file encryption.
        :VOLUME_NOT_SUPPORT_EFS, 6014,
        # MessageId: ERROR_EFS_DISABLED
        # MessageText:
        # This machine is disabled for file encryption.
        :EFS_DISABLED, 6015,
        # MessageId: ERROR_EFS_VERSION_NOT_SUPPORT
        # MessageText:
        # A newer system is required to decrypt this encrypted file.
        :EFS_VERSION_NOT_SUPPORT, 6016,
        # MessageId: ERROR_CS_ENCRYPTION_INVALID_SERVER_RESPONSE
        # MessageText:
        # The remote server sent an invalid response for a file being opened with Client Side Encryption.
        :CS_ENCRYPTION_INVALID_SERVER_RESPONSE, 6017,
        # MessageId: ERROR_CS_ENCRYPTION_UNSUPPORTED_SERVER
        # MessageText:
        # Client Side Encryption is not supported by the remote server even though it claims to support it.
        :CS_ENCRYPTION_UNSUPPORTED_SERVER, 6018,
        # MessageId: ERROR_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE
        # MessageText:
        # File is encrypted and should be opened in Client Side Encryption mode.
        :CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE, 6019,
        # MessageId: ERROR_CS_ENCRYPTION_NEW_ENCRYPTED_FILE
        # MessageText:
        # A new encrypted file is being created and a $EFS needs to be provided.
        :CS_ENCRYPTION_NEW_ENCRYPTED_FILE, 6020,
        # MessageId: ERROR_CS_ENCRYPTION_FILE_NOT_CSE
        # MessageText:
        # The SMB client requested a CSE FSCTL on a non-CSE file.
        :CS_ENCRYPTION_FILE_NOT_CSE, 6021,
        # MessageId: ERROR_ENCRYPTION_POLICY_DENIES_OPERATION
        # MessageText:
        # The requested operation was blocked by policy. For more information, contact your system administrator.
        :ENCRYPTION_POLICY_DENIES_OPERATION, 6022,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end