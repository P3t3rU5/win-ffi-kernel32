module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        # Define the severity codes
        #=== RPC Error codes 1700 to 1999 ===#
        # MessageId: RPC_S_INVALID_STRING_BINDING
        # MessageText:
        # The string binding is invalid.
        :RPC_S_INVALID_STRING_BINDING, 1700,
        # MessageId: RPC_S_WRONG_KIND_OF_BINDING
        # MessageText:
        # The binding handle is not the correct type.
        :RPC_S_WRONG_KIND_OF_BINDING, 1701,
        # MessageId: RPC_S_INVALID_BINDING
        # MessageText:
        # The binding handle is invalid.
        :RPC_S_INVALID_BINDING, 1702,
        # MessageId: RPC_S_PROTSEQ_NOT_SUPPORTED
        # MessageText:
        # The RPC protocol sequence is not supported.
        :RPC_S_PROTSEQ_NOT_SUPPORTED, 1703,
        # MessageId: RPC_S_INVALID_RPC_PROTSEQ
        # MessageText:
        # The RPC protocol sequence is invalid.
        :RPC_S_INVALID_RPC_PROTSEQ, 1704,
        # MessageId: RPC_S_INVALID_STRING_UUID
        # MessageText:
        # The string universal unique identifier (UUID) is invalid.
        :RPC_S_INVALID_STRING_UUID, 1705,
        # MessageId: RPC_S_INVALID_ENDPOINT_FORMAT
        # MessageText:
        # The endpoint format is invalid.
        :RPC_S_INVALID_ENDPOINT_FORMAT, 1706,
        # MessageId: RPC_S_INVALID_NET_ADDR
        # MessageText:
        # The network address is invalid.
        :RPC_S_INVALID_NET_ADDR, 1707,
        # MessageId: RPC_S_NO_ENDPOINT_FOUND
        # MessageText:
        # No endpoint was found.
        :RPC_S_NO_ENDPOINT_FOUND, 1708,
        # MessageId: RPC_S_INVALID_TIMEOUT
        # MessageText:
        # The timeout value is invalid.
        :RPC_S_INVALID_TIMEOUT, 1709,
        # MessageId: RPC_S_OBJECT_NOT_FOUND
        # MessageText:
        # The object universal unique identifier (UUID) was not found.
        :RPC_S_OBJECT_NOT_FOUND, 1710,
        # MessageId: RPC_S_ALREADY_REGISTERED
        # MessageText:
        # The object universal unique identifier (UUID) has already been registered.
        :RPC_S_ALREADY_REGISTERED, 1711,
        # MessageId: RPC_S_TYPE_ALREADY_REGISTERED
        # MessageText:
        # The type universal unique identifier (UUID) has already been registered.
        :RPC_S_TYPE_ALREADY_REGISTERED, 1712,
        # MessageId: RPC_S_ALREADY_LISTENING
        # MessageText:
        # The RPC server is already listening.
        :RPC_S_ALREADY_LISTENING, 1713,
        # MessageId: RPC_S_NO_PROTSEQS_REGISTERED
        # MessageText:
        # No protocol sequences have been registered.
        :RPC_S_NO_PROTSEQS_REGISTERED, 1714,
        # MessageId: RPC_S_NOT_LISTENING
        # MessageText:
        # The RPC server is not listening.
        :RPC_S_NOT_LISTENING, 1715,
        # MessageId: RPC_S_UNKNOWN_MGR_TYPE
        # MessageText:
        # The manager type is unknown.
        :RPC_S_UNKNOWN_MGR_TYPE, 1716,
        # MessageId: RPC_S_UNKNOWN_IF
        # MessageText:
        # The interface is unknown.
        :RPC_S_UNKNOWN_IF, 1717,
        # MessageId: RPC_S_NO_BINDINGS
        # MessageText:
        # There are no bindings.
        :RPC_S_NO_BINDINGS, 1718,
        # MessageId: RPC_S_NO_PROTSEQS
        # MessageText:
        # There are no protocol sequences.
        :RPC_S_NO_PROTSEQS, 1719,
        # MessageId: RPC_S_CANT_CREATE_ENDPOINT
        # MessageText:
        # The endpoint cannot be created.
        :RPC_S_CANT_CREATE_ENDPOINT, 1720,
        # MessageId: RPC_S_OUT_OF_RESOURCES
        # MessageText:
        # Not enough resources are available to complete this operation.
        :RPC_S_OUT_OF_RESOURCES, 1721,
        # MessageId: RPC_S_SERVER_UNAVAILABLE
        # MessageText:
        # The RPC server is unavailable.
        :RPC_S_SERVER_UNAVAILABLE, 1722,
        # MessageId: RPC_S_SERVER_TOO_BUSY
        # MessageText:
        # The RPC server is too busy to complete this operation.
        :RPC_S_SERVER_TOO_BUSY, 1723,
        # MessageId: RPC_S_INVALID_NETWORK_OPTIONS
        # MessageText:
        # The network options are invalid.
        :RPC_S_INVALID_NETWORK_OPTIONS, 1724,
        # MessageId: RPC_S_NO_CALL_ACTIVE
        # MessageText:
        # There are no remote procedure calls active on this thread.
        :RPC_S_NO_CALL_ACTIVE, 1725,
        # MessageId: RPC_S_CALL_FAILED
        # MessageText:
        # The remote procedure call failed.
        :RPC_S_CALL_FAILED, 1726,
        # MessageId: RPC_S_CALL_FAILED_DNE
        # MessageText:
        # The remote procedure call failed and did not execute.
        :RPC_S_CALL_FAILED_DNE, 1727,
        # MessageId: RPC_S_PROTOCOL_ERROR
        # MessageText:
        # A remote procedure call (RPC) protocol error occurred.
        :RPC_S_PROTOCOL_ERROR, 1728,
        # MessageId: RPC_S_PROXY_ACCESS_DENIED
        # MessageText:
        # Access to the HTTP proxy is denied.
        :RPC_S_PROXY_ACCESS_DENIED, 1729,
        # MessageId: RPC_S_UNSUPPORTED_TRANS_SYN
        # MessageText:
        # The transfer syntax is not supported by the RPC server.
        :RPC_S_UNSUPPORTED_TRANS_SYN, 1730,
        # MessageId: RPC_S_UNSUPPORTED_TYPE
        # MessageText:
        # The universal unique identifier (UUID) type is not supported.
        :RPC_S_UNSUPPORTED_TYPE, 1732,
        # MessageId: RPC_S_INVALID_TAG
        # MessageText:
        # The tag is invalid.
        :RPC_S_INVALID_TAG, 1733,
        # MessageId: RPC_S_INVALID_BOUND
        # MessageText:
        # The array bounds are invalid.
        :RPC_S_INVALID_BOUND, 1734,
        # MessageId: RPC_S_NO_ENTRY_NAME
        # MessageText:
        # The binding does not contain an entry name.
        :RPC_S_NO_ENTRY_NAME, 1735,
        # MessageId: RPC_S_INVALID_NAME_SYNTAX
        # MessageText:
        # The name syntax is invalid.
        :RPC_S_INVALID_NAME_SYNTAX, 1736,
        # MessageId: RPC_S_UNSUPPORTED_NAME_SYNTAX
        # MessageText:
        # The name syntax is not supported.
        :RPC_S_UNSUPPORTED_NAME_SYNTAX, 1737,
        # MessageId: RPC_S_UUID_NO_ADDRESS
        # MessageText:
        # No network address is available to use to construct a universal unique identifier (UUID).
        :RPC_S_UUID_NO_ADDRESS, 1739,
        # MessageId: RPC_S_DUPLICATE_ENDPOINT
        # MessageText:
        # The endpoint is a duplicate.
        :RPC_S_DUPLICATE_ENDPOINT, 1740,
        # MessageId: RPC_S_UNKNOWN_AUTHN_TYPE
        # MessageText:
        # The authentication type is unknown.
        :RPC_S_UNKNOWN_AUTHN_TYPE, 1741,
        # MessageId: RPC_S_MAX_CALLS_TOO_SMALL
        # MessageText:
        # The maximum number of calls is too small.
        :RPC_S_MAX_CALLS_TOO_SMALL, 1742,
        # MessageId: RPC_S_STRING_TOO_LONG
        # MessageText:
        # The string is too long.
        :RPC_S_STRING_TOO_LONG, 1743,
        # MessageId: RPC_S_PROTSEQ_NOT_FOUND
        # MessageText:
        # The RPC protocol sequence was not found.
        :RPC_S_PROTSEQ_NOT_FOUND, 1744,
        # MessageId: RPC_S_PROCNUM_OUT_OF_RANGE
        # MessageText:
        # The procedure number is out of range.
        :RPC_S_PROCNUM_OUT_OF_RANGE, 1745,
        # MessageId: RPC_S_BINDING_HAS_NO_AUTH
        # MessageText:
        # The binding does not contain any authentication information.
        :RPC_S_BINDING_HAS_NO_AUTH, 1746,
        # MessageId: RPC_S_UNKNOWN_AUTHN_SERVICE
        # MessageText:
        # The authentication service is unknown.
        :RPC_S_UNKNOWN_AUTHN_SERVICE, 1747,
        # MessageId: RPC_S_UNKNOWN_AUTHN_LEVEL
        # MessageText:
        # The authentication level is unknown.
        :RPC_S_UNKNOWN_AUTHN_LEVEL, 1748,
        # MessageId: RPC_S_INVALID_AUTH_IDENTITY
        # MessageText:
        # The security context is invalid.
        :RPC_S_INVALID_AUTH_IDENTITY, 1749,
        # MessageId: RPC_S_UNKNOWN_AUTHZ_SERVICE
        # MessageText:
        # The authorization service is unknown.
        :RPC_S_UNKNOWN_AUTHZ_SERVICE, 1750,
        # MessageId: EPT_S_INVALID_ENTRY
        # MessageText:
        # The entry is invalid.
        :EPT_S_INVALID_ENTRY, 1751,
        # MessageId: EPT_S_CANT_PERFORM_OP
        # MessageText:
        # The server endpoint cannot perform the operation.
        :EPT_S_CANT_PERFORM_OP, 1752,
        # MessageId: EPT_S_NOT_REGISTERED
        # MessageText:
        # There are no more endpoints available from the endpoint mapper.
        :EPT_S_NOT_REGISTERED, 1753,
        # MessageId: RPC_S_NOTHING_TO_EXPORT
        # MessageText:
        # No interfaces have been exported.
        :RPC_S_NOTHING_TO_EXPORT, 1754,
        # MessageId: RPC_S_INCOMPLETE_NAME
        # MessageText:
        # The entry name is incomplete.
        :RPC_S_INCOMPLETE_NAME, 1755,
        # MessageId: RPC_S_INVALID_VERS_OPTION
        # MessageText:
        # The version option is invalid.
        :RPC_S_INVALID_VERS_OPTION, 1756,
        # MessageId: RPC_S_NO_MORE_MEMBERS
        # MessageText:
        # There are no more members.
        :RPC_S_NO_MORE_MEMBERS, 1757,
        # MessageId: RPC_S_NOT_ALL_OBJS_UNEXPORTED
        # MessageText:
        # There is nothing to unexport.
        :RPC_S_NOT_ALL_OBJS_UNEXPORTED, 1758,
        # MessageId: RPC_S_INTERFACE_NOT_FOUND
        # MessageText:
        # The interface was not found.
        :RPC_S_INTERFACE_NOT_FOUND, 1759,
        # MessageId: RPC_S_ENTRY_ALREADY_EXISTS
        # MessageText:
        # The entry already exists.
        :RPC_S_ENTRY_ALREADY_EXISTS, 1760,
        # MessageId: RPC_S_ENTRY_NOT_FOUND
        # MessageText:
        # The entry is not found.
        :RPC_S_ENTRY_NOT_FOUND, 1761,
        # MessageId: RPC_S_NAME_SERVICE_UNAVAILABLE
        # MessageText:
        # The name service is unavailable.
        :RPC_S_NAME_SERVICE_UNAVAILABLE, 1762,
        # MessageId: RPC_S_INVALID_NAF_ID
        # MessageText:
        # The network address family is invalid.
        :RPC_S_INVALID_NAF_ID, 1763,
        # MessageId: RPC_S_CANNOT_SUPPORT
        # MessageText:
        # The requested operation is not supported.
        :RPC_S_CANNOT_SUPPORT, 1764,
        # MessageId: RPC_S_NO_CONTEXT_AVAILABLE
        # MessageText:
        # No security context is available to allow impersonation.
        :RPC_S_NO_CONTEXT_AVAILABLE, 1765,
        # MessageId: RPC_S_INTERNAL_ERROR
        # MessageText:
        # An internal error occurred in a remote procedure call (RPC).
        :RPC_S_INTERNAL_ERROR, 1766,
        # MessageId: RPC_S_ZERO_DIVIDE
        # MessageText:
        # The RPC server attempted an integer division by zero.
        :RPC_S_ZERO_DIVIDE, 1767,
        # MessageId: RPC_S_ADDRESS_ERROR
        # MessageText:
        # An addressing error occurred in the RPC server.
        :RPC_S_ADDRESS_ERROR, 1768,
        # MessageId: RPC_S_FP_DIV_ZERO
        # MessageText:
        # A floating-point operation at the RPC server caused a division by zero.
        :RPC_S_FP_DIV_ZERO, 1769,
        # MessageId: RPC_S_FP_UNDERFLOW
        # MessageText:
        # A floating-point underflow occurred at the RPC server.
        :RPC_S_FP_UNDERFLOW, 1770,
        # MessageId: RPC_S_FP_OVERFLOW
        # MessageText:
        # A floating-point overflow occurred at the RPC server.
        :RPC_S_FP_OVERFLOW, 1771,
        # MessageId: RPC_X_NO_MORE_ENTRIES
        # MessageText:
        # The list of RPC servers available for the binding of auto handles has been exhausted.
        :RPC_X_NO_MORE_ENTRIES, 1772,
        # MessageId: RPC_X_SS_CHAR_TRANS_OPEN_FAIL
        # MessageText:
        # Unable to open the character translation table file.
        :RPC_X_SS_CHAR_TRANS_OPEN_FAIL, 1773,
        # MessageId: RPC_X_SS_CHAR_TRANS_SHORT_FILE
        # MessageText:
        # The file containing the character translation table has fewer than 512 bytes.
        :RPC_X_SS_CHAR_TRANS_SHORT_FILE, 1774,
        # MessageId: RPC_X_SS_IN_NULL_CONTEXT
        # MessageText:
        # A null context handle was passed from the client to the host during a remote procedure call.
        :RPC_X_SS_IN_NULL_CONTEXT, 1775,
        # MessageId: RPC_X_SS_CONTEXT_DAMAGED
        # MessageText:
        # The context handle changed during a remote procedure call.
        :RPC_X_SS_CONTEXT_DAMAGED, 1777,
        # MessageId: RPC_X_SS_HANDLES_MISMATCH
        # MessageText:
        # The binding handles passed to a remote procedure call do not match.
        :RPC_X_SS_HANDLES_MISMATCH, 1778,
        # MessageId: RPC_X_SS_CANNOT_GET_CALL_HANDLE
        # MessageText:
        # The stub is unable to get the remote procedure call handle.
        :RPC_X_SS_CANNOT_GET_CALL_HANDLE, 1779,
        # MessageId: RPC_X_NULL_REF_POINTER
        # MessageText:
        # A null reference pointer was passed to the stub.
        :RPC_X_NULL_REF_POINTER, 1780,
        # MessageId: RPC_X_ENUM_VALUE_OUT_OF_RANGE
        # MessageText:
        # The enumeration value is out of range.
        :RPC_X_ENUM_VALUE_OUT_OF_RANGE, 1781,
        # MessageId: RPC_X_BYTE_COUNT_TOO_SMALL
        # MessageText:
        # The byte count is too small.
        :RPC_X_BYTE_COUNT_TOO_SMALL, 1782,
        # MessageId: RPC_X_BAD_STUB_DATA
        # MessageText:
        # The stub received bad data.
        :RPC_X_BAD_STUB_DATA, 1783,
        # MessageId: ERROR_INVALID_USER_BUFFER
        # MessageText:
        # The supplied user buffer is not valid for the requested operation.
        :INVALID_USER_BUFFER, 1784,
        # MessageId: ERROR_UNRECOGNIZED_MEDIA
        # MessageText:
        # The disk media is not recognized. It may not be formatted.
        :UNRECOGNIZED_MEDIA, 1785,
        # MessageId: ERROR_NO_TRUST_LSA_SECRET
        # MessageText:
        # The workstation does not have a trust secret.
        :NO_TRUST_LSA_SECRET, 1786,
        # MessageId: ERROR_NO_TRUST_SAM_ACCOUNT
        # MessageText:
        # The security database on the server does not have a computer account for this workstation trust relationship.
        :NO_TRUST_SAM_ACCOUNT, 1787,
        # MessageId: ERROR_TRUSTED_DOMAIN_FAILURE
        # MessageText:
        # The trust relationship between the primary domain and the trusted domain failed.
        :TRUSTED_DOMAIN_FAILURE, 1788,
        # MessageId: ERROR_TRUSTED_RELATIONSHIP_FAILURE
        # MessageText:
        # The trust relationship between this workstation and the primary domain failed.
        :TRUSTED_RELATIONSHIP_FAILURE, 1789,
        # MessageId: ERROR_TRUST_FAILURE
        # MessageText:
        # The network logon failed.
        :TRUST_FAILURE, 1790,
        # MessageId: RPC_S_CALL_IN_PROGRESS
        # MessageText:
        # A remote procedure call is already in progress for this thread.
        :RPC_S_CALL_IN_PROGRESS, 1791,
        # MessageId: ERROR_NETLOGON_NOT_STARTED
        # MessageText:
        # An attempt was made to logon, but the network logon service was not started.
        :NETLOGON_NOT_STARTED, 1792,
        # MessageId: ERROR_ACCOUNT_EXPIRED
        # MessageText:
        # The user's account has expired.
        :ACCOUNT_EXPIRED, 1793,
        # MessageId: ERROR_REDIRECTOR_HAS_OPEN_HANDLES
        # MessageText:
        # The redirector is in use and cannot be unloaded.
        :REDIRECTOR_HAS_OPEN_HANDLES, 1794,
        # MessageId: ERROR_PRINTER_DRIVER_ALREADY_INSTALLED
        # MessageText:
        # The specified printer driver is already installed.
        :PRINTER_DRIVER_ALREADY_INSTALLED, 1795,
        # MessageId: ERROR_UNKNOWN_PORT
        # MessageText:
        # The specified port is unknown.
        :UNKNOWN_PORT, 1796,
        # MessageId: ERROR_UNKNOWN_PRINTER_DRIVER
        # MessageText:
        # The printer driver is unknown.
        :UNKNOWN_PRINTER_DRIVER, 1797,
        # MessageId: ERROR_UNKNOWN_PRINTPROCESSOR
        # MessageText:
        # The print processor is unknown.
        :UNKNOWN_PRINTPROCESSOR, 1798,
        # MessageId: ERROR_INVALID_SEPARATOR_FILE
        # MessageText:
        # The specified separator file is invalid.
        :INVALID_SEPARATOR_FILE, 1799,
        # MessageId: ERROR_INVALID_PRIORITY
        # MessageText:
        # The specified priority is invalid.
        :INVALID_PRIORITY, 1800,
        # MessageId: ERROR_INVALID_PRINTER_NAME
        # MessageText:
        # The printer name is invalid.
        :INVALID_PRINTER_NAME, 1801,
        # MessageId: ERROR_PRINTER_ALREADY_EXISTS
        # MessageText:
        # The printer already exists.
        :PRINTER_ALREADY_EXISTS, 1802,
        # MessageId: ERROR_INVALID_PRINTER_COMMAND
        # MessageText:
        # The printer command is invalid.
        :INVALID_PRINTER_COMMAND, 1803,
        # MessageId: ERROR_INVALID_DATATYPE
        # MessageText:
        # The specified datatype is invalid.
        :INVALID_DATATYPE, 1804,
        # MessageId: ERROR_INVALID_ENVIRONMENT
        # MessageText:
        # The environment specified is invalid.
        :INVALID_ENVIRONMENT, 1805,
        # MessageId: RPC_S_NO_MORE_BINDINGS
        # MessageText:
        # There are no more bindings.
        :RPC_S_NO_MORE_BINDINGS, 1806,
        # MessageId: ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT
        # MessageText:
        # The account used is an interdomain trust account. Use your global user account or local user account to access this server.
        :NOLOGON_INTERDOMAIN_TRUST_ACCOUNT, 1807,
        # MessageId: ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT
        # MessageText:
        # The account used is a computer account. Use your global user account or local user account to access this server.
        :NOLOGON_WORKSTATION_TRUST_ACCOUNT, 1808,
        # MessageId: ERROR_NOLOGON_SERVER_TRUST_ACCOUNT
        # MessageText:
        # The account used is a server trust account. Use your global user account or local user account to access this server.
        :NOLOGON_SERVER_TRUST_ACCOUNT, 1809,
        # MessageId: ERROR_DOMAIN_TRUST_INCONSISTENT
        # MessageText:
        # The name or security ID (SID) of the domain specified is inconsistent with the trust information for that domain.
        :DOMAIN_TRUST_INCONSISTENT, 1810,
        # MessageId: ERROR_SERVER_HAS_OPEN_HANDLES
        # MessageText:
        # The server is in use and cannot be unloaded.
        :SERVER_HAS_OPEN_HANDLES, 1811,
        # MessageId: ERROR_RESOURCE_DATA_NOT_FOUND
        # MessageText:
        # The specified image file did not contain a resource section.
        :RESOURCE_DATA_NOT_FOUND, 1812,
        # MessageId: ERROR_RESOURCE_TYPE_NOT_FOUND
        # MessageText:
        # The specified resource type cannot be found in the image file.
        :RESOURCE_TYPE_NOT_FOUND, 1813,
        # MessageId: ERROR_RESOURCE_NAME_NOT_FOUND
        # MessageText:
        # The specified resource name cannot be found in the image file.
        :RESOURCE_NAME_NOT_FOUND, 1814,
        # MessageId: ERROR_RESOURCE_LANG_NOT_FOUND
        # MessageText:
        # The specified resource language ID cannot be found in the image file.
        :RESOURCE_LANG_NOT_FOUND, 1815,
        # MessageId: ERROR_NOT_ENOUGH_QUOTA
        # MessageText:
        # Not enough quota is available to process this command.
        :NOT_ENOUGH_QUOTA, 1816,
        # MessageId: RPC_S_NO_INTERFACES
        # MessageText:
        # No interfaces have been registered.
        :RPC_S_NO_INTERFACES, 1817,
        # MessageId: RPC_S_CALL_CANCELLED
        # MessageText:
        # The remote procedure call was cancelled.
        :RPC_S_CALL_CANCELLED, 1818,
        # MessageId: RPC_S_BINDING_INCOMPLETE
        # MessageText:
        # The binding handle does not contain all required information.
        :RPC_S_BINDING_INCOMPLETE, 1819,
        # MessageId: RPC_S_COMM_FAILURE
        # MessageText:
        # A communications failure occurred during a remote procedure call.
        :RPC_S_COMM_FAILURE, 1820,
        # MessageId: RPC_S_UNSUPPORTED_AUTHN_LEVEL
        # MessageText:
        # The requested authentication level is not supported.
        :RPC_S_UNSUPPORTED_AUTHN_LEVEL, 1821,
        # MessageId: RPC_S_NO_PRINC_NAME
        # MessageText:
        # No principal name registered.
        :RPC_S_NO_PRINC_NAME, 1822,
        # MessageId: RPC_S_NOT_RPC_ERROR
        # MessageText:
        # The error specified is not a valid Windows RPC error code.
        :RPC_S_NOT_RPC_ERROR, 1823,
        # MessageId: RPC_S_UUID_LOCAL_ONLY
        # MessageText:
        # A UUID that is valid only on this computer has been allocated.
        :RPC_S_UUID_LOCAL_ONLY, 1824,
        # MessageId: RPC_S_SEC_PKG_ERROR
        # MessageText:
        # A security package specific error occurred.
        :RPC_S_SEC_PKG_ERROR, 1825,
        # MessageId: RPC_S_NOT_CANCELLED
        # MessageText:
        # Thread is not canceled.
        :RPC_S_NOT_CANCELLED, 1826,
        # MessageId: RPC_X_INVALID_ES_ACTION
        # MessageText:
        # Invalid operation on the encoding/decoding handle.
        :RPC_X_INVALID_ES_ACTION, 1827,
        # MessageId: RPC_X_WRONG_ES_VERSION
        # MessageText:
        # Incompatible version of the serializing package.
        :RPC_X_WRONG_ES_VERSION, 1828,
        # MessageId: RPC_X_WRONG_STUB_VERSION
        # MessageText:
        # Incompatible version of the RPC stub.
        :RPC_X_WRONG_STUB_VERSION, 1829,
        # MessageId: RPC_X_INVALID_PIPE_OBJECT
        # MessageText:
        # The RPC pipe object is invalid or corrupted.
        :RPC_X_INVALID_PIPE_OBJECT, 1830,
        # MessageId: RPC_X_WRONG_PIPE_ORDER
        # MessageText:
        # An invalid operation was attempted on an RPC pipe object.
        :RPC_X_WRONG_PIPE_ORDER, 1831,
        # MessageId: RPC_X_WRONG_PIPE_VERSION
        # MessageText:
        # Unsupported RPC pipe version.
        :RPC_X_WRONG_PIPE_VERSION, 1832,
        # MessageId: RPC_S_COOKIE_AUTH_FAILED
        # MessageText:
        # HTTP proxy server rejected the connection because the cookie authentication failed.
        :RPC_S_COOKIE_AUTH_FAILED, 1833,
        # MessageId: RPC_S_DO_NOT_DISTURB
        # MessageText:
        # The RPC server is suspended, and could not be resumed for this request. The call did not execute.
        :RPC_S_DO_NOT_DISTURB, 1834,
        # MessageId: RPC_S_GROUP_MEMBER_NOT_FOUND
        # MessageText:
        # The group member was not found.
        :RPC_S_GROUP_MEMBER_NOT_FOUND, 1898,
        # MessageId: EPT_S_CANT_CREATE
        # MessageText:
        # The endpoint mapper database entry could not be created.
        :EPT_S_CANT_CREATE, 1899,
        # MessageId: RPC_S_INVALID_OBJECT
        # MessageText:
        # The object universal unique identifier (UUID) is the nil UUID.
        :RPC_S_INVALID_OBJECT, 1900,
        # MessageId: ERROR_INVALID_TIME
        # MessageText:
        # The specified time is invalid.
        :INVALID_TIME, 1901,
        # MessageId: ERROR_INVALID_FORM_NAME
        # MessageText:
        # The specified form name is invalid.
        :INVALID_FORM_NAME, 1902,
        # MessageId: ERROR_INVALID_FORM_SIZE
        # MessageText:
        # The specified form size is invalid.
        :INVALID_FORM_SIZE, 1903,
        # MessageId: ERROR_ALREADY_WAITING
        # MessageText:
        # The specified printer handle is already being waited on
        :ALREADY_WAITING, 1904,
        # MessageId: ERROR_PRINTER_DELETED
        # MessageText:
        # The specified printer has been deleted.
        :PRINTER_DELETED, 1905,
        # MessageId: ERROR_INVALID_PRINTER_STATE
        # MessageText:
        # The state of the printer is invalid.
        :INVALID_PRINTER_STATE, 1906,
        # MessageId: ERROR_PASSWORD_MUST_CHANGE
        # MessageText:
        # The user's password must be changed before signing in.
        :PASSWORD_MUST_CHANGE, 1907,
        # MessageId: ERROR_DOMAIN_CONTROLLER_NOT_FOUND
        # MessageText:
        # Could not find the domain controller for this domain.
        :DOMAIN_CONTROLLER_NOT_FOUND, 1908,
        # MessageId: ERROR_ACCOUNT_LOCKED_OUT
        # MessageText:
        # The referenced account is currently locked out and may not be logged on to.
        :ACCOUNT_LOCKED_OUT, 1909,
        # MessageId: OR_INVALID_OXID
        # MessageText:
        # The object exporter specified was not found.
        :OR_INVALID_OXID, 1910,
        # MessageId: OR_INVALID_OID
        # MessageText:
        # The object specified was not found.
        :OR_INVALID_OID, 1911,
        # MessageId: OR_INVALID_SET
        # MessageText:
        # The object resolver set specified was not found.
        :OR_INVALID_SET, 1912,
        # MessageId: RPC_S_SEND_INCOMPLETE
        # MessageText:
        # Some data remains to be sent in the request buffer.
        :RPC_S_SEND_INCOMPLETE, 1913,
        # MessageId: RPC_S_INVALID_ASYNC_HANDLE
        # MessageText:
        # Invalid asynchronous remote procedure call handle.
        :RPC_S_INVALID_ASYNC_HANDLE, 1914,
        # MessageId: RPC_S_INVALID_ASYNC_CALL
        # MessageText:
        # Invalid asynchronous RPC call handle for this operation.
        :RPC_S_INVALID_ASYNC_CALL, 1915,
        # MessageId: RPC_X_PIPE_CLOSED
        # MessageText:
        # The RPC pipe object has already been closed.
        :RPC_X_PIPE_CLOSED, 1916,
        # MessageId: RPC_X_PIPE_DISCIPLINE_ERROR
        # MessageText:
        # The RPC call completed before all pipes were processed.
        :RPC_X_PIPE_DISCIPLINE_ERROR, 1917,
        # MessageId: RPC_X_PIPE_EMPTY
        # MessageText:
        # No more data is available from the RPC pipe.
        :RPC_X_PIPE_EMPTY, 1918,
        # MessageId: ERROR_NO_SITENAME
        # MessageText:
        # No site name is available for this machine.
        :NO_SITENAME, 1919,
        # MessageId: ERROR_CANT_ACCESS_FILE
        # MessageText:
        # The file cannot be accessed by the system.
        :CANT_ACCESS_FILE, 1920,
        # MessageId: ERROR_CANT_RESOLVE_FILENAME
        # MessageText:
        # The name of the file cannot be resolved by the system.
        :CANT_RESOLVE_FILENAME, 1921,
        # MessageId: RPC_S_ENTRY_TYPE_MISMATCH
        # MessageText:
        # The entry is not of the expected type.
        :RPC_S_ENTRY_TYPE_MISMATCH, 1922,
        # MessageId: RPC_S_NOT_ALL_OBJS_EXPORTED
        # MessageText:
        # Not all object UUIDs could be exported to the specified entry.
        :RPC_S_NOT_ALL_OBJS_EXPORTED, 1923,
        # MessageId: RPC_S_INTERFACE_NOT_EXPORTED
        # MessageText:
        # Interface could not be exported to the specified entry.
        :RPC_S_INTERFACE_NOT_EXPORTED, 1924,
        # MessageId: RPC_S_PROFILE_NOT_ADDED
        # MessageText:
        # The specified profile entry could not be added.
        :RPC_S_PROFILE_NOT_ADDED, 1925,
        # MessageId: RPC_S_PRF_ELT_NOT_ADDED
        # MessageText:
        # The specified profile element could not be added.
        :RPC_S_PRF_ELT_NOT_ADDED, 1926,
        # MessageId: RPC_S_PRF_ELT_NOT_REMOVED
        # MessageText:
        # The specified profile element could not be removed.
        :RPC_S_PRF_ELT_NOT_REMOVED, 1927,
        # MessageId: RPC_S_GRP_ELT_NOT_ADDED
        # MessageText:
        # The group element could not be added.
        :RPC_S_GRP_ELT_NOT_ADDED, 1928,
        # MessageId: RPC_S_GRP_ELT_NOT_REMOVED
        # MessageText:
        # The group element could not be removed.
        :RPC_S_GRP_ELT_NOT_REMOVED, 1929,
        # MessageId: ERROR_KM_DRIVER_BLOCKED
        # MessageText:
        # The printer driver is not compatible with a policy enabled on your computer that blocks NT 4.0 drivers.
        :KM_DRIVER_BLOCKED, 1930,
        # MessageId: ERROR_CONTEXT_EXPIRED
        # MessageText:
        # The context has expired and can no longer be used.
        :CONTEXT_EXPIRED, 1931,
        # MessageId: ERROR_PER_USER_TRUST_QUOTA_EXCEEDED
        # MessageText:
        # The current user's delegated trust creation quota has been exceeded.
        :PER_USER_TRUST_QUOTA_EXCEEDED, 1932,
        # MessageId: ERROR_ALL_USER_TRUST_QUOTA_EXCEEDED
        # MessageText:
        # The total delegated trust creation quota has been exceeded.
        :ALL_USER_TRUST_QUOTA_EXCEEDED, 1933,
        # MessageId: ERROR_USER_DELETE_TRUST_QUOTA_EXCEEDED
        # MessageText:
        # The current user's delegated trust deletion quota has been exceeded.
        :USER_DELETE_TRUST_QUOTA_EXCEEDED, 1934,
        # MessageId: ERROR_AUTHENTICATION_FIREWALL_FAILED
        # MessageText:
        # The computer you are signing into is protected by an authentication firewall. The specified account is not
        # allowed to authenticate to the computer.
        :AUTHENTICATION_FIREWALL_FAILED, 1935,
        # MessageId: ERROR_REMOTE_PRINT_CONNECTIONS_BLOCKED
        # MessageText:
        # Remote connections to the Print Spooler are blocked by a policy set on your machine.
        :REMOTE_PRINT_CONNECTIONS_BLOCKED, 1936,
        # MessageId: ERROR_NTLM_BLOCKED
        # MessageText:
        # Authentication failed because NTLM authentication has been disabled.
        :NTLM_BLOCKED, 1937,
        # MessageId: ERROR_PASSWORD_CHANGE_REQUIRED
        # MessageText:
        # Logon Failure: EAS policy requires that the user change their password before this operation can be performed.
        :PASSWORD_CHANGE_REQUIRED, 1938,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end