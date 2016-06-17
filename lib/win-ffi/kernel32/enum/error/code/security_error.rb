require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== SECURITY Error codes 1299 to 1399 ===#
        # MessageId: ERROR_INVALID_LABEL
        # MessageText:
        # Indicates a particular Security ID may not be assigned as the label of an object.
        :INVALID_LABEL, 1299,
        # MessageId: ERROR_NOT_ALL_ASSIGNED
        # MessageText:
        # Not all privileges or groups referenced are assigned to the caller.
        :NOT_ALL_ASSIGNED, 1300,
        # MessageId: ERROR_SOME_NOT_MAPPED
        # MessageText:
        # Some mapping between account names and security IDs was not done.
        :SOME_NOT_MAPPED, 1301,
        # MessageId: ERROR_NO_QUOTAS_FOR_ACCOUNT
        # MessageText:
        # No system quota limits are specifically set for this account.
        :NO_QUOTAS_FOR_ACCOUNT, 1302,
        # MessageId: ERROR_LOCAL_USER_SESSION_KEY
        # MessageText:
        # No encryption key is available. A well-known encryption key was returned.
        :LOCAL_USER_SESSION_KEY, 1303,
        # MessageId: ERROR_NULL_LM_PASSWORD
        # MessageText:
        # The password is too complex to be converted to a LAN Manager password. The LAN Manager password returned is a
        # NULL string.
        :NULL_LM_PASSWORD, 1304,
        # MessageId: ERROR_UNKNOWN_REVISION
        # MessageText:
        # The revision level is unknown.
        :UNKNOWN_REVISION, 1305,
        # MessageId: ERROR_REVISION_MISMATCH
        # MessageText:
        # Indicates two revision levels are incompatible.
        :REVISION_MISMATCH, 1306,
        # MessageId: ERROR_INVALID_OWNER
        # MessageText:
        # This security ID may not be assigned as the owner of this object.
        :INVALID_OWNER, 1307,
        # MessageId: ERROR_INVALID_PRIMARY_GROUP
        # MessageText:
        # This security ID may not be assigned as the primary group of an object.
        :INVALID_PRIMARY_GROUP, 1308,
        # MessageId: ERROR_NO_IMPERSONATION_TOKEN
        # MessageText:
        # An attempt has been made to operate on an impersonation token by a thread that is not currently impersonating
        # a client.
        :NO_IMPERSONATION_TOKEN, 1309,
        # MessageId: ERROR_CANT_DISABLE_MANDATORY
        # MessageText:
        # The group may not be disabled.
        :CANT_DISABLE_MANDATORY, 1310,
        # MessageId: ERROR_NO_LOGON_SERVERS
        # MessageText:
        # There are currently no logon servers available to service the logon request.
        :NO_LOGON_SERVERS, 1311,
        # MessageId: ERROR_NO_SUCH_LOGON_SESSION
        # MessageText:
        # A specified logon session does not exist. It may already have been terminated.
        :NO_SUCH_LOGON_SESSION, 1312,
        # MessageId: ERROR_NO_SUCH_PRIVILEGE
        # MessageText:
        # A specified privilege does not exist.
        :NO_SUCH_PRIVILEGE, 1313,
        # MessageId: ERROR_PRIVILEGE_NOT_HELD
        # MessageText:
        # A required privilege is not held by the client.
        :PRIVILEGE_NOT_HELD, 1314,
        # MessageId: ERROR_INVALID_ACCOUNT_NAME
        # MessageText:
        # The name provided is not a properly formed account name.
        :INVALID_ACCOUNT_NAME, 1315,
        # MessageId: ERROR_USER_EXISTS
        # MessageText:
        # The specified account already exists.
        :USER_EXISTS, 1316,
        # MessageId: ERROR_NO_SUCH_USER
        # MessageText:
        # The specified account does not exist.
        :NO_SUCH_USER, 1317,
        # MessageId: ERROR_GROUP_EXISTS
        # MessageText:
        # The specified group already exists.
        :GROUP_EXISTS, 1318,
        # MessageId: ERROR_NO_SUCH_GROUP
        # MessageText:
        # The specified group does not exist.
        :NO_SUCH_GROUP, 1319,
        # MessageId: ERROR_MEMBER_IN_GROUP
        # MessageText:
        # Either the specified user account is already a member of the specified group, or the specified group cannot be
        # deleted because it contains a member.
        :MEMBER_IN_GROUP, 1320,
        # MessageId: ERROR_MEMBER_NOT_IN_GROUP
        # MessageText:
        # The specified user account is not a member of the specified group account.
        :MEMBER_NOT_IN_GROUP, 1321,
        # MessageId: ERROR_LAST_ADMIN
        # MessageText:
        # This operation is disallowed as it could result in an administration account being disabled, deleted or unable
        # to logon.
        :LAST_ADMIN, 1322,
        # MessageId: ERROR_WRONG_PASSWORD
        # MessageText:
        # Unable to update the password. The value provided as the current password is incorrect.
        :WRONG_PASSWORD, 1323,
        # MessageId: ERROR_ILL_FORMED_PASSWORD
        # MessageText:
        # Unable to update the password. The value provided for the new password contains values that are not allowed in
        # passwords.
        :ILL_FORMED_PASSWORD, 1324,
        # MessageId: ERROR_PASSWORD_RESTRICTION
        # MessageText:
        # Unable to update the password. The value provided for the new password does not meet the length, complexity,
        # or history requirements of the domain.
        :PASSWORD_RESTRICTION, 1325,
        # MessageId: ERROR_LOGON_FAILURE
        # MessageText:
        # The user name or password is incorrect.
        :LOGON_FAILURE, 1326,
        # MessageId: ERROR_ACCOUNT_RESTRICTION
        # MessageText:
        # Account restrictions are preventing this user from signing in. For example: blank passwords aren't allowed,
        # sign-in times are limited, or a policy restriction has been enforced.
        :ACCOUNT_RESTRICTION, 1327,
        # MessageId: ERROR_INVALID_LOGON_HOURS
        # MessageText:
        # Your account has time restrictions that keep you from signing in right now.
        :INVALID_LOGON_HOURS, 1328,
        # MessageId: ERROR_INVALID_WORKSTATION
        # MessageText:
        # This user isn't allowed to sign in to this computer.
        :INVALID_WORKSTATION, 1329,
        # MessageId: ERROR_PASSWORD_EXPIRED
        # MessageText:
        # The password for this account has expired.
        :PASSWORD_EXPIRED, 1330,
        # MessageId: ERROR_ACCOUNT_DISABLED
        # MessageText:
        # This user can't sign in because this account is currently disabled.
        :ACCOUNT_DISABLED, 1331,
        # MessageId: ERROR_NONE_MAPPED
        # MessageText:
        # No mapping between account names and security IDs was done.
        :NONE_MAPPED, 1332,
        # MessageId: ERROR_TOO_MANY_LUIDS_REQUESTED
        # MessageText:
        # Too many local user identifiers (LUIDs) were requested at one time.
        :TOO_MANY_LUIDS_REQUESTED, 1333,
        # MessageId: ERROR_LUIDS_EXHAUSTED
        # MessageText:
        # No more local user identifiers (LUIDs) are available.
        :LUIDS_EXHAUSTED, 1334,
        # MessageId: ERROR_INVALID_SUB_AUTHORITY
        # MessageText:
        # The subauthority part of a security ID is invalid for this particular use.
        :INVALID_SUB_AUTHORITY, 1335,
        # MessageId: ERROR_INVALID_ACL
        # MessageText:
        # The access control list (ACL) structure is invalid.
        :INVALID_ACL, 1336,
        # MessageId: ERROR_INVALID_SID
        # MessageText:
        # The security ID structure is invalid.
        :INVALID_SID, 1337,
        # MessageId: ERROR_INVALID_SECURITY_DESCR
        # MessageText:
        # The security descriptor structure is invalid.
        :INVALID_SECURITY_DESCR, 1338,
        # MessageId: ERROR_BAD_INHERITANCE_ACL
        # MessageText:
        # The inherited access control list (ACL) or access control entry (ACE) could not be built.
        :BAD_INHERITANCE_ACL, 1340,
        # MessageId: ERROR_SERVER_DISABLED
        # MessageText:
        # The server is currently disabled.
        :SERVER_DISABLED, 1341,
        # MessageId: ERROR_SERVER_NOT_DISABLED
        # MessageText:
        # The server is currently enabled.
        :SERVER_NOT_DISABLED, 1342,
        # MessageId: ERROR_INVALID_ID_AUTHORITY
        # MessageText:
        # The value provided was an invalid value for an identifier authority.
        :INVALID_ID_AUTHORITY, 1343,
        # MessageId: ERROR_ALLOTTED_SPACE_EXCEEDED
        # MessageText:
        # No more memory is available for security information updates.
        :ALLOTTED_SPACE_EXCEEDED, 1344,
        # MessageId: ERROR_INVALID_GROUP_ATTRIBUTES
        # MessageText:
        # The specified attributes are invalid, or incompatible with the attributes for the group as a whole.
        :INVALID_GROUP_ATTRIBUTES, 1345,
        # MessageId: ERROR_BAD_IMPERSONATION_LEVEL
        # MessageText:
        # Either a required impersonation level was not provided, or the provided impersonation level is invalid.
        :BAD_IMPERSONATION_LEVEL, 1346,
        # MessageId: ERROR_CANT_OPEN_ANONYMOUS
        # MessageText:
        # Cannot open an anonymous level security token.
        :CANT_OPEN_ANONYMOUS, 1347,
        # MessageId: ERROR_BAD_VALIDATION_CLASS
        # MessageText:
        # The validation information class requested was invalid.
        :BAD_VALIDATION_CLASS, 1348,
        # MessageId: ERROR_BAD_TOKEN_TYPE
        # MessageText:
        # The type of the token is inappropriate for its attempted use.
        :BAD_TOKEN_TYPE, 1349,
        # MessageId: ERROR_NO_SECURITY_ON_OBJECT
        # MessageText:
        # Unable to perform a security operation on an object that has no associated security.
        :NO_SECURITY_ON_OBJECT, 1350,
        # MessageId: ERROR_CANT_ACCESS_DOMAIN_INFO
        # MessageText:
        # Configuration information could not be read from the domain controller, either because the machine is
        # unavailable, or access has been denied.
        :CANT_ACCESS_DOMAIN_INFO, 1351,
        # MessageId: ERROR_INVALID_SERVER_STATE
        # MessageText:
        # The security account manager (SAM) or local security authority (LSA) server was in the wrong state to perform
        # the security operation.
        :INVALID_SERVER_STATE, 1352,
        # MessageId: ERROR_INVALID_DOMAIN_STATE
        # MessageText:
        # The domain was in the wrong state to perform the security operation.
        :INVALID_DOMAIN_STATE, 1353,
        # MessageId: ERROR_INVALID_DOMAIN_ROLE
        # MessageText:
        # This operation is only allowed for the Primary Domain Controller of the domain.
        :INVALID_DOMAIN_ROLE, 1354,
        # MessageId: ERROR_NO_SUCH_DOMAIN
        # MessageText:
        # The specified domain either does not exist or could not be contacted.
        :NO_SUCH_DOMAIN, 1355,
        # MessageId: ERROR_DOMAIN_EXISTS
        # MessageText:
        # The specified domain already exists.
        :DOMAIN_EXISTS, 1356,
        # MessageId: ERROR_DOMAIN_LIMIT_EXCEEDED
        # MessageText:
        # An attempt was made to exceed the limit on the number of domains per server.
        :DOMAIN_LIMIT_EXCEEDED, 1357,
        # MessageId: ERROR_INTERNAL_DB_CORRUPTION
        # MessageText:
        # Unable to complete the requested operation because of either a catastrophic media failure or a data structure
        # corruption on the disk.
        :INTERNAL_DB_CORRUPTION, 1358,
        # MessageId: ERROR_INTERNAL_ERROR
        # MessageText:
        # An internal error occurred.
        :INTERNAL_ERROR, 1359,
        # MessageId: ERROR_GENERIC_NOT_MAPPED
        # MessageText:
        # Generic access types were contained in an access mask which should already be mapped to nongeneric types.
        :GENERIC_NOT_MAPPED, 1360,
        # MessageId: ERROR_BAD_DESCRIPTOR_FORMAT
        # MessageText:
        # A security descriptor is not in the right format (absolute or self-relative).
        :BAD_DESCRIPTOR_FORMAT, 1361,
        # MessageId: ERROR_NOT_LOGON_PROCESS
        # MessageText:
        # The requested action is restricted for use by logon processes only. The calling process has not registered as
        # a logon process.
        :NOT_LOGON_PROCESS, 1362,
        # MessageId: ERROR_LOGON_SESSION_EXISTS
        # MessageText:
        # Cannot start a new logon session with an ID that is already in use.
        :LOGON_SESSION_EXISTS, 1363,
        # MessageId: ERROR_NO_SUCH_PACKAGE
        # MessageText:
        # A specified authentication package is unknown.
        :NO_SUCH_PACKAGE, 1364,
        # MessageId: ERROR_BAD_LOGON_SESSION_STATE
        # MessageText:
        # The logon session is not in a state that is consistent with the requested operation.
        :BAD_LOGON_SESSION_STATE, 1365,
        # MessageId: ERROR_LOGON_SESSION_COLLISION
        # MessageText:
        # The logon session ID is already in use.
        :LOGON_SESSION_COLLISION, 1366,
        # MessageId: ERROR_INVALID_LOGON_TYPE
        # MessageText:
        # A logon request contained an invalid logon type value.
        :INVALID_LOGON_TYPE, 1367,
        # MessageId: ERROR_CANNOT_IMPERSONATE
        # MessageText:
        # Unable to impersonate using a named pipe until data has been read from that pipe.
        :CANNOT_IMPERSONATE, 1368,
        # MessageId: ERROR_RXACT_INVALID_STATE
        # MessageText:
        # The transaction state of a registry subtree is incompatible with the requested operation.
        :RXACT_INVALID_STATE, 1369,
        # MessageId: ERROR_RXACT_COMMIT_FAILURE
        # MessageText:
        # An internal security database corruption has been encountered.
        :RXACT_COMMIT_FAILURE, 1370,
        # MessageId: ERROR_SPECIAL_ACCOUNT
        # MessageText:
        # Cannot perform this operation on built-in accounts.
        :SPECIAL_ACCOUNT, 1371,
        # MessageId: ERROR_SPECIAL_GROUP
        # MessageText:
        # Cannot perform this operation on this built-in special group.
        :SPECIAL_GROUP, 1372,
        # MessageId: ERROR_SPECIAL_USER
        # MessageText:
        # Cannot perform this operation on this built-in special user.
        :SPECIAL_USER, 1373,
        # MessageId: ERROR_MEMBERS_PRIMARY_GROUP
        # MessageText:
        # The user cannot be removed from a group because the group is currently the user's primary group.
        :MEMBERS_PRIMARY_GROUP, 1374,
        # MessageId: ERROR_TOKEN_ALREADY_IN_USE
        # MessageText:
        # The token is already in use as a primary token.
        :TOKEN_ALREADY_IN_USE, 1375,
        # MessageId: ERROR_NO_SUCH_ALIAS
        # MessageText:
        # The specified local group does not exist.
        :NO_SUCH_ALIAS, 1376,
        # MessageId: ERROR_MEMBER_NOT_IN_ALIAS
        # MessageText:
        # The specified account name is not a member of the group.
        :MEMBER_NOT_IN_ALIAS, 1377,
        # MessageId: ERROR_MEMBER_IN_ALIAS
        # MessageText:
        # The specified account name is already a member of the group.
        :MEMBER_IN_ALIAS, 1378,
        # MessageId: ERROR_ALIAS_EXISTS
        # MessageText:
        # The specified local group already exists.
        :ALIAS_EXISTS, 1379,
        # MessageId: ERROR_LOGON_NOT_GRANTED
        # MessageText:
        # Logon failure: the user has not been granted the requested logon type at this computer.
        :LOGON_NOT_GRANTED, 1380,
        # MessageId: ERROR_TOO_MANY_SECRETS
        # MessageText:
        # The maximum number of secrets that may be stored in a single system has been exceeded.
        :TOO_MANY_SECRETS, 1381,
        # MessageId: ERROR_SECRET_TOO_LONG
        # MessageText:
        # The length of a secret exceeds the maximum length allowed.
        :SECRET_TOO_LONG, 1382,
        # MessageId: ERROR_INTERNAL_DB_ERROR
        # MessageText:
        # The local security authority database contains an internal inconsistency.
        :INTERNAL_DB_ERROR, 1383,
        # MessageId: ERROR_TOO_MANY_CONTEXT_IDS
        # MessageText:
        # During a logon attempt, the user's security context accumulated too many security IDs.
        :TOO_MANY_CONTEXT_IDS, 1384,
        # MessageId: ERROR_LOGON_TYPE_NOT_GRANTED
        # MessageText:
        # Logon failure: the user has not been granted the requested logon type at this computer.
        :LOGON_TYPE_NOT_GRANTED, 1385,
        # MessageId: ERROR_NT_CROSS_ENCRYPTION_REQUIRED
        # MessageText:
        # A cross-encrypted password is necessary to change a user password.
        :NT_CROSS_ENCRYPTION_REQUIRED, 1386,
        # MessageId: ERROR_NO_SUCH_MEMBER
        # MessageText:
        # A member could not be added to or removed from the local group because the member does not exist.
        :NO_SUCH_MEMBER, 1387,
        # MessageId: ERROR_INVALID_MEMBER
        # MessageText:
        # A new member could not be added to a local group because the member has the wrong account type.
        :INVALID_MEMBER, 1388,
        # MessageId: ERROR_TOO_MANY_SIDS
        # MessageText:
        # Too many security IDs have been specified.
        :TOO_MANY_SIDS, 1389,
        # MessageId: ERROR_LM_CROSS_ENCRYPTION_REQUIRED
        # MessageText:
        # A cross-encrypted password is necessary to change this user password.
        :LM_CROSS_ENCRYPTION_REQUIRED, 1390,
        # MessageId: ERROR_NO_INHERITANCE
        # MessageText:
        # Indicates an ACL contains no inheritable components.
        :NO_INHERITANCE, 1391,
        # MessageId: ERROR_FILE_CORRUPT
        # MessageText:
        # The file or directory is corrupted and unreadable.
        :FILE_CORRUPT, 1392,
        # MessageId: ERROR_DISK_CORRUPT
        # MessageText:
        # The disk structure is corrupted and unreadable.
        :DISK_CORRUPT, 1393,
        # MessageId: ERROR_NO_USER_SESSION_KEY
        # MessageText:
        # There is no user session key for the specified logon session.
        :NO_USER_SESSION_KEY, 1394,
        # MessageId: ERROR_LICENSE_QUOTA_EXCEEDED
        # MessageText:
        # The service being accessed is licensed for a particular number of connections. No more connections can be made
        # to the service at this time because there are already as many connections as the service can accept.
        :LICENSE_QUOTA_EXCEEDED, 1395,
        # MessageId: ERROR_WRONG_TARGET_NAME
        # MessageText:
        # The target account name is incorrect.
        :WRONG_TARGET_NAME, 1396,
        # MessageId: ERROR_MUTUAL_AUTH_FAILED
        # MessageText:
        # Mutual Authentication failed. The server's password is out of date at the domain controller.
        :MUTUAL_AUTH_FAILED, 1397,
        # MessageId: ERROR_TIME_SKEW
        # MessageText:
        # There is a time and/or date difference between the client and server.
        :TIME_SKEW, 1398,
        # MessageId: ERROR_CURRENT_DOMAIN_NOT_ALLOWED
        # MessageText:
        # This operation cannot be performed on the current domain.
        :CURRENT_DOMAIN_NOT_ALLOWED, 1399,
    )
    remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end