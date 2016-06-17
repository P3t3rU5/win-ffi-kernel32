module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== DNS Error codes 9000 to 9999 ===#
        # Facility DNS Error Messages
        # =============================#  DNS response codes.
        :DNS_ERROR_RCODE_NO_ERROR, 0,
        :DNS_ERROR_RESPONSE_CODES_BASE, 9000,
        #define DNS_ERROR_MASK 0x00002328
        # 9000 or DNS_ERROR_RESPONSE_CODES_BASE
        # DNS_ERROR_RCODE_FORMAT_ERROR          0x00002329
        # MessageId: DNS_ERROR_RCODE_FORMAT_ERROR
        # MessageText:
        # DNS server unable to interpret format.
        :DNS_ERROR_RCODE_FORMAT_ERROR, 9001,
        # DNS_ERROR_RCODE_SERVER_FAILURE        0x0000232a
        # MessageId: DNS_ERROR_RCODE_SERVER_FAILURE
        # MessageText:
        # DNS server failure.
        :DNS_ERROR_RCODE_SERVER_FAILURE, 9002,
        # DNS_ERROR_RCODE_NAME_ERROR            0x0000232b
        # MessageId: DNS_ERROR_RCODE_NAME_ERROR
        # MessageText:
        # DNS name does not exist.
        :DNS_ERROR_RCODE_NAME_ERROR, 9003,
        # DNS_ERROR_RCODE_NOT_IMPLEMENTED       0x0000232c
        # MessageId: DNS_ERROR_RCODE_NOT_IMPLEMENTED
        # MessageText:
        # DNS request not supported by name server.
        :DNS_ERROR_RCODE_NOT_IMPLEMENTED, 9004,
        # DNS_ERROR_RCODE_REFUSED               0x0000232d
        # MessageId: DNS_ERROR_RCODE_REFUSED
        # MessageText:
        # DNS operation refused.
        :DNS_ERROR_RCODE_REFUSED, 9005,
        # DNS_ERROR_RCODE_YXDOMAIN              0x0000232e
        # MessageId: DNS_ERROR_RCODE_YXDOMAIN
        # MessageText:
        # DNS name that ought not exist, does exist.
        :DNS_ERROR_RCODE_YXDOMAIN, 9006,
        # DNS_ERROR_RCODE_YXRRSET               0x0000232f
        # MessageId: DNS_ERROR_RCODE_YXRRSET
        # MessageText:
        # DNS RR set that ought not exist, does exist.
        :DNS_ERROR_RCODE_YXRRSET, 9007,
        # DNS_ERROR_RCODE_NXRRSET               0x00002330
        # MessageId: DNS_ERROR_RCODE_NXRRSET
        # MessageText:
        # DNS RR set that ought to exist, does not exist.
        :DNS_ERROR_RCODE_NXRRSET, 9008,
        # DNS_ERROR_RCODE_NOTAUTH               0x00002331
        # MessageId: DNS_ERROR_RCODE_NOTAUTH
        # MessageText:
        # DNS server not authoritative for zone.
        :DNS_ERROR_RCODE_NOTAUTH, 9009,
        # DNS_ERROR_RCODE_NOTZONE               0x00002332
        # MessageId: DNS_ERROR_RCODE_NOTZONE
        # MessageText:
        # DNS name in update or prereq is not in zone.
        :DNS_ERROR_RCODE_NOTZONE, 9010,
        # DNS_ERROR_RCODE_BADSIG                0x00002338
        # MessageId: DNS_ERROR_RCODE_BADSIG
        # MessageText:
        # DNS signature failed to verify.
        :DNS_ERROR_RCODE_BADSIG, 9016,
        # DNS_ERROR_RCODE_BADKEY                0x00002339
        # MessageId: DNS_ERROR_RCODE_BADKEY
        # MessageText:
        # DNS bad key.
        :DNS_ERROR_RCODE_BADKEY, 9017,
        # DNS_ERROR_RCODE_BADTIME               0x0000233a
        # MessageId: DNS_ERROR_RCODE_BADTIME
        # MessageText:
        # DNS signature validity expired.
        :DNS_ERROR_RCODE_BADTIME, 9018,
        :DNS_ERROR_RCODE_LAST,    9018,
        # DNSSEC errors
        :DNS_ERROR_DNSSEC_BASE, 9100,
        # MessageId: DNS_ERROR_KEYMASTER_REQUIRED
        # MessageText:
        # Only the DNS server acting as the key master for the zone may perform this operation.
        :DNS_ERROR_KEYMASTER_REQUIRED, 9101,
        # MessageId: DNS_ERROR_NOT_ALLOWED_ON_SIGNED_ZONE
        # MessageText:
        # This operation is not allowed on a zone that is signed or has signing keys.
        :DNS_ERROR_NOT_ALLOWED_ON_SIGNED_ZONE, 9102,
        # MessageId: DNS_ERROR_NSEC3_INCOMPATIBLE_WITH_RSA_SHA1
        # MessageText:
        # NSEC3 is not compatible with the RSA-SHA-1 algorithm. Choose a different algorithm or use NSEC.
        :DNS_ERROR_NSEC3_INCOMPATIBLE_WITH_RSA_SHA1, 9103,
        # MessageId: DNS_ERROR_NOT_ENOUGH_SIGNING_KEY_DESCRIPTORS
        # MessageText:
        # The zone does not have enough signing keys. There must be at least one key signing key (KSK) and at least one zone signing key (ZSK).
        :DNS_ERROR_NOT_ENOUGH_SIGNING_KEY_DESCRIPTORS, 9104,
        # MessageId: DNS_ERROR_UNSUPPORTED_ALGORITHM
        # MessageText:
        # The specified algorithm is not supported.
        :DNS_ERROR_UNSUPPORTED_ALGORITHM, 9105,
        # MessageId: DNS_ERROR_INVALID_KEY_SIZE
        # MessageText:
        # The specified key size is not supported.
        :DNS_ERROR_INVALID_KEY_SIZE, 9106,
        # MessageId: DNS_ERROR_SIGNING_KEY_NOT_ACCESSIBLE
        # MessageText:
        # One or more of the signing keys for a zone are not accessible to the DNS server. Zone signing will not be operational until this error is resolved.
        :DNS_ERROR_SIGNING_KEY_NOT_ACCESSIBLE, 9107,
        # MessageId: DNS_ERROR_KSP_DOES_NOT_SUPPORT_PROTECTION
        # MessageText:
        # The specified key storage provider does not support DPAPI++ data protection. Zone signing will not be operational until this error is resolved.
        :DNS_ERROR_KSP_DOES_NOT_SUPPORT_PROTECTION, 9108,
        # MessageId: DNS_ERROR_UNEXPECTED_DATA_PROTECTION_ERROR
        # MessageText:
        # An unexpected DPAPI++ error was encountered. Zone signing will not be operational until this error is resolved.
        :DNS_ERROR_UNEXPECTED_DATA_PROTECTION_ERROR, 9109,
        # MessageId: DNS_ERROR_UNEXPECTED_CNG_ERROR
        # MessageText:
        # An unexpected crypto error was encountered. Zone signing may not be operational until this error is resolved.
        :DNS_ERROR_UNEXPECTED_CNG_ERROR, 9110,
        # MessageId: DNS_ERROR_UNKNOWN_SIGNING_PARAMETER_VERSION
        # MessageText:
        # The DNS server encountered a signing key with an unknown version. Zone signing will not be operational until this error is resolved.
        :DNS_ERROR_UNKNOWN_SIGNING_PARAMETER_VERSION, 9111,
        # MessageId: DNS_ERROR_KSP_NOT_ACCESSIBLE
        # MessageText:
        # The specified key service provider cannot be opened by the DNS server.
        :DNS_ERROR_KSP_NOT_ACCESSIBLE, 9112,
        # MessageId: DNS_ERROR_TOO_MANY_SKDS
        # MessageText:
        # The DNS server cannot accept any more signing keys with the specified algorithm and KSK flag value for this zone.
        :DNS_ERROR_TOO_MANY_SKDS, 9113,
        # MessageId: DNS_ERROR_INVALID_ROLLOVER_PERIOD
        # MessageText:
        # The specified rollover period is invalid.
        :DNS_ERROR_INVALID_ROLLOVER_PERIOD, 9114,
        # MessageId: DNS_ERROR_INVALID_INITIAL_ROLLOVER_OFFSET
        # MessageText:
        # The specified initial rollover offset is invalid.
        :DNS_ERROR_INVALID_INITIAL_ROLLOVER_OFFSET, 9115,
        # MessageId: DNS_ERROR_ROLLOVER_IN_PROGRESS
        # MessageText:
        # The specified signing key is already in process of rolling over keys.
        :DNS_ERROR_ROLLOVER_IN_PROGRESS, 9116,
        # MessageId: DNS_ERROR_STANDBY_KEY_NOT_PRESENT
        # MessageText:
        # The specified signing key does not have a standby key to revoke.
        :DNS_ERROR_STANDBY_KEY_NOT_PRESENT, 9117,
        # MessageId: DNS_ERROR_NOT_ALLOWED_ON_ZSK
        # MessageText:
        # This operation is not allowed on a zone signing key (ZSK).
        :DNS_ERROR_NOT_ALLOWED_ON_ZSK, 9118,
        # MessageId: DNS_ERROR_NOT_ALLOWED_ON_ACTIVE_SKD
        # MessageText:
        # This operation is not allowed on an active signing key.
        :DNS_ERROR_NOT_ALLOWED_ON_ACTIVE_SKD, 9119,
        # MessageId: DNS_ERROR_ROLLOVER_ALREADY_QUEUED
        # MessageText:
        # The specified signing key is already queued for rollover.
        :DNS_ERROR_ROLLOVER_ALREADY_QUEUED, 9120,
        # MessageId: DNS_ERROR_NOT_ALLOWED_ON_UNSIGNED_ZONE
        # MessageText:
        # This operation is not allowed on an unsigned zone.
        :DNS_ERROR_NOT_ALLOWED_ON_UNSIGNED_ZONE, 9121,
        # MessageId: DNS_ERROR_BAD_KEYMASTER
        # MessageText:
        # This operation could not be completed because the DNS server listed as the current key master for this zone is down or misconfigured. Resolve the problem on the current key master for this zone or use another DNS server to seize the key master role.
        :DNS_ERROR_BAD_KEYMASTER, 9122,
        # MessageId: DNS_ERROR_INVALID_SIGNATURE_VALIDITY_PERIOD
        # MessageText:
        # The specified signature validity period is invalid.
        :DNS_ERROR_INVALID_SIGNATURE_VALIDITY_PERIOD, 9123,
        # MessageId: DNS_ERROR_INVALID_NSEC3_ITERATION_COUNT
        # MessageText:
        # The specified NSEC3 iteration count is higher than allowed by the minimum key length used in the zone.
        :DNS_ERROR_INVALID_NSEC3_ITERATION_COUNT, 9124,
        # MessageId: DNS_ERROR_DNSSEC_IS_DISABLED
        # MessageText:
        # This operation could not be completed because the DNS server has been configured with DNSSEC features disabled. Enable DNSSEC on the DNS server.
        :DNS_ERROR_DNSSEC_IS_DISABLED, 9125,
        # MessageId: DNS_ERROR_INVALID_XML
        # MessageText:
        # This operation could not be completed because the XML stream received is empty or syntactically invalid.
        :DNS_ERROR_INVALID_XML, 9126,
        # MessageId: DNS_ERROR_NO_VALID_TRUST_ANCHORS
        # MessageText:
        # This operation completed, but no trust anchors were added because all of the trust anchors received were either invalid, unsupported, expired, or would not become valid in less than 30 days.
        :DNS_ERROR_NO_VALID_TRUST_ANCHORS, 9127,
        # MessageId: DNS_ERROR_ROLLOVER_NOT_POKEABLE
        # MessageText:
        # The specified signing key is not waiting for parental DS update.
        :DNS_ERROR_ROLLOVER_NOT_POKEABLE, 9128,
        # MessageId: DNS_ERROR_NSEC3_NAME_COLLISION
        # MessageText:
        # Hash collision detected during NSEC3 signing. Specify a different user-provided salt, or use a randomly generated salt, and attempt to sign the zone again.
        :DNS_ERROR_NSEC3_NAME_COLLISION, 9129,
        # MessageId: DNS_ERROR_NSEC_INCOMPATIBLE_WITH_NSEC3_RSA_SHA1
        # MessageText:
        # NSEC is not compatible with the NSEC3-RSA-SHA-1 algorithm. Choose a different algorithm or use NSEC3.
        :DNS_ERROR_NSEC_INCOMPATIBLE_WITH_NSEC3_RSA_SHA1, 9130,
        # Packet format
        :DNS_ERROR_PACKET_FMT_BASE, 9500,
        # DNS_INFO_NO_RECORDS                   0x0000251d
        # MessageId: DNS_INFO_NO_RECORDS
        # MessageText:
        # No records found for given DNS query.
        :DNS_INFO_NO_RECORDS, 9501,
        # DNS_ERROR_BAD_PACKET                  0x0000251e
        # MessageId: DNS_ERROR_BAD_PACKET
        # MessageText:
        # Bad DNS packet.
        :DNS_ERROR_BAD_PACKET, 9502,
        # DNS_ERROR_NO_PACKET                   0x0000251f
        # MessageId: DNS_ERROR_NO_PACKET
        # MessageText:
        # No DNS packet.
        :DNS_ERROR_NO_PACKET, 9503,
        # DNS_ERROR_RCODE                       0x00002520
        # MessageId: DNS_ERROR_RCODE
        # MessageText:
        # DNS error, check rcode.
        :DNS_ERROR_RCODE, 9504,
        # DNS_ERROR_UNSECURE_PACKET             0x00002521
        # MessageId: DNS_ERROR_UNSECURE_PACKET
        # MessageText:
        # Unsecured DNS packet.
        :DNS_ERROR_UNSECURE_PACKET, 9505,
        :DNS_STATUS_PACKET_UNSECURE, 9505,
        # DNS_REQUEST_PENDING                     0x00002522
        # MessageId: DNS_REQUEST_PENDING
        # MessageText:
        # DNS query request is pending.
        :DNS_REQUEST_PENDING, 9506,
        # General API errors
        :DNS_ERROR_NO_MEMORY,          14,
        :DNS_ERROR_INVALID_NAME,      123,
        :DNS_ERROR_INVALID_DATA,       13,
        :DNS_ERROR_GENERAL_API_BASE, 9550,
        # DNS_ERROR_INVALID_TYPE                0x0000254f
        # MessageId: DNS_ERROR_INVALID_TYPE
        # MessageText:
        # Invalid DNS type.
        :DNS_ERROR_INVALID_TYPE, 9551,
        # DNS_ERROR_INVALID_IP_ADDRESS          0x00002550
        # MessageId: DNS_ERROR_INVALID_IP_ADDRESS
        # MessageText:
        # Invalid IP address.
        :DNS_ERROR_INVALID_IP_ADDRESS, 9552,
        # DNS_ERROR_INVALID_PROPERTY            0x00002551
        # MessageId: DNS_ERROR_INVALID_PROPERTY
        # MessageText:
        # Invalid property.
        :DNS_ERROR_INVALID_PROPERTY, 9553,
        # DNS_ERROR_TRY_AGAIN_LATER             0x00002552
        # MessageId: DNS_ERROR_TRY_AGAIN_LATER
        # MessageText:
        # Try DNS operation again later.
        :DNS_ERROR_TRY_AGAIN_LATER, 9554,
        # DNS_ERROR_NOT_UNIQUE                  0x00002553
        # MessageId: DNS_ERROR_NOT_UNIQUE
        # MessageText:
        # Record for given name and type is not unique.
        :DNS_ERROR_NOT_UNIQUE, 9555,
        # DNS_ERROR_NON_RFC_NAME                0x00002554
        # MessageId: DNS_ERROR_NON_RFC_NAME
        # MessageText:
        # DNS name does not comply with RFC specifications.
        :DNS_ERROR_NON_RFC_NAME, 9556,
        # DNS_STATUS_FQDN                       0x00002555
        # MessageId: DNS_STATUS_FQDN
        # MessageText:
        # DNS name is a fully-qualified DNS name.
        :DNS_STATUS_FQDN, 9557,
        # DNS_STATUS_DOTTED_NAME                0x00002556
        # MessageId: DNS_STATUS_DOTTED_NAME
        # MessageText:
        # DNS name is dotted (multi-label).
        :DNS_STATUS_DOTTED_NAME, 9558,
        # DNS_STATUS_SINGLE_PART_NAME           0x00002557
        # MessageId: DNS_STATUS_SINGLE_PART_NAME
        # MessageText:
        # DNS name is a single-part name.
        :DNS_STATUS_SINGLE_PART_NAME, 9559,
        # DNS_ERROR_INVALID_NAME_CHAR           0x00002558
        # MessageId: DNS_ERROR_INVALID_NAME_CHAR
        # MessageText:
        # DNS name contains an invalid character.
        :DNS_ERROR_INVALID_NAME_CHAR, 9560,
        # DNS_ERROR_NUMERIC_NAME                0x00002559
        # MessageId: DNS_ERROR_NUMERIC_NAME
        # MessageText:
        # DNS name is entirely numeric.
        :DNS_ERROR_NUMERIC_NAME, 9561,
        # DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER  0x0000255A
        # MessageId: DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER
        # MessageText:
        # The operation requested is not permitted on a DNS root server.
        :DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER, 9562,
        # DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION  0x0000255B
        # MessageId: DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION
        # MessageText:
        # The record could not be created because this part of the DNS namespace has been delegated to another server.
        :DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION, 9563,
        # DNS_ERROR_CANNOT_FIND_ROOT_HINTS  0x0000255C
        # MessageId: DNS_ERROR_CANNOT_FIND_ROOT_HINTS
        # MessageText:
        # The DNS server could not find a set of root hints.
        :DNS_ERROR_CANNOT_FIND_ROOT_HINTS, 9564,
        # DNS_ERROR_INCONSISTENT_ROOT_HINTS  0x0000255D
        # MessageId: DNS_ERROR_INCONSISTENT_ROOT_HINTS
        # MessageText:
        # The DNS server found root hints but they were not consistent across all adapters.
        :DNS_ERROR_INCONSISTENT_ROOT_HINTS, 9565,
        # DNS_ERROR_DWORD_VALUE_TOO_SMALL    0x0000255E
        # MessageId: DNS_ERROR_DWORD_VALUE_TOO_SMALL
        # MessageText:
        # The specified value is too small for this parameter.
        :DNS_ERROR_DWORD_VALUE_TOO_SMALL, 9566,
        # DNS_ERROR_DWORD_VALUE_TOO_LARGE    0x0000255F
        # MessageId: DNS_ERROR_DWORD_VALUE_TOO_LARGE
        # MessageText:
        # The specified value is too large for this parameter.
        :DNS_ERROR_DWORD_VALUE_TOO_LARGE, 9567,
        # DNS_ERROR_BACKGROUND_LOADING       0x00002560
        # MessageId: DNS_ERROR_BACKGROUND_LOADING
        # MessageText:
        # This operation is not allowed while the DNS server is loading zones in the background. Please try again later.
        :DNS_ERROR_BACKGROUND_LOADING, 9568,
        # DNS_ERROR_NOT_ALLOWED_ON_RODC      0x00002561
        # MessageId: DNS_ERROR_NOT_ALLOWED_ON_RODC
        # MessageText:
        # The operation requested is not permitted on against a DNS server running on a read-only DC.
        :DNS_ERROR_NOT_ALLOWED_ON_RODC, 9569,
        # DNS_ERROR_NOT_ALLOWED_UNDER_DNAME   0x00002562
        # MessageId: DNS_ERROR_NOT_ALLOWED_UNDER_DNAME
        # MessageText:
        # No data is allowed to exist underneath a DNAME record.
        :DNS_ERROR_NOT_ALLOWED_UNDER_DNAME, 9570,
        # DNS_ERROR_DELEGATION_REQUIRED       0x00002563
        # MessageId: DNS_ERROR_DELEGATION_REQUIRED
        # MessageText:
        # This operation requires credentials delegation.
        :DNS_ERROR_DELEGATION_REQUIRED, 9571,
        # DNS_ERROR_INVALID_POLICY_TABLE        0x00002564
        # MessageId: DNS_ERROR_INVALID_POLICY_TABLE
        # MessageText:
        # Name resolution policy table has been corrupted. DNS resolution will fail until it is fixed. Contact your network administrator.
        :DNS_ERROR_INVALID_POLICY_TABLE, 9572,
        # DNS_ERROR_ADDRESS_REQUIRED        0x00002565
        # MessageId: DNS_ERROR_ADDRESS_REQUIRED
        # MessageText:
        # Not allowed to remove all addresses.
        :DNS_ERROR_ADDRESS_REQUIRED, 9573,
        # Zone errors
        :DNS_ERROR_ZONE_BASE, 9600,
        # DNS_ERROR_ZONE_DOES_NOT_EXIST         0x00002581
        # MessageId: DNS_ERROR_ZONE_DOES_NOT_EXIST
        # MessageText:
        # DNS zone does not exist.
        :DNS_ERROR_ZONE_DOES_NOT_EXIST, 9601,
        # DNS_ERROR_NO_ZONE_INFO                0x00002582
        # MessageId: DNS_ERROR_NO_ZONE_INFO
        # MessageText:
        # DNS zone information not available.
        :DNS_ERROR_NO_ZONE_INFO, 9602,
        # DNS_ERROR_INVALID_ZONE_OPERATION      0x00002583
        # MessageId: DNS_ERROR_INVALID_ZONE_OPERATION
        # MessageText:
        # Invalid operation for DNS zone.
        :DNS_ERROR_INVALID_ZONE_OPERATION, 9603,
        # DNS_ERROR_ZONE_CONFIGURATION_ERROR    0x00002584
        # MessageId: DNS_ERROR_ZONE_CONFIGURATION_ERROR
        # MessageText:
        # Invalid DNS zone configuration.
        :DNS_ERROR_ZONE_CONFIGURATION_ERROR, 9604,
        # DNS_ERROR_ZONE_HAS_NO_SOA_RECORD      0x00002585
        # MessageId: DNS_ERROR_ZONE_HAS_NO_SOA_RECORD
        # MessageText:
        # DNS zone has no start of authority (SOA) record.
        :DNS_ERROR_ZONE_HAS_NO_SOA_RECORD, 9605,
        # DNS_ERROR_ZONE_HAS_NO_NS_RECORDS      0x00002586
        # MessageId: DNS_ERROR_ZONE_HAS_NO_NS_RECORDS
        # MessageText:
        # DNS zone has no Name Server (NS) record.
        :DNS_ERROR_ZONE_HAS_NO_NS_RECORDS, 9606,
        # DNS_ERROR_ZONE_LOCKED                 0x00002587
        # MessageId: DNS_ERROR_ZONE_LOCKED
        # MessageText:
        # DNS zone is locked.
        :DNS_ERROR_ZONE_LOCKED, 9607,
        # DNS_ERROR_ZONE_CREATION_FAILED        0x00002588
        # MessageId: DNS_ERROR_ZONE_CREATION_FAILED
        # MessageText:
        # DNS zone creation failed.
        :DNS_ERROR_ZONE_CREATION_FAILED, 9608,
        # DNS_ERROR_ZONE_ALREADY_EXISTS         0x00002589
        # MessageId: DNS_ERROR_ZONE_ALREADY_EXISTS
        # MessageText:
        # DNS zone already exists.
        :DNS_ERROR_ZONE_ALREADY_EXISTS, 9609,
        # DNS_ERROR_AUTOZONE_ALREADY_EXISTS     0x0000258a
        # MessageId: DNS_ERROR_AUTOZONE_ALREADY_EXISTS
        # MessageText:
        # DNS automatic zone already exists.
        :DNS_ERROR_AUTOZONE_ALREADY_EXISTS, 9610,
        # DNS_ERROR_INVALID_ZONE_TYPE           0x0000258b
        # MessageId: DNS_ERROR_INVALID_ZONE_TYPE
        # MessageText:
        # Invalid DNS zone type.
        :DNS_ERROR_INVALID_ZONE_TYPE, 9611,
        # DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP 0x0000258c
        # MessageId: DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP
        # MessageText:
        # Secondary DNS zone requires master IP address.
        :DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP, 9612,
        # DNS_ERROR_ZONE_NOT_SECONDARY          0x0000258d
        # MessageId: DNS_ERROR_ZONE_NOT_SECONDARY
        # MessageText:
        # DNS zone not secondary.
        :DNS_ERROR_ZONE_NOT_SECONDARY, 9613,
        # DNS_ERROR_NEED_SECONDARY_ADDRESSES    0x0000258e
        # MessageId: DNS_ERROR_NEED_SECONDARY_ADDRESSES
        # MessageText:
        # Need secondary IP address.
        :DNS_ERROR_NEED_SECONDARY_ADDRESSES, 9614,
        # DNS_ERROR_WINS_INIT_FAILED            0x0000258f
        # MessageId: DNS_ERROR_WINS_INIT_FAILED
        # MessageText:
        # WINS initialization failed.
        :DNS_ERROR_WINS_INIT_FAILED, 9615,
        # DNS_ERROR_NEED_WINS_SERVERS           0x00002590
        # MessageId: DNS_ERROR_NEED_WINS_SERVERS
        # MessageText:
        # Need WINS servers.
        :DNS_ERROR_NEED_WINS_SERVERS, 9616,
        # DNS_ERROR_NBSTAT_INIT_FAILED          0x00002591
        # MessageId: DNS_ERROR_NBSTAT_INIT_FAILED
        # MessageText:
        # NBTSTAT initialization call failed.
        :DNS_ERROR_NBSTAT_INIT_FAILED, 9617,
        # DNS_ERROR_SOA_DELETE_INVALID          0x00002592
        # MessageId: DNS_ERROR_SOA_DELETE_INVALID
        # MessageText:
        # Invalid delete of start of authority (SOA)
        :DNS_ERROR_SOA_DELETE_INVALID, 9618,
        # DNS_ERROR_FORWARDER_ALREADY_EXISTS    0x00002593
        # MessageId: DNS_ERROR_FORWARDER_ALREADY_EXISTS
        # MessageText:
        # A conditional forwarding zone already exists for that name.
        :DNS_ERROR_FORWARDER_ALREADY_EXISTS, 9619,
        # DNS_ERROR_ZONE_REQUIRES_MASTER_IP     0x00002594
        # MessageId: DNS_ERROR_ZONE_REQUIRES_MASTER_IP
        # MessageText:
        # This zone must be configured with one or more master DNS server IP addresses.
        :DNS_ERROR_ZONE_REQUIRES_MASTER_IP, 9620,
        # DNS_ERROR_ZONE_IS_SHUTDOWN            0x00002595
        # MessageId: DNS_ERROR_ZONE_IS_SHUTDOWN
        # MessageText:
        # The operation cannot be performed because this zone is shut down.
        :DNS_ERROR_ZONE_IS_SHUTDOWN, 9621,
        # DNS_ERROR_ZONE_LOCKED_FOR_SIGNING     0x00002596
        # MessageId: DNS_ERROR_ZONE_LOCKED_FOR_SIGNING
        # MessageText:
        # This operation cannot be performed because the zone is currently being signed. Please try again later.
        :DNS_ERROR_ZONE_LOCKED_FOR_SIGNING, 9622,
        # Datafile errors
        :DNS_ERROR_DATAFILE_BASE, 9650,
        # DNS                                   0x000025b3
        # MessageId: DNS_ERROR_PRIMARY_REQUIRES_DATAFILE
        # MessageText:
        # Primary DNS zone requires datafile.
        :DNS_ERROR_PRIMARY_REQUIRES_DATAFILE, 9651,
        # DNS                                   0x000025b4
        # MessageId: DNS_ERROR_INVALID_DATAFILE_NAME
        # MessageText:
        # Invalid datafile name for DNS zone.
        :DNS_ERROR_INVALID_DATAFILE_NAME, 9652,
        # DNS                                   0x000025b5
        # MessageId: DNS_ERROR_DATAFILE_OPEN_FAILURE
        # MessageText:
        # Failed to open datafile for DNS zone.
        :DNS_ERROR_DATAFILE_OPEN_FAILURE, 9653,
        # DNS                                   0x000025b6
        # MessageId: DNS_ERROR_FILE_WRITEBACK_FAILED
        # MessageText:
        # Failed to write datafile for DNS zone.
        :DNS_ERROR_FILE_WRITEBACK_FAILED, 9654,
        # DNS                                   0x000025b7
        # MessageId: DNS_ERROR_DATAFILE_PARSING
        # MessageText:
        # Failure while reading datafile for DNS zone.
        :DNS_ERROR_DATAFILE_PARSING, 9655,
        # Database errors
        :DNS_ERROR_DATABASE_BASE, 9700,
        # DNS_ERROR_RECORD_DOES_NOT_EXIST       0x000025e5
        # MessageId: DNS_ERROR_RECORD_DOES_NOT_EXIST
        # MessageText:
        # DNS record does not exist.
        :DNS_ERROR_RECORD_DOES_NOT_EXIST, 9701,
        # DNS_ERROR_RECORD_FORMAT               0x000025e6
        # MessageId: DNS_ERROR_RECORD_FORMAT
        # MessageText:
        # DNS record format error.
        :DNS_ERROR_RECORD_FORMAT, 9702,
        # DNS_ERROR_NODE_CREATION_FAILED        0x000025e7
        # MessageId: DNS_ERROR_NODE_CREATION_FAILED
        # MessageText:
        # Node creation failure in DNS.
        :DNS_ERROR_NODE_CREATION_FAILED, 9703,
        # DNS_ERROR_UNKNOWN_RECORD_TYPE         0x000025e8
        # MessageId: DNS_ERROR_UNKNOWN_RECORD_TYPE
        # MessageText:
        # Unknown DNS record type.
        :DNS_ERROR_UNKNOWN_RECORD_TYPE, 9704,
        # DNS_ERROR_RECORD_TIMED_OUT            0x000025e9
        # MessageId: DNS_ERROR_RECORD_TIMED_OUT
        # MessageText:
        # DNS record timed out.
        :DNS_ERROR_RECORD_TIMED_OUT, 9705,
        # DNS_ERROR_NAME_NOT_IN_ZONE            0x000025ea
        # MessageId: DNS_ERROR_NAME_NOT_IN_ZONE
        # MessageText:
        # Name not in DNS zone.
        :DNS_ERROR_NAME_NOT_IN_ZONE, 9706,
        # DNS_ERROR_CNAME_LOOP                  0x000025eb
        # MessageId: DNS_ERROR_CNAME_LOOP
        # MessageText:
        # CNAME loop detected.
        :DNS_ERROR_CNAME_LOOP, 9707,
        # DNS_ERROR_NODE_IS_CNAME               0x000025ec
        # MessageId: DNS_ERROR_NODE_IS_CNAME
        # MessageText:
        # Node is a CNAME DNS record.
        :DNS_ERROR_NODE_IS_CNAME, 9708,
        # DNS_ERROR_CNAME_COLLISION             0x000025ed
        # MessageId: DNS_ERROR_CNAME_COLLISION
        # MessageText:
        # A CNAME record already exists for given name.
        :DNS_ERROR_CNAME_COLLISION, 9709,
        # DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT    0x000025ee
        # MessageId: DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT
        # MessageText:
        # Record only at DNS zone root.
        :DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT, 9710,
        # DNS_ERROR_RECORD_ALREADY_EXISTS       0x000025ef
        # MessageId: DNS_ERROR_RECORD_ALREADY_EXISTS
        # MessageText:
        # DNS record already exists.
        :DNS_ERROR_RECORD_ALREADY_EXISTS, 9711,
        # DNS_ERROR_SECONDARY_DATA              0x000025f0
        # MessageId: DNS_ERROR_SECONDARY_DATA
        # MessageText:
        # Secondary DNS zone data error.
        :DNS_ERROR_SECONDARY_DATA, 9712,
        # DNS_ERROR_NO_CREATE_CACHE_DATA        0x000025f1
        # MessageId: DNS_ERROR_NO_CREATE_CACHE_DATA
        # MessageText:
        # Could not create DNS cache data.
        :DNS_ERROR_NO_CREATE_CACHE_DATA, 9713,
        # DNS_ERROR_NAME_DOES_NOT_EXIST         0x000025f2
        # MessageId: DNS_ERROR_NAME_DOES_NOT_EXIST
        # MessageText:
        # DNS name does not exist.
        :DNS_ERROR_NAME_DOES_NOT_EXIST, 9714,
        # DNS_WARNING_PTR_CREATE_FAILED         0x000025f3
        # MessageId: DNS_WARNING_PTR_CREATE_FAILED
        # MessageText:
        # Could not create pointer (PTR) record.
        :DNS_WARNING_PTR_CREATE_FAILED, 9715,
        # DNS_WARNING_DOMAIN_UNDELETED          0x000025f4
        # MessageId: DNS_WARNING_DOMAIN_UNDELETED
        # MessageText:
        # DNS domain was undeleted.
        :DNS_WARNING_DOMAIN_UNDELETED, 9716,
        # DNS_ERROR_DS_UNAVAILABLE              0x000025f5
        # MessageId: DNS_ERROR_DS_UNAVAILABLE
        # MessageText:
        # The directory service is unavailable.
        :DNS_ERROR_DS_UNAVAILABLE, 9717,
        # DNS_ERROR_DS_ZONE_ALREADY_EXISTS      0x000025f6
        # MessageId: DNS_ERROR_DS_ZONE_ALREADY_EXISTS
        # MessageText:
        # DNS zone already exists in the directory service.
        :DNS_ERROR_DS_ZONE_ALREADY_EXISTS, 9718,
        # DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE      0x000025f7
        # MessageId: DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE
        # MessageText:
        # DNS server not creating or reading the boot file for the directory service integrated DNS zone.
        :DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE, 9719,
        # DNS_ERROR_NODE_IS_DNAME               0x000025f8
        # MessageId: DNS_ERROR_NODE_IS_DNAME
        # MessageText:
        # Node is a DNAME DNS record.
        :DNS_ERROR_NODE_IS_DNAME, 9720,
        # DNS_ERROR_DNAME_COLLISION             0x000025f9
        # MessageId: DNS_ERROR_DNAME_COLLISION
        # MessageText:
        # A DNAME record already exists for given name.
        :DNS_ERROR_DNAME_COLLISION, 9721,
        # DNS_ERROR_ALIAS_LOOP                  0x000025fa
        # MessageId: DNS_ERROR_ALIAS_LOOP
        # MessageText:
        # An alias loop has been detected with either CNAME or DNAME records.
        :DNS_ERROR_ALIAS_LOOP, 9722,
        # Operation errors
        :DNS_ERROR_OPERATION_BASE, 9750,
        # DNS_INFO_AXFR_COMPLETE                0x00002617
        # MessageId: DNS_INFO_AXFR_COMPLETE
        # MessageText:
        # DNS AXFR (zone transfer) complete.
        :DNS_INFO_AXFR_COMPLETE, 9751,
        # DNS_ERROR_AXFR                        0x00002618
        # MessageId: DNS_ERROR_AXFR
        # MessageText:
        # DNS zone transfer failed.
        :DNS_ERROR_AXFR, 9752,
        # DNS_INFO_ADDED_LOCAL_WINS             0x00002619
        # MessageId: DNS_INFO_ADDED_LOCAL_WINS
        # MessageText:
        # Added local WINS server.
        :DNS_INFO_ADDED_LOCAL_WINS, 9753,
        # Secure update
        :DNS_ERROR_SECURE_BASE, 9800,
        # DNS_STATUS_CONTINUE_NEEDED            0x00002649
        # MessageId: DNS_STATUS_CONTINUE_NEEDED
        # MessageText:
        # Secure update call needs to continue update request.
        :DNS_STATUS_CONTINUE_NEEDED, 9801,
        # Setup errors
        :DNS_ERROR_SETUP_BASE, 9850,
        # DNS_ERROR_NO_TCPIP                    0x0000267b
        # MessageId: DNS_ERROR_NO_TCPIP
        # MessageText:
        # TCP/IP network protocol not installed.
        :DNS_ERROR_NO_TCPIP, 9851,
        # DNS_ERROR_NO_DNS_SERVERS              0x0000267c
        # MessageId: DNS_ERROR_NO_DNS_SERVERS
        # MessageText:
        # No DNS servers configured for local system.
        :DNS_ERROR_NO_DNS_SERVERS, 9852,
        # Directory partition (DP) errors
        :DNS_ERROR_DP_BASE, 9900,
        # DNS_ERROR_DP_DOES_NOT_EXIST           0x000026ad
        # MessageId: DNS_ERROR_DP_DOES_NOT_EXIST
        # MessageText:
        # The specified directory partition does not exist.
        :DNS_ERROR_DP_DOES_NOT_EXIST, 9901,
        # DNS_ERROR_DP_ALREADY_EXISTS           0x000026ae
        # MessageId: DNS_ERROR_DP_ALREADY_EXISTS
        # MessageText:
        # The specified directory partition already exists.
        :DNS_ERROR_DP_ALREADY_EXISTS, 9902,
        # DNS_ERROR_DP_NOT_ENLISTED             0x000026af
        # MessageId: DNS_ERROR_DP_NOT_ENLISTED
        # MessageText:
        # This DNS server is not enlisted in the specified directory partition.
        :DNS_ERROR_DP_NOT_ENLISTED, 9903,
        # DNS_ERROR_DP_ALREADY_ENLISTED         0x000026b0
        # MessageId: DNS_ERROR_DP_ALREADY_ENLISTED
        # MessageText:
        # This DNS server is already enlisted in the specified directory partition.
        :DNS_ERROR_DP_ALREADY_ENLISTED, 9904,
        # DNS_ERROR_DP_NOT_AVAILABLE            0x000026b1
        # MessageId: DNS_ERROR_DP_NOT_AVAILABLE
        # MessageText:
        # The directory partition is not available at this time. Please wait a few minutes and try again.
        :DNS_ERROR_DP_NOT_AVAILABLE, 9905,
        # DNS_ERROR_DP_FSMO_ERROR               0x000026b2
        # MessageId: DNS_ERROR_DP_FSMO_ERROR
        # MessageText:
        # The operation failed because the domain naming master FSMO role could not be reached. The domain controller holding the domain naming master FSMO role is down or unable to service the request or is not running Windows Server 2003 or later.
        :DNS_ERROR_DP_FSMO_ERROR, 9906,
        # DNS RRL errors from 9911 to 9920
        # DNS_ERROR_RRL_NOT_ENABLED 0x000026B7
        # MessageId: DNS_ERROR_RRL_NOT_ENABLED
        # MessageText:
        # The RRL is not enabled.
        :DNS_ERROR_RRL_NOT_ENABLED, 9911,
        # DNS_ERROR_RRL_INVALID_WINDOW_SIZE 0x000026B8
        # MessageId: DNS_ERROR_RRL_INVALID_WINDOW_SIZE
        # MessageText:
        # The window size parameter is invalid. It should be greater than or equal to 1.
        :DNS_ERROR_RRL_INVALID_WINDOW_SIZE, 9912,
        # DNS_ERROR_RRL_INVALID_IPV4_PREFIX 0x000026B9
        # MessageId: DNS_ERROR_RRL_INVALID_IPV4_PREFIX
        # MessageText:
        # The IPv4 prefix length parameter is invalid. It should be less than or equal to 32.
        :DNS_ERROR_RRL_INVALID_IPV4_PREFIX, 9913,
        # DNS_ERROR_RRL_INVALID_IPV6_PREFIX 0x000026BA
        # MessageId: DNS_ERROR_RRL_INVALID_IPV6_PREFIX
        # MessageText:
        # The IPv6 prefix length parameter is invalid. It should be less than or equal to 128.
        :DNS_ERROR_RRL_INVALID_IPV6_PREFIX, 9914,
        # DNS_ERROR_RRL_INVALID_TC_RATE 0x000026BB
        # MessageId: DNS_ERROR_RRL_INVALID_TC_RATE
        # MessageText:
        # The TC Rate parameter is invalid. It should be less than 10.
        :DNS_ERROR_RRL_INVALID_TC_RATE, 9915,
        # DNS_ERROR_RRL_INVALID_LEAK_RATE 0x000026BC
        # MessageId: DNS_ERROR_RRL_INVALID_LEAK_RATE
        # MessageText:
        # The Leak Rate parameter is invalid. It should be either 0, or between 2 and 10.
        :DNS_ERROR_RRL_INVALID_LEAK_RATE, 9916,
        # DNS_ERROR_RRL_LEAK_RATE_LESSTHAN_TC_RATE 0x000026BD
        # MessageId: DNS_ERROR_RRL_LEAK_RATE_LESSTHAN_TC_RATE
        # MessageText:
        # The Leak Rate or TC Rate parameter is invalid. Leak Rate should be greater than TC Rate.
        :DNS_ERROR_RRL_LEAK_RATE_LESSTHAN_TC_RATE, 9917,
        # DNS ZoneScope errors from 9951 to 9970
        # DNS_ERROR_ZONESCOPE_ALREADY_EXISTS               0x000026df
        # MessageId: DNS_ERROR_ZONESCOPE_ALREADY_EXISTS
        # MessageText:
        # The scope already exists for the zone.
        :DNS_ERROR_ZONESCOPE_ALREADY_EXISTS, 9951,
        # DNS_ERROR_ZONESCOPE_DOES_NOT_EXIST       0x000026e0
        # MessageId: DNS_ERROR_ZONESCOPE_DOES_NOT_EXIST
        # MessageText:
        # The scope does not exist for the zone.
        :DNS_ERROR_ZONESCOPE_DOES_NOT_EXIST, 9952,
        # DNS_ERROR_DEFAULT_ZONESCOPE 0x000026e1
        # MessageId: DNS_ERROR_DEFAULT_ZONESCOPE
        # MessageText:
        # The scope is the same as the default zone scope.
        :DNS_ERROR_DEFAULT_ZONESCOPE, 9953,
        # DNS_ERROR_INVALID_ZONESCOPE_NAME 0x000026e2
        # MessageId: DNS_ERROR_INVALID_ZONESCOPE_NAME
        # MessageText:
        # The scope name contains invalid characters.
        :DNS_ERROR_INVALID_ZONESCOPE_NAME, 9954,
        # DNS_ERROR_NOT_ALLOWED_WITH_ZONESCOPES 0x000026e3
        # MessageId: DNS_ERROR_NOT_ALLOWED_WITH_ZONESCOPES
        # MessageText:
        # Operation not allowed when the zone has scopes.
        :DNS_ERROR_NOT_ALLOWED_WITH_ZONESCOPES, 9955,
        # DNS_ERROR_LOAD_ZONESCOPE_FAILED 0x000026e4
        # MessageId: DNS_ERROR_LOAD_ZONESCOPE_FAILED
        # MessageText:
        # Failed to load zone scope.
        :DNS_ERROR_LOAD_ZONESCOPE_FAILED, 9956,
        # DNS_ERROR_ZONESCOPE_FILE_WRITEBACK_FAILED 0x000026e5
        # MessageId: DNS_ERROR_ZONESCOPE_FILE_WRITEBACK_FAILED
        # MessageText:
        # Failed to write data file for DNS zone scope. Please verify the file exists and is writable.
        :DNS_ERROR_ZONESCOPE_FILE_WRITEBACK_FAILED, 9957,
        # DNS_ERROR_INVALID_SCOPE_NAME 0x000026e6
        # MessageId: DNS_ERROR_INVALID_SCOPE_NAME
        # MessageText:
        # The scope name contains invalid characters.
        :DNS_ERROR_INVALID_SCOPE_NAME, 9958,
        # DNS_ERROR_SCOPE_DOES_NOT_EXIST       0x000026e7
        # MessageId: DNS_ERROR_SCOPE_DOES_NOT_EXIST
        # MessageText:
        # The scope does not exist.
        :DNS_ERROR_SCOPE_DOES_NOT_EXIST, 9959,
        # DNS_ERROR_DEFAULT_SCOPE 0x000026e8
        # MessageId: DNS_ERROR_DEFAULT_SCOPE
        # MessageText:
        # The scope is the same as the default scope.
        :DNS_ERROR_DEFAULT_SCOPE, 9960,
        # DNS_ERROR_INVALID_SCOPE_OPERATION 0x000026e9
        # MessageId: DNS_ERROR_INVALID_SCOPE_OPERATION
        # MessageText:
        # The operation is invalid on the scope.
        :DNS_ERROR_INVALID_SCOPE_OPERATION, 9961,
        # DNS_ERROR_SCOPE_LOCKED 0x000026ea
        # MessageId: DNS_ERROR_SCOPE_LOCKED
        # MessageText:
        # The scope is locked.
        :DNS_ERROR_SCOPE_LOCKED, 9962,
        # DNS_ERROR_SCOPE_ALREADY_EXISTS 0x000026eb
        # MessageId: DNS_ERROR_SCOPE_ALREADY_EXISTS
        # MessageText:
        # The scope already exists.
        :DNS_ERROR_SCOPE_ALREADY_EXISTS, 9963,
        # DNS Policy errors from 9971 to 9999
        # DNS_ERROR_POLICY_ALREADY_EXISTS 0x000026f3
        # MessageId: DNS_ERROR_POLICY_ALREADY_EXISTS
        # MessageText:
        # A policy with the same name already exists on this level (server level or zone level) on the DNS server.
        :DNS_ERROR_POLICY_ALREADY_EXISTS, 9971,
        # DNS_ERROR_POLICY_DOES_NOT_EXIST 0x000026f4
        # MessageId: DNS_ERROR_POLICY_DOES_NOT_EXIST
        # MessageText:
        # No policy with this name exists on this level (server level or zone level) on the DNS server.
        :DNS_ERROR_POLICY_DOES_NOT_EXIST, 9972,
        # DNS_ERROR_POLICY_INVALID_CRITERIA 0x000026f5
        # MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA
        # MessageText:
        # The criteria provided in the policy are invalid.
        :DNS_ERROR_POLICY_INVALID_CRITERIA, 9973,
        # DNS_ERROR_POLICY_INVALID_SETTINGS 0x000026f6
        # MessageId: DNS_ERROR_POLICY_INVALID_SETTINGS
        # MessageText:
        # At least one of the settings of this policy is invalid.
        :DNS_ERROR_POLICY_INVALID_SETTINGS, 9974,
        # DNS_ERROR_CLIENT_SUBNET_IS_ACCESSED 0x000026f7
        # MessageId: DNS_ERROR_CLIENT_SUBNET_IS_ACCESSED
        # MessageText:
        # The client subnet cannot be deleted while it is being accessed by a policy.
        :DNS_ERROR_CLIENT_SUBNET_IS_ACCESSED, 9975,
        # DNS_ERROR_CLIENT_SUBNET_DOES_NOT_EXIST 0x000026f8
        # MessageId: DNS_ERROR_CLIENT_SUBNET_DOES_NOT_EXIST
        # MessageText:
        # The client subnet does not exist on the DNS server.
        :DNS_ERROR_CLIENT_SUBNET_DOES_NOT_EXIST, 9976,
        # DNS_ERROR_CLIENT_SUBNET_ALREADY_EXISTS 0x000026f9
        # MessageId: DNS_ERROR_CLIENT_SUBNET_ALREADY_EXISTS
        # MessageText:
        # A client subnet with this name already exists on the DNS server.
        :DNS_ERROR_CLIENT_SUBNET_ALREADY_EXISTS, 9977,
        # DNS_ERROR_SUBNET_DOES_NOT_EXIST 0x000026fa
        # MessageId: DNS_ERROR_SUBNET_DOES_NOT_EXIST
        # MessageText:
        # The IP subnet specified does not exist in the client subnet.
        :DNS_ERROR_SUBNET_DOES_NOT_EXIST, 9978,
        # DNS_ERROR_SUBNET_ALREADY_EXISTS 0x000026fb
        # MessageId: DNS_ERROR_SUBNET_ALREADY_EXISTS
        # MessageText:
        # The IP subnet that is being added, already exists in the client subnet.
        :DNS_ERROR_SUBNET_ALREADY_EXISTS, 9979,
        # DNS_ERROR_POLICY_LOCKED 0x000026fc
        # MessageId: DNS_ERROR_POLICY_LOCKED
        # MessageText:
        # The policy is locked.
        :DNS_ERROR_POLICY_LOCKED, 9980,
        # DNS_ERROR_POLICY_INVALID_WEIGHT 0x000026fd
        # MessageId: DNS_ERROR_POLICY_INVALID_WEIGHT
        # MessageText:
        # The weight of the scope in the policy is invalid.
        :DNS_ERROR_POLICY_INVALID_WEIGHT, 9981,
        # DNS_ERROR_POLICY_INVALID_NAME 0x000026fe
        # MessageId: DNS_ERROR_POLICY_INVALID_NAME
        # MessageText:
        # The DNS policy name is invalid.
        :DNS_ERROR_POLICY_INVALID_NAME, 9982,
        # DNS_ERROR_POLICY_MISSING_CRITERIA 0x000026ff
        # MessageId: DNS_ERROR_POLICY_MISSING_CRITERIA
        # MessageText:
        # The policy is missing criteria.
        :DNS_ERROR_POLICY_MISSING_CRITERIA, 9983,
        # DNS_ERROR_INVALID_CLIENT_SUBNET_NAME 0x00002700
        # MessageId: DNS_ERROR_INVALID_CLIENT_SUBNET_NAME
        # MessageText:
        # The name of the the client subnet record is invalid.
        :DNS_ERROR_INVALID_CLIENT_SUBNET_NAME, 9984,
        # DNS_ERROR_POLICY_PROCESSING_ORDER_INVALID 0x00002701
        # MessageId: DNS_ERROR_POLICY_PROCESSING_ORDER_INVALID
        # MessageText:
        # Invalid policy processing order.
        :DNS_ERROR_POLICY_PROCESSING_ORDER_INVALID, 9985,
        # DNS_ERROR_POLICY_SCOPE_MISSING 0x00002702
        # MessageId: DNS_ERROR_POLICY_SCOPE_MISSING
        # MessageText:
        # The scope information has not been provided for a policy that requires it.
        :DNS_ERROR_POLICY_SCOPE_MISSING, 9986,
        # DNS_ERROR_POLICY_SCOPE_NOT_ALLOWED 0x00002703
        # MessageId: DNS_ERROR_POLICY_SCOPE_NOT_ALLOWED
        # MessageText:
        # The scope information has been provided for a policy that does not require it.
        :DNS_ERROR_POLICY_SCOPE_NOT_ALLOWED, 9987,
        # DNS_ERROR_SERVERSCOPE_IS_REFERENCED 0x00002704
        # MessageId: DNS_ERROR_SERVERSCOPE_IS_REFERENCED
        # MessageText:
        # The server scope cannot be deleted because it is referenced by a DNS Policy.
        :DNS_ERROR_SERVERSCOPE_IS_REFERENCED, 9988,
        # DNS_ERROR_ZONESCOPE_IS_REFERENCED 0x00002705
        # MessageId: DNS_ERROR_ZONESCOPE_IS_REFERENCED
        # MessageText:
        # The zone scope cannot be deleted because it is referenced by a DNS Policy.
        :DNS_ERROR_ZONESCOPE_IS_REFERENCED, 9989,
        # DNS_ERROR_POLICY_INVALID_CRITERIA_CLIENT_SUBNET 0x00002706
        # MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_CLIENT_SUBNET
        # MessageText:
        # The criterion client subnet provided in the policy is invalid.
        :DNS_ERROR_POLICY_INVALID_CRITERIA_CLIENT_SUBNET, 9990,
        # DNS_ERROR_POLICY_INVALID_CRITERIA_TRANSPORT_PROTOCOL 0x00002707
        # MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_TRANSPORT_PROTOCOL
        # MessageText:
        # The criterion transport protocol provided in the policy is invalid.
        :DNS_ERROR_POLICY_INVALID_CRITERIA_TRANSPORT_PROTOCOL, 9991,
        # DNS_ERROR_POLICY_INVALID_CRITERIA_NETWORK_PROTOCOL 0x00002708
        # MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_NETWORK_PROTOCOL
        # MessageText:
        # The criterion network protocol provided in the policy is invalid.
        :DNS_ERROR_POLICY_INVALID_CRITERIA_NETWORK_PROTOCOL, 9992,
        # DNS_ERROR_POLICY_INVALID_CRITERIA_INTERFACE 0x00002709
        # MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_INTERFACE
        # MessageText:
        # The criterion interface provided in the policy is invalid.
        :DNS_ERROR_POLICY_INVALID_CRITERIA_INTERFACE, 9993,
        # DNS_ERROR_POLICY_INVALID_CRITERIA_FQDN 0x0000270A
        # MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_FQDN
        # MessageText:
        # The criterion FQDN provided in the policy is invalid.
        :DNS_ERROR_POLICY_INVALID_CRITERIA_FQDN, 9994,
        # DNS_ERROR_POLICY_INVALID_CRITERIA_QUERY_TYPE 0x0000270B
        # MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_QUERY_TYPE
        # MessageText:
        # The criterion query type provided in the policy is invalid.
        :DNS_ERROR_POLICY_INVALID_CRITERIA_QUERY_TYPE, 9995,
        # DNS_ERROR_POLICY_INVALID_CRITERIA_TIME_OF_DAY 0x0000270C
        # MessageId: DNS_ERROR_POLICY_INVALID_CRITERIA_TIME_OF_DAY
        # MessageText:
        # The criterion time of day provided in the policy is invalid.
        :DNS_ERROR_POLICY_INVALID_CRITERIA_TIME_OF_DAY, 9996,
        #=== End of DNS Error Codes 9000 to 9999 ===#
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end