module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Active Directory Error codes 8000 to 8999 ===#
        # FACILITY_FILE_REPLICATION_SERVICE
        # *****************
        # MessageId: FRS_ERR_INVALID_API_SEQUENCE
        # MessageText:
        # The file replication service API was called incorrectly.
        :FRS_ERR_INVALID_API_SEQUENCE, 8001,
        # MessageId: FRS_ERR_STARTING_SERVICE
        # MessageText:
        # The file replication service cannot be started.
        :FRS_ERR_STARTING_SERVICE, 8002,
        # MessageId: FRS_ERR_STOPPING_SERVICE
        # MessageText:
        # The file replication service cannot be stopped.
        :FRS_ERR_STOPPING_SERVICE, 8003,
        # MessageId: FRS_ERR_INTERNAL_API
        # MessageText:
        # The file replication service API terminated the request. The event log may have more information.
        :FRS_ERR_INTERNAL_API, 8004,
        # MessageId: FRS_ERR_INTERNAL
        # MessageText:
        # The file replication service terminated the request. The event log may have more information.
        :FRS_ERR_INTERNAL, 8005,
        # MessageId: FRS_ERR_SERVICE_COMM
        # MessageText:
        # The file replication service cannot be contacted. The event log may have more information.
        :FRS_ERR_SERVICE_COMM, 8006,
        # MessageId: FRS_ERR_INSUFFICIENT_PRIV
        # MessageText:
        # The file replication service cannot satisfy the request because the user has insufficient privileges. The event log may have more information.
        :FRS_ERR_INSUFFICIENT_PRIV, 8007,
        # MessageId: FRS_ERR_AUTHENTICATION
        # MessageText:
        # The file replication service cannot satisfy the request because authenticated RPC is not available. The event log may have more information.
        :FRS_ERR_AUTHENTICATION, 8008,
        # MessageId: FRS_ERR_PARENT_INSUFFICIENT_PRIV
        # MessageText:
        # The file replication service cannot satisfy the request because the user has insufficient privileges on the domain controller. The event log may have more information.
        :FRS_ERR_PARENT_INSUFFICIENT_PRIV, 8009,
        # MessageId: FRS_ERR_PARENT_AUTHENTICATION
        # MessageText:
        # The file replication service cannot satisfy the request because authenticated RPC is not available on the domain controller. The event log may have more information.
        :FRS_ERR_PARENT_AUTHENTICATION, 8010,
        # MessageId: FRS_ERR_CHILD_TO_PARENT_COMM
        # MessageText:
        # The file replication service cannot communicate with the file replication service on the domain controller. The event log may have more information.
        :FRS_ERR_CHILD_TO_PARENT_COMM, 8011,
        # MessageId: FRS_ERR_PARENT_TO_CHILD_COMM
        # MessageText:
        # The file replication service on the domain controller cannot communicate with the file replication service on this computer. The event log may have more information.
        :FRS_ERR_PARENT_TO_CHILD_COMM, 8012,
        # MessageId: FRS_ERR_SYSVOL_POPULATE
        # MessageText:
        # The file replication service cannot populate the system volume because of an internal error. The event log may have more information.
        :FRS_ERR_SYSVOL_POPULATE, 8013,
        # MessageId: FRS_ERR_SYSVOL_POPULATE_TIMEOUT
        # MessageText:
        # The file replication service cannot populate the system volume because of an internal timeout. The event log may have more information.
        :FRS_ERR_SYSVOL_POPULATE_TIMEOUT, 8014,
        # MessageId: FRS_ERR_SYSVOL_IS_BUSY
        # MessageText:
        # The file replication service cannot process the request. The system volume is busy with a previous request.
        :FRS_ERR_SYSVOL_IS_BUSY, 8015,
        # MessageId: FRS_ERR_SYSVOL_DEMOTE
        # MessageText:
        # The file replication service cannot stop replicating the system volume because of an internal error. The event log may have more information.
        :FRS_ERR_SYSVOL_DEMOTE, 8016,
        # MessageId: FRS_ERR_INVALID_SERVICE_PARAMETER
        # MessageText:
        # The file replication service detected an invalid parameter.
        :FRS_ERR_INVALID_SERVICE_PARAMETER, 8017,
        # *****************
        # FACILITY DIRECTORY SERVICE
        # *****************
        #define DS_S_SUCCESS NO_ERROR
        # MessageId: ERROR_DS_NOT_INSTALLED
        # MessageText:
        # An error occurred while installing the directory service. For more information, see the event log.
        :DS_NOT_INSTALLED, 8200,
        # MessageId: ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY
        # MessageText:
        # The directory service evaluated group memberships locally.
        :DS_MEMBERSHIP_EVALUATED_LOCALLY, 8201,
        # MessageId: ERROR_DS_NO_ATTRIBUTE_OR_VALUE
        # MessageText:
        # The specified directory service attribute or value does not exist.
        :DS_NO_ATTRIBUTE_OR_VALUE, 8202,
        # MessageId: ERROR_DS_INVALID_ATTRIBUTE_SYNTAX
        # MessageText:
        # The attribute syntax specified to the directory service is invalid.
        :DS_INVALID_ATTRIBUTE_SYNTAX, 8203,
        # MessageId: ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED
        # MessageText:
        # The attribute type specified to the directory service is not defined.
        :DS_ATTRIBUTE_TYPE_UNDEFINED, 8204,
        # MessageId: ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS
        # MessageText:
        # The specified directory service attribute or value already exists.
        :DS_ATTRIBUTE_OR_VALUE_EXISTS, 8205,
        # MessageId: ERROR_DS_BUSY
        # MessageText:
        # The directory service is busy.
        :DS_BUSY, 8206,
        # MessageId: ERROR_DS_UNAVAILABLE
        # MessageText:
        # The directory service is unavailable.
        :DS_UNAVAILABLE, 8207,
        # MessageId: ERROR_DS_NO_RIDS_ALLOCATED
        # MessageText:
        # The directory service was unable to allocate a relative identifier.
        :DS_NO_RIDS_ALLOCATED, 8208,
        # MessageId: ERROR_DS_NO_MORE_RIDS
        # MessageText:
        # The directory service has exhausted the pool of relative identifiers.
        :DS_NO_MORE_RIDS, 8209,
        # MessageId: ERROR_DS_INCORRECT_ROLE_OWNER
        # MessageText:
        # The requested operation could not be performed because the directory service is not the master for that type of operation.
        :DS_INCORRECT_ROLE_OWNER, 8210,
        # MessageId: ERROR_DS_RIDMGR_INIT_ERROR
        # MessageText:
        # The directory service was unable to initialize the subsystem that allocates relative identifiers.
        :DS_RIDMGR_INIT_ERROR, 8211,
        # MessageId: ERROR_DS_OBJ_CLASS_VIOLATION
        # MessageText:
        # The requested operation did not satisfy one or more constraints associated with the class of the object.
        :DS_OBJ_CLASS_VIOLATION, 8212,
        # MessageId: ERROR_DS_CANT_ON_NON_LEAF
        # MessageText:
        # The directory service can perform the requested operation only on a leaf object.
        :DS_CANT_ON_NON_LEAF, 8213,
        # MessageId: ERROR_DS_CANT_ON_RDN
        # MessageText:
        # The directory service cannot perform the requested operation on the RDN attribute of an object.
        :DS_CANT_ON_RDN, 8214,
        # MessageId: ERROR_DS_CANT_MOD_OBJ_CLASS
        # MessageText:
        # The directory service detected an attempt to modify the object class of an object.
        :DS_CANT_MOD_OBJ_CLASS, 8215,
        # MessageId: ERROR_DS_CROSS_DOM_MOVE_ERROR
        # MessageText:
        # The requested cross-domain move operation could not be performed.
        :DS_CROSS_DOM_MOVE_ERROR, 8216,
        # MessageId: ERROR_DS_GC_NOT_AVAILABLE
        # MessageText:
        # Unable to contact the global catalog server.
        :DS_GC_NOT_AVAILABLE, 8217,
        # MessageId: ERROR_SHARED_POLICY
        # MessageText:
        # The policy object is shared and can only be modified at the root.
        :SHARED_POLICY, 8218,
        # MessageId: ERROR_POLICY_OBJECT_NOT_FOUND
        # MessageText:
        # The policy object does not exist.
        :POLICY_OBJECT_NOT_FOUND, 8219,
        # MessageId: ERROR_POLICY_ONLY_IN_DS
        # MessageText:
        # The requested policy information is only in the directory service.
        :POLICY_ONLY_IN_DS, 8220,
        # MessageId: ERROR_PROMOTION_ACTIVE
        # MessageText:
        # A domain controller promotion is currently active.
        :PROMOTION_ACTIVE, 8221,
        # MessageId: ERROR_NO_PROMOTION_ACTIVE
        # MessageText:
        # A domain controller promotion is not currently active
        :NO_PROMOTION_ACTIVE, 8222,
        # 8223 unused
        # MessageId: ERROR_DS_OPERATIONS_ERROR
        # MessageText:
        # An operations error occurred.
        :DS_OPERATIONS_ERROR, 8224,
        # MessageId: ERROR_DS_PROTOCOL_ERROR
        # MessageText:
        # A protocol error occurred.
        :DS_PROTOCOL_ERROR, 8225,
        # MessageId: ERROR_DS_TIMELIMIT_EXCEEDED
        # MessageText:
        # The time limit for this request was exceeded.
        :DS_TIMELIMIT_EXCEEDED, 8226,
        # MessageId: ERROR_DS_SIZELIMIT_EXCEEDED
        # MessageText:
        # The size limit for this request was exceeded.
        :DS_SIZELIMIT_EXCEEDED, 8227,
        # MessageId: ERROR_DS_ADMIN_LIMIT_EXCEEDED
        # MessageText:
        # The administrative limit for this request was exceeded.
        :DS_ADMIN_LIMIT_EXCEEDED, 8228,
        # MessageId: ERROR_DS_COMPARE_FALSE
        # MessageText:
        # The compare response was false.
        :DS_COMPARE_FALSE, 8229,
        # MessageId: ERROR_DS_COMPARE_TRUE
        # MessageText:
        # The compare response was true.
        :DS_COMPARE_TRUE, 8230,
        # MessageId: ERROR_DS_AUTH_METHOD_NOT_SUPPORTED
        # MessageText:
        # The requested authentication method is not supported by the server.
        :DS_AUTH_METHOD_NOT_SUPPORTED, 8231,
        # MessageId: ERROR_DS_STRONG_AUTH_REQUIRED
        # MessageText:
        # A more secure authentication method is required for this server.
        :DS_STRONG_AUTH_REQUIRED, 8232,
        # MessageId: ERROR_DS_INAPPROPRIATE_AUTH
        # MessageText:
        # Inappropriate authentication.
        :DS_INAPPROPRIATE_AUTH, 8233,
        # MessageId: ERROR_DS_AUTH_UNKNOWN
        # MessageText:
        # The authentication mechanism is unknown.
        :DS_AUTH_UNKNOWN, 8234,
        # MessageId: ERROR_DS_REFERRAL
        # MessageText:
        # A referral was returned from the server.
        :DS_REFERRAL, 8235,
        # MessageId: ERROR_DS_UNAVAILABLE_CRIT_EXTENSION
        # MessageText:
        # The server does not support the requested critical extension.
        :DS_UNAVAILABLE_CRIT_EXTENSION, 8236,
        # MessageId: ERROR_DS_CONFIDENTIALITY_REQUIRED
        # MessageText:
        # This request requires a secure connection.
        :DS_CONFIDENTIALITY_REQUIRED, 8237,
        # MessageId: ERROR_DS_INAPPROPRIATE_MATCHING
        # MessageText:
        # Inappropriate matching.
        :DS_INAPPROPRIATE_MATCHING, 8238,
        # MessageId: ERROR_DS_CONSTRAINT_VIOLATION
        # MessageText:
        # A constraint violation occurred.
        :DS_CONSTRAINT_VIOLATION, 8239,
        # MessageId: ERROR_DS_NO_SUCH_OBJECT
        # MessageText:
        # There is no such object on the server.
        :DS_NO_SUCH_OBJECT, 8240,
        # MessageId: ERROR_DS_ALIAS_PROBLEM
        # MessageText:
        # There is an alias problem.
        :DS_ALIAS_PROBLEM, 8241,
        # MessageId: ERROR_DS_INVALID_DN_SYNTAX
        # MessageText:
        # An invalid dn syntax has been specified.
        :DS_INVALID_DN_SYNTAX, 8242,
        # MessageId: ERROR_DS_IS_LEAF
        # MessageText:
        # The object is a leaf object.
        :DS_IS_LEAF, 8243,
        # MessageId: ERROR_DS_ALIAS_DEREF_PROBLEM
        # MessageText:
        # There is an alias dereferencing problem.
        :DS_ALIAS_DEREF_PROBLEM, 8244,
        # MessageId: ERROR_DS_UNWILLING_TO_PERFORM
        # MessageText:
        # The server is unwilling to process the request.
        :DS_UNWILLING_TO_PERFORM, 8245,
        # MessageId: ERROR_DS_LOOP_DETECT
        # MessageText:
        # A loop has been detected.
        :DS_LOOP_DETECT, 8246,
        # MessageId: ERROR_DS_NAMING_VIOLATION
        # MessageText:
        # There is a naming violation.
        :DS_NAMING_VIOLATION, 8247,
        # MessageId: ERROR_DS_OBJECT_RESULTS_TOO_LARGE
        # MessageText:
        # The result set is too large.
        :DS_OBJECT_RESULTS_TOO_LARGE, 8248,
        # MessageId: ERROR_DS_AFFECTS_MULTIPLE_DSAS
        # MessageText:
        # The operation affects multiple DSAs
        :DS_AFFECTS_MULTIPLE_DSAS, 8249,
        # MessageId: ERROR_DS_SERVER_DOWN
        # MessageText:
        # The server is not operational.
        :DS_SERVER_DOWN, 8250,
        # MessageId: ERROR_DS_LOCAL_ERROR
        # MessageText:
        # A local error has occurred.
        :DS_LOCAL_ERROR, 8251,
        # MessageId: ERROR_DS_ENCODING_ERROR
        # MessageText:
        # An encoding error has occurred.
        :DS_ENCODING_ERROR, 8252,
        # MessageId: ERROR_DS_DECODING_ERROR
        # MessageText:
        # A decoding error has occurred.
        :DS_DECODING_ERROR, 8253,
        # MessageId: ERROR_DS_FILTER_UNKNOWN
        # MessageText:
        # The search filter cannot be recognized.
        :DS_FILTER_UNKNOWN, 8254,
        # MessageId: ERROR_DS_PARAM_ERROR
        # MessageText:
        # One or more parameters are illegal.
        :DS_PARAM_ERROR, 8255,
        # MessageId: ERROR_DS_NOT_SUPPORTED
        # MessageText:
        # The specified method is not supported.
        :DS_NOT_SUPPORTED, 8256,
        # MessageId: ERROR_DS_NO_RESULTS_RETURNED
        # MessageText:
        # No results were returned.
        :DS_NO_RESULTS_RETURNED, 8257,
        # MessageId: ERROR_DS_CONTROL_NOT_FOUND
        # MessageText:
        # The specified control is not supported by the server.
        :DS_CONTROL_NOT_FOUND, 8258,
        # MessageId: ERROR_DS_CLIENT_LOOP
        # MessageText:
        # A referral loop was detected by the client.
        :DS_CLIENT_LOOP, 8259,
        # MessageId: ERROR_DS_REFERRAL_LIMIT_EXCEEDED
        # MessageText:
        # The preset referral limit was exceeded.
        :DS_REFERRAL_LIMIT_EXCEEDED, 8260,
        # MessageId: ERROR_DS_SORT_CONTROL_MISSING
        # MessageText:
        # The search requires a SORT control.
        :DS_SORT_CONTROL_MISSING, 8261,
        # MessageId: ERROR_DS_OFFSET_RANGE_ERROR
        # MessageText:
        # The search results exceed the offset range specified.
        :DS_OFFSET_RANGE_ERROR, 8262,
        # MessageId: ERROR_DS_RIDMGR_DISABLED
        # MessageText:
        # The directory service detected the subsystem that allocates relative identifiers is disabled. This can occur as a protective mechanism when the system determines a significant portion of relative identifiers (RIDs) have been exhausted. Please see http:#go.microsoft.com/fwlink/?LinkId=228610 for recommended diagnostic steps and the procedure to re-enable account creation.
        :DS_RIDMGR_DISABLED, 8263,
        # MessageId: ERROR_DS_ROOT_MUST_BE_NC
        # MessageText:
        # The root object must be the head of a naming context. The root object cannot have an instantiated parent.
        :DS_ROOT_MUST_BE_NC, 8301,
        # MessageId: ERROR_DS_ADD_REPLICA_INHIBITED
        # MessageText:
        # The add replica operation cannot be performed. The naming context must be writeable in order to create the replica.
        :DS_ADD_REPLICA_INHIBITED, 8302,
        # MessageId: ERROR_DS_ATT_NOT_DEF_IN_SCHEMA
        # MessageText:
        # A reference to an attribute that is not defined in the schema occurred.
        :DS_ATT_NOT_DEF_IN_SCHEMA, 8303,
        # MessageId: ERROR_DS_MAX_OBJ_SIZE_EXCEEDED
        # MessageText:
        # The maximum size of an object has been exceeded.
        :DS_MAX_OBJ_SIZE_EXCEEDED, 8304,
        # MessageId: ERROR_DS_OBJ_STRING_NAME_EXISTS
        # MessageText:
        # An attempt was made to add an object to the directory with a name that is already in use.
        :DS_OBJ_STRING_NAME_EXISTS, 8305,
        # MessageId: ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA
        # MessageText:
        # An attempt was made to add an object of a class that does not have an RDN defined in the schema.
        :DS_NO_RDN_DEFINED_IN_SCHEMA, 8306,
        # MessageId: ERROR_DS_RDN_DOESNT_MATCH_SCHEMA
        # MessageText:
        # An attempt was made to add an object using an RDN that is not the RDN defined in the schema.
        :DS_RDN_DOESNT_MATCH_SCHEMA, 8307,
        # MessageId: ERROR_DS_NO_REQUESTED_ATTS_FOUND
        # MessageText:
        # None of the requested attributes were found on the objects.
        :DS_NO_REQUESTED_ATTS_FOUND, 8308,
        # MessageId: ERROR_DS_USER_BUFFER_TO_SMALL
        # MessageText:
        # The user buffer is too small.
        :DS_USER_BUFFER_TO_SMALL, 8309,
        # MessageId: ERROR_DS_ATT_IS_NOT_ON_OBJ
        # MessageText:
        # The attribute specified in the operation is not present on the object.
        :DS_ATT_IS_NOT_ON_OBJ, 8310,
        # MessageId: ERROR_DS_ILLEGAL_MOD_OPERATION
        # MessageText:
        # Illegal modify operation. Some aspect of the modification is not permitted.
        :DS_ILLEGAL_MOD_OPERATION, 8311,
        # MessageId: ERROR_DS_OBJ_TOO_LARGE
        # MessageText:
        # The specified object is too large.
        :DS_OBJ_TOO_LARGE, 8312,
        # MessageId: ERROR_DS_BAD_INSTANCE_TYPE
        # MessageText:
        # The specified instance type is not valid.
        :DS_BAD_INSTANCE_TYPE, 8313,
        # MessageId: ERROR_DS_MASTERDSA_REQUIRED
        # MessageText:
        # The operation must be performed at a master DSA.
        :DS_MASTERDSA_REQUIRED, 8314,
        # MessageId: ERROR_DS_OBJECT_CLASS_REQUIRED
        # MessageText:
        # The object class attribute must be specified.
        :DS_OBJECT_CLASS_REQUIRED, 8315,
        # MessageId: ERROR_DS_MISSING_REQUIRED_ATT
        # MessageText:
        # A required attribute is missing.
        :DS_MISSING_REQUIRED_ATT, 8316,
        # MessageId: ERROR_DS_ATT_NOT_DEF_FOR_CLASS
        # MessageText:
        # An attempt was made to modify an object to include an attribute that is not legal for its class.
        :DS_ATT_NOT_DEF_FOR_CLASS, 8317,
        # MessageId: ERROR_DS_ATT_ALREADY_EXISTS
        # MessageText:
        # The specified attribute is already present on the object.
        :DS_ATT_ALREADY_EXISTS, 8318,
        # 8319 unused
        # MessageId: ERROR_DS_CANT_ADD_ATT_VALUES
        # MessageText:
        # The specified attribute is not present, or has no values.
        :DS_CANT_ADD_ATT_VALUES, 8320,
        # MessageId: ERROR_DS_SINGLE_VALUE_CONSTRAINT
        # MessageText:
        # Multiple values were specified for an attribute that can have only one value.
        :DS_SINGLE_VALUE_CONSTRAINT, 8321,
        # MessageId: ERROR_DS_RANGE_CONSTRAINT
        # MessageText:
        # A value for the attribute was not in the acceptable range of values.
        :DS_RANGE_CONSTRAINT, 8322,
        # MessageId: ERROR_DS_ATT_VAL_ALREADY_EXISTS
        # MessageText:
        # The specified value already exists.
        :DS_ATT_VAL_ALREADY_EXISTS, 8323,
        # MessageId: ERROR_DS_CANT_REM_MISSING_ATT
        # MessageText:
        # The attribute cannot be removed because it is not present on the object.
        :DS_CANT_REM_MISSING_ATT, 8324,
        # MessageId: ERROR_DS_CANT_REM_MISSING_ATT_VAL
        # MessageText:
        # The attribute value cannot be removed because it is not present on the object.
        :DS_CANT_REM_MISSING_ATT_VAL, 8325,
        # MessageId: ERROR_DS_ROOT_CANT_BE_SUBREF
        # MessageText:
        # The specified root object cannot be a subref.
        :DS_ROOT_CANT_BE_SUBREF, 8326,
        # MessageId: ERROR_DS_NO_CHAINING
        # MessageText:
        # Chaining is not permitted.
        :DS_NO_CHAINING, 8327,
        # MessageId: ERROR_DS_NO_CHAINED_EVAL
        # MessageText:
        # Chained evaluation is not permitted.
        :DS_NO_CHAINED_EVAL, 8328,
        # MessageId: ERROR_DS_NO_PARENT_OBJECT
        # MessageText:
        # The operation could not be performed because the object's parent is either uninstantiated or deleted.
        :DS_NO_PARENT_OBJECT, 8329,
        # MessageId: ERROR_DS_PARENT_IS_AN_ALIAS
        # MessageText:
        # Having a parent that is an alias is not permitted. Aliases are leaf objects.
        :DS_PARENT_IS_AN_ALIAS, 8330,
        # MessageId: ERROR_DS_CANT_MIX_MASTER_AND_REPS
        # MessageText:
        # The object and parent must be of the same type, either both masters or both replicas.
        :DS_CANT_MIX_MASTER_AND_REPS, 8331,
        # MessageId: ERROR_DS_CHILDREN_EXIST
        # MessageText:
        # The operation cannot be performed because child objects exist. This operation can only be performed on a leaf object.
        :DS_CHILDREN_EXIST, 8332,
        # MessageId: ERROR_DS_OBJ_NOT_FOUND
        # MessageText:
        # Directory object not found.
        :DS_OBJ_NOT_FOUND, 8333,
        # MessageId: ERROR_DS_ALIASED_OBJ_MISSING
        # MessageText:
        # The aliased object is missing.
        :DS_ALIASED_OBJ_MISSING, 8334,
        # MessageId: ERROR_DS_BAD_NAME_SYNTAX
        # MessageText:
        # The object name has bad syntax.
        :DS_BAD_NAME_SYNTAX, 8335,
        # MessageId: ERROR_DS_ALIAS_POINTS_TO_ALIAS
        # MessageText:
        # It is not permitted for an alias to refer to another alias.
        :DS_ALIAS_POINTS_TO_ALIAS, 8336,
        # MessageId: ERROR_DS_CANT_DEREF_ALIAS
        # MessageText:
        # The alias cannot be dereferenced.
        :DS_CANT_DEREF_ALIAS, 8337,
        # MessageId: ERROR_DS_OUT_OF_SCOPE
        # MessageText:
        # The operation is out of scope.
        :DS_OUT_OF_SCOPE, 8338,
        # MessageId: ERROR_DS_OBJECT_BEING_REMOVED
        # MessageText:
        # The operation cannot continue because the object is in the process of being removed.
        :DS_OBJECT_BEING_REMOVED, 8339,
        # MessageId: ERROR_DS_CANT_DELETE_DSA_OBJ
        # MessageText:
        # The DSA object cannot be deleted.
        :DS_CANT_DELETE_DSA_OBJ, 8340,
        # MessageId: ERROR_DS_GENERIC_ERROR
        # MessageText:
        # A directory service error has occurred.
        :DS_GENERIC_ERROR, 8341,
        # MessageId: ERROR_DS_DSA_MUST_BE_INT_MASTER
        # MessageText:
        # The operation can only be performed on an internal master DSA object.
        :DS_DSA_MUST_BE_INT_MASTER, 8342,
        # MessageId: ERROR_DS_CLASS_NOT_DSA
        # MessageText:
        # The object must be of class DSA.
        :DS_CLASS_NOT_DSA, 8343,
        # MessageId: ERROR_DS_INSUFF_ACCESS_RIGHTS
        # MessageText:
        # Insufficient access rights to perform the operation.
        :DS_INSUFF_ACCESS_RIGHTS, 8344,
        # MessageId: ERROR_DS_ILLEGAL_SUPERIOR
        # MessageText:
        # The object cannot be added because the parent is not on the list of possible superiors.
        :DS_ILLEGAL_SUPERIOR, 8345,
        # MessageId: ERROR_DS_ATTRIBUTE_OWNED_BY_SAM
        # MessageText:
        # Access to the attribute is not permitted because the attribute is owned by the Security Accounts Manager (SAM).
        :DS_ATTRIBUTE_OWNED_BY_SAM, 8346,
        # MessageId: ERROR_DS_NAME_TOO_MANY_PARTS
        # MessageText:
        # The name has too many parts.
        :DS_NAME_TOO_MANY_PARTS, 8347,
        # MessageId: ERROR_DS_NAME_TOO_LONG
        # MessageText:
        # The name is too long.
        :DS_NAME_TOO_LONG, 8348,
        # MessageId: ERROR_DS_NAME_VALUE_TOO_LONG
        # MessageText:
        # The name value is too long.
        :DS_NAME_VALUE_TOO_LONG, 8349,
        # MessageId: ERROR_DS_NAME_UNPARSEABLE
        # MessageText:
        # The directory service encountered an error parsing a name.
        :DS_NAME_UNPARSEABLE, 8350,
        # MessageId: ERROR_DS_NAME_TYPE_UNKNOWN
        # MessageText:
        # The directory service cannot get the attribute type for a name.
        :DS_NAME_TYPE_UNKNOWN, 8351,
        # MessageId: ERROR_DS_NOT_AN_OBJECT
        # MessageText:
        # The name does not identify an object; the name identifies a phantom.
        :DS_NOT_AN_OBJECT, 8352,
        # MessageId: ERROR_DS_SEC_DESC_TOO_SHORT
        # MessageText:
        # The security descriptor is too short.
        :DS_SEC_DESC_TOO_SHORT, 8353,
        # MessageId: ERROR_DS_SEC_DESC_INVALID
        # MessageText:
        # The security descriptor is invalid.
        :DS_SEC_DESC_INVALID, 8354,
        # MessageId: ERROR_DS_NO_DELETED_NAME
        # MessageText:
        # Failed to create name for deleted object.
        :DS_NO_DELETED_NAME, 8355,
        # MessageId: ERROR_DS_SUBREF_MUST_HAVE_PARENT
        # MessageText:
        # The parent of a new subref must exist.
        :DS_SUBREF_MUST_HAVE_PARENT, 8356,
        # MessageId: ERROR_DS_NCNAME_MUST_BE_NC
        # MessageText:
        # The object must be a naming context.
        :DS_NCNAME_MUST_BE_NC, 8357,
        # MessageId: ERROR_DS_CANT_ADD_SYSTEM_ONLY
        # MessageText:
        # It is not permitted to add an attribute which is owned by the system.
        :DS_CANT_ADD_SYSTEM_ONLY, 8358,
        # MessageId: ERROR_DS_CLASS_MUST_BE_CONCRETE
        # MessageText:
        # The class of the object must be structural; you cannot instantiate an abstract class.
        :DS_CLASS_MUST_BE_CONCRETE, 8359,
        # MessageId: ERROR_DS_INVALID_DMD
        # MessageText:
        # The schema object could not be found.
        :DS_INVALID_DMD, 8360,
        # MessageId: ERROR_DS_OBJ_GUID_EXISTS
        # MessageText:
        # A local object with this GUID (dead or alive) already exists.
        :DS_OBJ_GUID_EXISTS, 8361,
        # MessageId: ERROR_DS_NOT_ON_BACKLINK
        # MessageText:
        # The operation cannot be performed on a back link.
        :DS_NOT_ON_BACKLINK, 8362,
        # MessageId: ERROR_DS_NO_CROSSREF_FOR_NC
        # MessageText:
        # The cross reference for the specified naming context could not be found.
        :DS_NO_CROSSREF_FOR_NC, 8363,
        # MessageId: ERROR_DS_SHUTTING_DOWN
        # MessageText:
        # The operation could not be performed because the directory service is shutting down.
        :DS_SHUTTING_DOWN, 8364,
        # MessageId: ERROR_DS_UNKNOWN_OPERATION
        # MessageText:
        # The directory service request is invalid.
        :DS_UNKNOWN_OPERATION, 8365,
        # MessageId: ERROR_DS_INVALID_ROLE_OWNER
        # MessageText:
        # The role owner attribute could not be read.
        :DS_INVALID_ROLE_OWNER, 8366,
        # MessageId: ERROR_DS_COULDNT_CONTACT_FSMO
        # MessageText:
        # The requested FSMO operation failed. The current FSMO holder could not be contacted.
        :DS_COULDNT_CONTACT_FSMO, 8367,
        # MessageId: ERROR_DS_CROSS_NC_DN_RENAME
        # MessageText:
        # Modification of a DN across a naming context is not permitted.
        :DS_CROSS_NC_DN_RENAME, 8368,
        # MessageId: ERROR_DS_CANT_MOD_SYSTEM_ONLY
        # MessageText:
        # The attribute cannot be modified because it is owned by the system.
        :DS_CANT_MOD_SYSTEM_ONLY, 8369,
        # MessageId: ERROR_DS_REPLICATOR_ONLY
        # MessageText:
        # Only the replicator can perform this function.
        :DS_REPLICATOR_ONLY, 8370,
        # MessageId: ERROR_DS_OBJ_CLASS_NOT_DEFINED
        # MessageText:
        # The specified class is not defined.
        :DS_OBJ_CLASS_NOT_DEFINED, 8371,
        # MessageId: ERROR_DS_OBJ_CLASS_NOT_SUBCLASS
        # MessageText:
        # The specified class is not a subclass.
        :DS_OBJ_CLASS_NOT_SUBCLASS, 8372,
        # MessageId: ERROR_DS_NAME_REFERENCE_INVALID
        # MessageText:
        # The name reference is invalid.
        :DS_NAME_REFERENCE_INVALID, 8373,
        # MessageId: ERROR_DS_CROSS_REF_EXISTS
        # MessageText:
        # A cross reference already exists.
        :DS_CROSS_REF_EXISTS, 8374,
        # MessageId: ERROR_DS_CANT_DEL_MASTER_CROSSREF
        # MessageText:
        # It is not permitted to delete a master cross reference.
        :DS_CANT_DEL_MASTER_CROSSREF, 8375,
        # MessageId: ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD
        # MessageText:
        # Subtree notifications are only supported on NC heads.
        :DS_SUBTREE_NOTIFY_NOT_NC_HEAD, 8376,
        # MessageId: ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX
        # MessageText:
        # Notification filter is too complex.
        :DS_NOTIFY_FILTER_TOO_COMPLEX, 8377,
        # MessageId: ERROR_DS_DUP_RDN
        # MessageText:
        # Schema update failed: duplicate RDN.
        :DS_DUP_RDN, 8378,
        # MessageId: ERROR_DS_DUP_OID
        # MessageText:
        # Schema update failed: duplicate OID.
        :DS_DUP_OID, 8379,
        # MessageId: ERROR_DS_DUP_MAPI_ID
        # MessageText:
        # Schema update failed: duplicate MAPI identifier.
        :DS_DUP_MAPI_ID, 8380,
        # MessageId: ERROR_DS_DUP_SCHEMA_ID_GUID
        # MessageText:
        # Schema update failed: duplicate schema-id GUID.
        :DS_DUP_SCHEMA_ID_GUID, 8381,
        # MessageId: ERROR_DS_DUP_LDAP_DISPLAY_NAME
        # MessageText:
        # Schema update failed: duplicate LDAP display name.
        :DS_DUP_LDAP_DISPLAY_NAME, 8382,
        # MessageId: ERROR_DS_SEMANTIC_ATT_TEST
        # MessageText:
        # Schema update failed: range-lower less than range upper.
        :DS_SEMANTIC_ATT_TEST, 8383,
        # MessageId: ERROR_DS_SYNTAX_MISMATCH
        # MessageText:
        # Schema update failed: syntax mismatch.
        :DS_SYNTAX_MISMATCH, 8384,
        # MessageId: ERROR_DS_EXISTS_IN_MUST_HAVE
        # MessageText:
        # Schema deletion failed: attribute is used in must-contain.
        :DS_EXISTS_IN_MUST_HAVE, 8385,
        # MessageId: ERROR_DS_EXISTS_IN_MAY_HAVE
        # MessageText:
        # Schema deletion failed: attribute is used in may-contain.
        :DS_EXISTS_IN_MAY_HAVE, 8386,
        # MessageId: ERROR_DS_NONEXISTENT_MAY_HAVE
        # MessageText:
        # Schema update failed: attribute in may-contain does not exist.
        :DS_NONEXISTENT_MAY_HAVE, 8387,
        # MessageId: ERROR_DS_NONEXISTENT_MUST_HAVE
        # MessageText:
        # Schema update failed: attribute in must-contain does not exist.
        :DS_NONEXISTENT_MUST_HAVE, 8388,
        # MessageId: ERROR_DS_AUX_CLS_TEST_FAIL
        # MessageText:
        # Schema update failed: class in aux-class list does not exist or is not an auxiliary class.
        :DS_AUX_CLS_TEST_FAIL, 8389,
        # MessageId: ERROR_DS_NONEXISTENT_POSS_SUP
        # MessageText:
        # Schema update failed: class in poss-superiors does not exist.
        :DS_NONEXISTENT_POSS_SUP, 8390,
        # MessageId: ERROR_DS_SUB_CLS_TEST_FAIL
        # MessageText:
        # Schema update failed: class in subclassof list does not exist or does not satisfy hierarchy rules.
        :DS_SUB_CLS_TEST_FAIL, 8391,
        # MessageId: ERROR_DS_BAD_RDN_ATT_ID_SYNTAX
        # MessageText:
        # Schema update failed: Rdn-Att-Id has wrong syntax.
        :DS_BAD_RDN_ATT_ID_SYNTAX, 8392,
        # MessageId: ERROR_DS_EXISTS_IN_AUX_CLS
        # MessageText:
        # Schema deletion failed: class is used as auxiliary class.
        :DS_EXISTS_IN_AUX_CLS, 8393,
        # MessageId: ERROR_DS_EXISTS_IN_SUB_CLS
        # MessageText:
        # Schema deletion failed: class is used as sub class.
        :DS_EXISTS_IN_SUB_CLS, 8394,
        # MessageId: ERROR_DS_EXISTS_IN_POSS_SUP
        # MessageText:
        # Schema deletion failed: class is used as poss superior.
        :DS_EXISTS_IN_POSS_SUP, 8395,
        # MessageId: ERROR_DS_RECALCSCHEMA_FAILED
        # MessageText:
        # Schema update failed in recalculating validation cache.
        :DS_RECALCSCHEMA_FAILED, 8396,
        # MessageId: ERROR_DS_TREE_DELETE_NOT_FINISHED
        # MessageText:
        # The tree deletion is not finished. The request must be made again to continue deleting the tree.
        :DS_TREE_DELETE_NOT_FINISHED, 8397,
        # MessageId: ERROR_DS_CANT_DELETE
        # MessageText:
        # The requested delete operation could not be performed.
        :DS_CANT_DELETE, 8398,
        # MessageId: ERROR_DS_ATT_SCHEMA_REQ_ID
        # MessageText:
        # Cannot read the governs class identifier for the schema record.
        :DS_ATT_SCHEMA_REQ_ID, 8399,
        # MessageId: ERROR_DS_BAD_ATT_SCHEMA_SYNTAX
        # MessageText:
        # The attribute schema has bad syntax.
        :DS_BAD_ATT_SCHEMA_SYNTAX, 8400,
        # MessageId: ERROR_DS_CANT_CACHE_ATT
        # MessageText:
        # The attribute could not be cached.
        :DS_CANT_CACHE_ATT, 8401,
        # MessageId: ERROR_DS_CANT_CACHE_CLASS
        # MessageText:
        # The class could not be cached.
        :DS_CANT_CACHE_CLASS, 8402,
        # MessageId: ERROR_DS_CANT_REMOVE_ATT_CACHE
        # MessageText:
        # The attribute could not be removed from the cache.
        :DS_CANT_REMOVE_ATT_CACHE, 8403,
        # MessageId: ERROR_DS_CANT_REMOVE_CLASS_CACHE
        # MessageText:
        # The class could not be removed from the cache.
        :DS_CANT_REMOVE_CLASS_CACHE, 8404,
        # MessageId: ERROR_DS_CANT_RETRIEVE_DN
        # MessageText:
        # The distinguished name attribute could not be read.
        :DS_CANT_RETRIEVE_DN, 8405,
        # MessageId: ERROR_DS_MISSING_SUPREF
        # MessageText:
        # No superior reference has been configured for the directory service. The directory service is therefore unable to issue referrals to objects outside this forest.
        :DS_MISSING_SUPREF, 8406,
        # MessageId: ERROR_DS_CANT_RETRIEVE_INSTANCE
        # MessageText:
        # The instance type attribute could not be retrieved.
        :DS_CANT_RETRIEVE_INSTANCE, 8407,
        # MessageId: ERROR_DS_CODE_INCONSISTENCY
        # MessageText:
        # An internal error has occurred.
        :DS_CODE_INCONSISTENCY, 8408,
        # MessageId: ERROR_DS_DATABASE_ERROR
        # MessageText:
        # A database error has occurred.
        :DS_DATABASE_ERROR, 8409,
        # MessageId: ERROR_DS_GOVERNSID_MISSING
        # MessageText:
        # The attribute GOVERNSID is missing.
        :DS_GOVERNSID_MISSING, 8410,
        # MessageId: ERROR_DS_MISSING_EXPECTED_ATT
        # MessageText:
        # An expected attribute is missing.
        :DS_MISSING_EXPECTED_ATT, 8411,
        # MessageId: ERROR_DS_NCNAME_MISSING_CR_REF
        # MessageText:
        # The specified naming context is missing a cross reference.
        :DS_NCNAME_MISSING_CR_REF, 8412,
        # MessageId: ERROR_DS_SECURITY_CHECKING_ERROR
        # MessageText:
        # A security checking error has occurred.
        :DS_SECURITY_CHECKING_ERROR, 8413,
        # MessageId: ERROR_DS_SCHEMA_NOT_LOADED
        # MessageText:
        # The schema is not loaded.
        :DS_SCHEMA_NOT_LOADED, 8414,
        # MessageId: ERROR_DS_SCHEMA_ALLOC_FAILED
        # MessageText:
        # Schema allocation failed. Please check if the machine is running low on memory.
        :DS_SCHEMA_ALLOC_FAILED, 8415,
        # MessageId: ERROR_DS_ATT_SCHEMA_REQ_SYNTAX
        # MessageText:
        # Failed to obtain the required syntax for the attribute schema.
        :DS_ATT_SCHEMA_REQ_SYNTAX, 8416,
        # MessageId: ERROR_DS_GCVERIFY_ERROR
        # MessageText:
        # The global catalog verification failed. The global catalog is not available or does not support the operation. Some part of the directory is currently not available.
        :DS_GCVERIFY_ERROR, 8417,
        # MessageId: ERROR_DS_DRA_SCHEMA_MISMATCH
        # MessageText:
        # The replication operation failed because of a schema mismatch between the servers involved.
        :DS_DRA_SCHEMA_MISMATCH, 8418,
        # MessageId: ERROR_DS_CANT_FIND_DSA_OBJ
        # MessageText:
        # The DSA object could not be found.
        :DS_CANT_FIND_DSA_OBJ, 8419,
        # MessageId: ERROR_DS_CANT_FIND_EXPECTED_NC
        # MessageText:
        # The naming context could not be found.
        :DS_CANT_FIND_EXPECTED_NC, 8420,
        # MessageId: ERROR_DS_CANT_FIND_NC_IN_CACHE
        # MessageText:
        # The naming context could not be found in the cache.
        :DS_CANT_FIND_NC_IN_CACHE, 8421,
        # MessageId: ERROR_DS_CANT_RETRIEVE_CHILD
        # MessageText:
        # The child object could not be retrieved.
        :DS_CANT_RETRIEVE_CHILD, 8422,
        # MessageId: ERROR_DS_SECURITY_ILLEGAL_MODIFY
        # MessageText:
        # The modification was not permitted for security reasons.
        :DS_SECURITY_ILLEGAL_MODIFY, 8423,
        # MessageId: ERROR_DS_CANT_REPLACE_HIDDEN_REC
        # MessageText:
        # The operation cannot replace the hidden record.
        :DS_CANT_REPLACE_HIDDEN_REC, 8424,
        # MessageId: ERROR_DS_BAD_HIERARCHY_FILE
        # MessageText:
        # The hierarchy file is invalid.
        :DS_BAD_HIERARCHY_FILE, 8425,
        # MessageId: ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED
        # MessageText:
        # The attempt to build the hierarchy table failed.
        :DS_BUILD_HIERARCHY_TABLE_FAILED, 8426,
        # MessageId: ERROR_DS_CONFIG_PARAM_MISSING
        # MessageText:
        # The directory configuration parameter is missing from the registry.
        :DS_CONFIG_PARAM_MISSING, 8427,
        # MessageId: ERROR_DS_COUNTING_AB_INDICES_FAILED
        # MessageText:
        # The attempt to count the address book indices failed.
        :DS_COUNTING_AB_INDICES_FAILED, 8428,
        # MessageId: ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED
        # MessageText:
        # The allocation of the hierarchy table failed.
        :DS_HIERARCHY_TABLE_MALLOC_FAILED, 8429,
        # MessageId: ERROR_DS_INTERNAL_FAILURE
        # MessageText:
        # The directory service encountered an internal failure.
        :DS_INTERNAL_FAILURE, 8430,
        # MessageId: ERROR_DS_UNKNOWN_ERROR
        # MessageText:
        # The directory service encountered an unknown failure.
        :DS_UNKNOWN_ERROR, 8431,
        # MessageId: ERROR_DS_ROOT_REQUIRES_CLASS_TOP
        # MessageText:
        # A root object requires a class of 'top'.
        :DS_ROOT_REQUIRES_CLASS_TOP, 8432,
        # MessageId: ERROR_DS_REFUSING_FSMO_ROLES
        # MessageText:
        # This directory server is shutting down, and cannot take ownership of new floating single-master operation roles.
        :DS_REFUSING_FSMO_ROLES, 8433,
        # MessageId: ERROR_DS_MISSING_FSMO_SETTINGS
        # MessageText:
        # The directory service is missing mandatory configuration information, and is unable to determine the ownership of floating single-master operation roles.
        :DS_MISSING_FSMO_SETTINGS, 8434,
        # MessageId: ERROR_DS_UNABLE_TO_SURRENDER_ROLES
        # MessageText:
        # The directory service was unable to transfer ownership of one or more floating single-master operation roles to other servers.
        :DS_UNABLE_TO_SURRENDER_ROLES, 8435,
        # MessageId: ERROR_DS_DRA_GENERIC
        # MessageText:
        # The replication operation failed.
        :DS_DRA_GENERIC, 8436,
        # MessageId: ERROR_DS_DRA_INVALID_PARAMETER
        # MessageText:
        # An invalid parameter was specified for this replication operation.
        :DS_DRA_INVALID_PARAMETER, 8437,
        # MessageId: ERROR_DS_DRA_BUSY
        # MessageText:
        # The directory service is too busy to complete the replication operation at this time.
        :DS_DRA_BUSY, 8438,
        # MessageId: ERROR_DS_DRA_BAD_DN
        # MessageText:
        # The distinguished name specified for this replication operation is invalid.
        :DS_DRA_BAD_DN, 8439,
        # MessageId: ERROR_DS_DRA_BAD_NC
        # MessageText:
        # The naming context specified for this replication operation is invalid.
        :DS_DRA_BAD_NC, 8440,
        # MessageId: ERROR_DS_DRA_DN_EXISTS
        # MessageText:
        # The distinguished name specified for this replication operation already exists.
        :DS_DRA_DN_EXISTS, 8441,
        # MessageId: ERROR_DS_DRA_INTERNAL_ERROR
        # MessageText:
        # The replication system encountered an internal error.
        :DS_DRA_INTERNAL_ERROR, 8442,
        # MessageId: ERROR_DS_DRA_INCONSISTENT_DIT
        # MessageText:
        # The replication operation encountered a database inconsistency.
        :DS_DRA_INCONSISTENT_DIT, 8443,
        # MessageId: ERROR_DS_DRA_CONNECTION_FAILED
        # MessageText:
        # The server specified for this replication operation could not be contacted.
        :DS_DRA_CONNECTION_FAILED, 8444,
        # MessageId: ERROR_DS_DRA_BAD_INSTANCE_TYPE
        # MessageText:
        # The replication operation encountered an object with an invalid instance type.
        :DS_DRA_BAD_INSTANCE_TYPE, 8445,
        # MessageId: ERROR_DS_DRA_OUT_OF_MEM
        # MessageText:
        # The replication operation failed to allocate memory.
        :DS_DRA_OUT_OF_MEM, 8446,
        # MessageId: ERROR_DS_DRA_MAIL_PROBLEM
        # MessageText:
        # The replication operation encountered an error with the mail system.
        :DS_DRA_MAIL_PROBLEM, 8447,
        # MessageId: ERROR_DS_DRA_REF_ALREADY_EXISTS
        # MessageText:
        # The replication reference information for the target server already exists.
        :DS_DRA_REF_ALREADY_EXISTS, 8448,
        # MessageId: ERROR_DS_DRA_REF_NOT_FOUND
        # MessageText:
        # The replication reference information for the target server does not exist.
        :DS_DRA_REF_NOT_FOUND, 8449,
        # MessageId: ERROR_DS_DRA_OBJ_IS_REP_SOURCE
        # MessageText:
        # The naming context cannot be removed because it is replicated to another server.
        :DS_DRA_OBJ_IS_REP_SOURCE, 8450,
        # MessageId: ERROR_DS_DRA_DB_ERROR
        # MessageText:
        # The replication operation encountered a database error.
        :DS_DRA_DB_ERROR, 8451,
        # MessageId: ERROR_DS_DRA_NO_REPLICA
        # MessageText:
        # The naming context is in the process of being removed or is not replicated from the specified server.
        :DS_DRA_NO_REPLICA, 8452,
        # MessageId: ERROR_DS_DRA_ACCESS_DENIED
        # MessageText:
        # Replication access was denied.
        :DS_DRA_ACCESS_DENIED, 8453,
        # MessageId: ERROR_DS_DRA_NOT_SUPPORTED
        # MessageText:
        # The requested operation is not supported by this version of the directory service.
        :DS_DRA_NOT_SUPPORTED, 8454,
        # MessageId: ERROR_DS_DRA_RPC_CANCELLED
        # MessageText:
        # The replication remote procedure call was cancelled.
        :DS_DRA_RPC_CANCELLED, 8455,
        # MessageId: ERROR_DS_DRA_SOURCE_DISABLED
        # MessageText:
        # The source server is currently rejecting replication requests.
        :DS_DRA_SOURCE_DISABLED, 8456,
        # MessageId: ERROR_DS_DRA_SINK_DISABLED
        # MessageText:
        # The destination server is currently rejecting replication requests.
        :DS_DRA_SINK_DISABLED, 8457,
        # MessageId: ERROR_DS_DRA_NAME_COLLISION
        # MessageText:
        # The replication operation failed due to a collision of object names.
        :DS_DRA_NAME_COLLISION, 8458,
        # MessageId: ERROR_DS_DRA_SOURCE_REINSTALLED
        # MessageText:
        # The replication source has been reinstalled.
        :DS_DRA_SOURCE_REINSTALLED, 8459,
        # MessageId: ERROR_DS_DRA_MISSING_PARENT
        # MessageText:
        # The replication operation failed because a required parent object is missing.
        :DS_DRA_MISSING_PARENT, 8460,
        # MessageId: ERROR_DS_DRA_PREEMPTED
        # MessageText:
        # The replication operation was preempted.
        :DS_DRA_PREEMPTED, 8461,
        # MessageId: ERROR_DS_DRA_ABANDON_SYNC
        # MessageText:
        # The replication synchronization attempt was abandoned because of a lack of updates.
        :DS_DRA_ABANDON_SYNC, 8462,
        # MessageId: ERROR_DS_DRA_SHUTDOWN
        # MessageText:
        # The replication operation was terminated because the system is shutting down.
        :DS_DRA_SHUTDOWN, 8463,
        # MessageId: ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET
        # MessageText:
        # Synchronization attempt failed because the destination DC is currently waiting to synchronize new partial attributes from source. This condition is normal if a recent schema change modified the partial attribute set. The destination partial attribute set is not a subset of source partial attribute set.
        :DS_DRA_INCOMPATIBLE_PARTIAL_SET, 8464,
        # MessageId: ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA
        # MessageText:
        # The replication synchronization attempt failed because a master replica attempted to sync from a partial replica.
        :DS_DRA_SOURCE_IS_PARTIAL_REPLICA, 8465,
        # MessageId: ERROR_DS_DRA_EXTN_CONNECTION_FAILED
        # MessageText:
        # The server specified for this replication operation was contacted, but that server was unable to contact an additional server needed to complete the operation.
        :DS_DRA_EXTN_CONNECTION_FAILED, 8466,
        # MessageId: ERROR_DS_INSTALL_SCHEMA_MISMATCH
        # MessageText:
        # The version of the directory service schema of the source forest is not compatible with the version of directory service on this computer.
        :DS_INSTALL_SCHEMA_MISMATCH, 8467,
        # MessageId: ERROR_DS_DUP_LINK_ID
        # MessageText:
        # Schema update failed: An attribute with the same link identifier already exists.
        :DS_DUP_LINK_ID, 8468,
        # MessageId: ERROR_DS_NAME_ERROR_RESOLVING
        # MessageText:
        # Name translation: Generic processing error.
        :DS_NAME_ERROR_RESOLVING, 8469,
        # MessageId: ERROR_DS_NAME_ERROR_NOT_FOUND
        # MessageText:
        # Name translation: Could not find the name or insufficient right to see name.
        :DS_NAME_ERROR_NOT_FOUND, 8470,
        # MessageId: ERROR_DS_NAME_ERROR_NOT_UNIQUE
        # MessageText:
        # Name translation: Input name mapped to more than one output name.
        :DS_NAME_ERROR_NOT_UNIQUE, 8471,
        # MessageId: ERROR_DS_NAME_ERROR_NO_MAPPING
        # MessageText:
        # Name translation: Input name found, but not the associated output format.
        :DS_NAME_ERROR_NO_MAPPING, 8472,
        # MessageId: ERROR_DS_NAME_ERROR_DOMAIN_ONLY
        # MessageText:
        # Name translation: Unable to resolve completely, only the domain was found.
        :DS_NAME_ERROR_DOMAIN_ONLY, 8473,
        # MessageId: ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING
        # MessageText:
        # Name translation: Unable to perform purely syntactical mapping at the client without going out to the wire.
        :DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING, 8474,
        # MessageId: ERROR_DS_CONSTRUCTED_ATT_MOD
        # MessageText:
        # Modification of a constructed attribute is not allowed.
        :DS_CONSTRUCTED_ATT_MOD, 8475,
        # MessageId: ERROR_DS_WRONG_OM_OBJ_CLASS
        # MessageText:
        # The OM-Object-Class specified is incorrect for an attribute with the specified syntax.
        :DS_WRONG_OM_OBJ_CLASS, 8476,
        # MessageId: ERROR_DS_DRA_REPL_PENDING
        # MessageText:
        # The replication request has been posted; waiting for reply.
        :DS_DRA_REPL_PENDING, 8477,
        # MessageId: ERROR_DS_DS_REQUIRED
        # MessageText:
        # The requested operation requires a directory service, and none was available.
        :DS_DS_REQUIRED, 8478,
        # MessageId: ERROR_DS_INVALID_LDAP_DISPLAY_NAME
        # MessageText:
        # The LDAP display name of the class or attribute contains non-ASCII characters.
        :DS_INVALID_LDAP_DISPLAY_NAME, 8479,
        # MessageId: ERROR_DS_NON_BASE_SEARCH
        # MessageText:
        # The requested search operation is only supported for base searches.
        :DS_NON_BASE_SEARCH, 8480,
        # MessageId: ERROR_DS_CANT_RETRIEVE_ATTS
        # MessageText:
        # The search failed to retrieve attributes from the database.
        :DS_CANT_RETRIEVE_ATTS, 8481,
        # MessageId: ERROR_DS_BACKLINK_WITHOUT_LINK
        # MessageText:
        # The schema update operation tried to add a backward link attribute that has no corresponding forward link.
        :DS_BACKLINK_WITHOUT_LINK, 8482,
        # MessageId: ERROR_DS_EPOCH_MISMATCH
        # MessageText:
        # Source and destination of a cross-domain move do not agree on the object's epoch number. Either source or destination does not have the latest version of the object.
        :DS_EPOCH_MISMATCH, 8483,
        # MessageId: ERROR_DS_SRC_NAME_MISMATCH
        # MessageText:
        # Source and destination of a cross-domain move do not agree on the object's current name. Either source or destination does not have the latest version of the object.
        :DS_SRC_NAME_MISMATCH, 8484,
        # MessageId: ERROR_DS_SRC_AND_DST_NC_IDENTICAL
        # MessageText:
        # Source and destination for the cross-domain move operation are identical. Caller should use local move operation instead of cross-domain move operation.
        :DS_SRC_AND_DST_NC_IDENTICAL, 8485,
        # MessageId: ERROR_DS_DST_NC_MISMATCH
        # MessageText:
        # Source and destination for a cross-domain move are not in agreement on the naming contexts in the forest. Either source or destination does not have the latest version of the Partitions container.
        :DS_DST_NC_MISMATCH, 8486,
        # MessageId: ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC
        # MessageText:
        # Destination of a cross-domain move is not authoritative for the destination naming context.
        :DS_NOT_AUTHORITIVE_FOR_DST_NC, 8487,
        # MessageId: ERROR_DS_SRC_GUID_MISMATCH
        # MessageText:
        # Source and destination of a cross-domain move do not agree on the identity of the source object. Either source or destination does not have the latest version of the source object.
        :DS_SRC_GUID_MISMATCH, 8488,
        # MessageId: ERROR_DS_CANT_MOVE_DELETED_OBJECT
        # MessageText:
        # Object being moved across-domains is already known to be deleted by the destination server. The source server does not have the latest version of the source object.
        :DS_CANT_MOVE_DELETED_OBJECT, 8489,
        # MessageId: ERROR_DS_PDC_OPERATION_IN_PROGRESS
        # MessageText:
        # Another operation which requires exclusive access to the PDC FSMO is already in progress.
        :DS_PDC_OPERATION_IN_PROGRESS, 8490,
        # MessageId: ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD
        # MessageText:
        # A cross-domain move operation failed such that two versions of the moved object exist - one each in the source and destination domains. The destination object needs to be removed to restore the system to a consistent state.
        :DS_CROSS_DOMAIN_CLEANUP_REQD, 8491,
        # MessageId: ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION
        # MessageText:
        # This object may not be moved across domain boundaries either because cross-domain moves for this class are disallowed, or the object has some special characteristics, e.g.: trust account or restricted RID, which prevent its move.
        :DS_ILLEGAL_XDOM_MOVE_OPERATION, 8492,
        # MessageId: ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS
        # MessageText:
        # Can't move objects with memberships across domain boundaries as once moved, this would violate the membership conditions of the account group. Remove the object from any account group memberships and retry.
        :DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS, 8493,
        # MessageId: ERROR_DS_NC_MUST_HAVE_NC_PARENT
        # MessageText:
        # A naming context head must be the immediate child of another naming context head, not of an interior node.
        :DS_NC_MUST_HAVE_NC_PARENT, 8494,
        # MessageId: ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE
        # MessageText:
        # The directory cannot validate the proposed naming context name because it does not hold a replica of the naming context above the proposed naming context. Please ensure that the domain naming master role is held by a server that is configured as a global catalog server, and that the server is up to date with its replication partners. (Applies only to Windows 2000 Domain Naming masters)
        :DS_CR_IMPOSSIBLE_TO_VALIDATE, 8495,
        # MessageId: ERROR_DS_DST_DOMAIN_NOT_NATIVE
        # MessageText:
        # Destination domain must be in native mode.
        :DS_DST_DOMAIN_NOT_NATIVE, 8496,
        # MessageId: ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER
        # MessageText:
        # The operation cannot be performed because the server does not have an infrastructure container in the domain of interest.
        :DS_MISSING_INFRASTRUCTURE_CONTAINER, 8497,
        # MessageId: ERROR_DS_CANT_MOVE_ACCOUNT_GROUP
        # MessageText:
        # Cross-domain move of non-empty account groups is not allowed.
        :DS_CANT_MOVE_ACCOUNT_GROUP, 8498,
        # MessageId: ERROR_DS_CANT_MOVE_RESOURCE_GROUP
        # MessageText:
        # Cross-domain move of non-empty resource groups is not allowed.
        :DS_CANT_MOVE_RESOURCE_GROUP, 8499,
        # MessageId: ERROR_DS_INVALID_SEARCH_FLAG
        # MessageText:
        # The search flags for the attribute are invalid. The ANR bit is valid only on attributes of Unicode or Teletex strings.
        :DS_INVALID_SEARCH_FLAG, 8500,
        # MessageId: ERROR_DS_NO_TREE_DELETE_ABOVE_NC
        # MessageText:
        # Tree deletions starting at an object which has an NC head as a descendant are not allowed.
        :DS_NO_TREE_DELETE_ABOVE_NC, 8501,
        # MessageId: ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE
        # MessageText:
        # The directory service failed to lock a tree in preparation for a tree deletion because the tree was in use.
        :DS_COULDNT_LOCK_TREE_FOR_DELETE, 8502,
        # MessageId: ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE
        # MessageText:
        # The directory service failed to identify the list of objects to delete while attempting a tree deletion.
        :DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE, 8503,
        # MessageId: ERROR_DS_SAM_INIT_FAILURE
        # MessageText:
        # Security Accounts Manager initialization failed because of the following error: %1.
        # Error Status: 0x%2. Please shutdown this system and reboot into Directory Services Restore Mode, check the event log for more detailed information.
        :DS_SAM_INIT_FAILURE, 8504,
        # MessageId: ERROR_DS_SENSITIVE_GROUP_VIOLATION
        # MessageText:
        # Only an administrator can modify the membership list of an administrative group.
        :DS_SENSITIVE_GROUP_VIOLATION, 8505,
        # MessageId: ERROR_DS_CANT_MOD_PRIMARYGROUPID
        # MessageText:
        # Cannot change the primary group ID of a domain controller account.
        :DS_CANT_MOD_PRIMARYGROUPID, 8506,
        # MessageId: ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD
        # MessageText:
        # An attempt is made to modify the base schema.
        :DS_ILLEGAL_BASE_SCHEMA_MOD, 8507,
        # MessageId: ERROR_DS_NONSAFE_SCHEMA_CHANGE
        # MessageText:
        # Adding a new mandatory attribute to an existing class, deleting a mandatory attribute from an existing class, or adding an optional attribute to the special class Top that is not a backlink attribute (directly or through inheritance, for example, by adding or deleting an auxiliary class) is not allowed.
        :DS_NONSAFE_SCHEMA_CHANGE, 8508,
        # MessageId: ERROR_DS_SCHEMA_UPDATE_DISALLOWED
        # MessageText:
        # Schema update is not allowed on this DC because the DC is not the schema FSMO Role Owner.
        :DS_SCHEMA_UPDATE_DISALLOWED, 8509,
        # MessageId: ERROR_DS_CANT_CREATE_UNDER_SCHEMA
        # MessageText:
        # An object of this class cannot be created under the schema container. You can only create attribute-schema and class-schema objects under the schema container.
        :DS_CANT_CREATE_UNDER_SCHEMA, 8510,
        # MessageId: ERROR_DS_INSTALL_NO_SRC_SCH_VERSION
        # MessageText:
        # The replica/child install failed to get the objectVersion attribute on the schema container on the source DC. Either the attribute is missing on the schema container or the credentials supplied do not have permission to read it.
        :DS_INSTALL_NO_SRC_SCH_VERSION, 8511,
        # MessageId: ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE
        # MessageText:
        # The replica/child install failed to read the objectVersion attribute in the SCHEMA section of the file schema.ini in the system32 directory.
        :DS_INSTALL_NO_SCH_VERSION_IN_INIFILE, 8512,
        # MessageId: ERROR_DS_INVALID_GROUP_TYPE
        # MessageText:
        # The specified group type is invalid.
        :DS_INVALID_GROUP_TYPE, 8513,
        # MessageId: ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN
        # MessageText:
        # You cannot nest global groups in a mixed domain if the group is security-enabled.
        :DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN, 8514,
        # MessageId: ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN
        # MessageText:
        # You cannot nest local groups in a mixed domain if the group is security-enabled.
        :DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN, 8515,
        # MessageId: ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER
        # MessageText:
        # A global group cannot have a local group as a member.
        :DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER, 8516,
        # MessageId: ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER
        # MessageText:
        # A global group cannot have a universal group as a member.
        :DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER, 8517,
        # MessageId: ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER
        # MessageText:
        # A universal group cannot have a local group as a member.
        :DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER, 8518,
        # MessageId: ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER
        # MessageText:
        # A global group cannot have a cross-domain member.
        :DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER, 8519,
        # MessageId: ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER
        # MessageText:
        # A local group cannot have another cross domain local group as a member.
        :DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER, 8520,
        # MessageId: ERROR_DS_HAVE_PRIMARY_MEMBERS
        # MessageText:
        # A group with primary members cannot change to a security-disabled group.
        :DS_HAVE_PRIMARY_MEMBERS, 8521,
        # MessageId: ERROR_DS_STRING_SD_CONVERSION_FAILED
        # MessageText:
        # The schema cache load failed to convert the string default SD on a class-schema object.
        :DS_STRING_SD_CONVERSION_FAILED, 8522,
        # MessageId: ERROR_DS_NAMING_MASTER_GC
        # MessageText:
        # Only DSAs configured to be Global Catalog servers should be allowed to hold the Domain Naming Master FSMO role. (Applies only to Windows 2000 servers)
        :DS_NAMING_MASTER_GC, 8523,
        # MessageId: ERROR_DS_DNS_LOOKUP_FAILURE
        # MessageText:
        # The DSA operation is unable to proceed because of a DNS lookup failure.
        :DS_DNS_LOOKUP_FAILURE, 8524,
        # MessageId: ERROR_DS_COULDNT_UPDATE_SPNS
        # MessageText:
        # While processing a change to the DNS Host Name for an object, the Service Principal Name values could not be kept in sync.
        :DS_COULDNT_UPDATE_SPNS, 8525,
        # MessageId: ERROR_DS_CANT_RETRIEVE_SD
        # MessageText:
        # The Security Descriptor attribute could not be read.
        :DS_CANT_RETRIEVE_SD, 8526,
        # MessageId: ERROR_DS_KEY_NOT_UNIQUE
        # MessageText:
        # The object requested was not found, but an object with that key was found.
        :DS_KEY_NOT_UNIQUE, 8527,
        # MessageId: ERROR_DS_WRONG_LINKED_ATT_SYNTAX
        # MessageText:
        # The syntax of the linked attribute being added is incorrect. Forward links can only have syntax 2.5.5.1, 2.5.5.7, and 2.5.5.14, and backlinks can only have syntax 2.5.5.1
        :DS_WRONG_LINKED_ATT_SYNTAX, 8528,
        # MessageId: ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD
        # MessageText:
        # Security Account Manager needs to get the boot password.
        :DS_SAM_NEED_BOOTKEY_PASSWORD, 8529,
        # MessageId: ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY
        # MessageText:
        # Security Account Manager needs to get the boot key from floppy disk.
        :DS_SAM_NEED_BOOTKEY_FLOPPY, 8530,
        # MessageId: ERROR_DS_CANT_START
        # MessageText:
        # Directory Service cannot start.
        :DS_CANT_START, 8531,
        # MessageId: ERROR_DS_INIT_FAILURE
        # MessageText:
        # Directory Services could not start.
        :DS_INIT_FAILURE, 8532,
        # MessageId: ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION
        # MessageText:
        # The connection between client and server requires packet privacy or better.
        :DS_NO_PKT_PRIVACY_ON_CONNECTION, 8533,
        # MessageId: ERROR_DS_SOURCE_DOMAIN_IN_FOREST
        # MessageText:
        # The source domain may not be in the same forest as destination.
        :DS_SOURCE_DOMAIN_IN_FOREST, 8534,
        # MessageId: ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST
        # MessageText:
        # The destination domain must be in the forest.
        :DS_DESTINATION_DOMAIN_NOT_IN_FOREST, 8535,
        # MessageId: ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED
        # MessageText:
        # The operation requires that destination domain auditing be enabled.
        :DS_DESTINATION_AUDITING_NOT_ENABLED, 8536,
        # MessageId: ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN
        # MessageText:
        # The operation couldn't locate a DC for the source domain.
        :DS_CANT_FIND_DC_FOR_SRC_DOMAIN, 8537,
        # MessageId: ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER
        # MessageText:
        # The source object must be a group or user.
        :DS_SRC_OBJ_NOT_GROUP_OR_USER, 8538,
        # MessageId: ERROR_DS_SRC_SID_EXISTS_IN_FOREST
        # MessageText:
        # The source object's SID already exists in destination forest.
        :DS_SRC_SID_EXISTS_IN_FOREST, 8539,
        # MessageId: ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH
        # MessageText:
        # The source and destination object must be of the same type.
        :DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH, 8540,
        # MessageId: ERROR_SAM_INIT_FAILURE
        # MessageText:
        # Security Accounts Manager initialization failed because of the following error: %1.
        # Error Status: 0x%2. Click OK to shut down the system and reboot into Safe Mode. Check the event log for detailed information.
        :SAM_INIT_FAILURE, 8541,
        # MessageId: ERROR_DS_DRA_SCHEMA_INFO_SHIP
        # MessageText:
        # Schema information could not be included in the replication request.
        :DS_DRA_SCHEMA_INFO_SHIP, 8542,
        # MessageId: ERROR_DS_DRA_SCHEMA_CONFLICT
        # MessageText:
        # The replication operation could not be completed due to a schema incompatibility.
        :DS_DRA_SCHEMA_CONFLICT, 8543,
        # MessageId: ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT
        # MessageText:
        # The replication operation could not be completed due to a previous schema incompatibility.
        :DS_DRA_EARLIER_SCHEMA_CONFLICT, 8544,
        # MessageId: ERROR_DS_DRA_OBJ_NC_MISMATCH
        # MessageText:
        # The replication update could not be applied because either the source or the destination has not yet received information regarding a recent cross-domain move operation.
        :DS_DRA_OBJ_NC_MISMATCH, 8545,
        # MessageId: ERROR_DS_NC_STILL_HAS_DSAS
        # MessageText:
        # The requested domain could not be deleted because there exist domain controllers that still host this domain.
        :DS_NC_STILL_HAS_DSAS, 8546,
        # MessageId: ERROR_DS_GC_REQUIRED
        # MessageText:
        # The requested operation can be performed only on a global catalog server.
        :DS_GC_REQUIRED, 8547,
        # MessageId: ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY
        # MessageText:
        # A local group can only be a member of other local groups in the same domain.
        :DS_LOCAL_MEMBER_OF_LOCAL_ONLY, 8548,
        # MessageId: ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS
        # MessageText:
        # Foreign security principals cannot be members of universal groups.
        :DS_NO_FPO_IN_UNIVERSAL_GROUPS, 8549,
        # MessageId: ERROR_DS_CANT_ADD_TO_GC
        # MessageText:
        # The attribute is not allowed to be replicated to the GC because of security reasons.
        :DS_CANT_ADD_TO_GC, 8550,
        # MessageId: ERROR_DS_NO_CHECKPOINT_WITH_PDC
        # MessageText:
        # The checkpoint with the PDC could not be taken because there too many modifications being processed currently.
        :DS_NO_CHECKPOINT_WITH_PDC, 8551,
        # MessageId: ERROR_DS_SOURCE_AUDITING_NOT_ENABLED
        # MessageText:
        # The operation requires that source domain auditing be enabled.
        :DS_SOURCE_AUDITING_NOT_ENABLED, 8552,
        # MessageId: ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC
        # MessageText:
        # Security principal objects can only be created inside domain naming contexts.
        :DS_CANT_CREATE_IN_NONDOMAIN_NC, 8553,
        # MessageId: ERROR_DS_INVALID_NAME_FOR_SPN
        # MessageText:
        # A Service Principal Name (SPN) could not be constructed because the provided hostname is not in the necessary format.
        :DS_INVALID_NAME_FOR_SPN, 8554,
        # MessageId: ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS
        # MessageText:
        # A Filter was passed that uses constructed attributes.
        :DS_FILTER_USES_CONTRUCTED_ATTRS, 8555,
        # MessageId: ERROR_DS_UNICODEPWD_NOT_IN_QUOTES
        # MessageText:
        # The unicodePwd attribute value must be enclosed in double quotes.
        :DS_UNICODEPWD_NOT_IN_QUOTES, 8556,
        # MessageId: ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED
        # MessageText:
        # Your computer could not be joined to the domain. You have exceeded the maximum number of computer accounts you are allowed to create in this domain. Contact your system administrator to have this limit reset or increased.
        :DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED, 8557,
        # MessageId: ERROR_DS_MUST_BE_RUN_ON_DST_DC
        # MessageText:
        # For security reasons, the operation must be run on the destination DC.
        :DS_MUST_BE_RUN_ON_DST_DC, 8558,
        # MessageId: ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER
        # MessageText:
        # For security reasons, the source DC must be NT4SP4 or greater.
        :DS_SRC_DC_MUST_BE_SP4_OR_GREATER, 8559,
        # MessageId: ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ
        # MessageText:
        # Critical Directory Service System objects cannot be deleted during tree delete operations. The tree delete may have been partially performed.
        :DS_CANT_TREE_DELETE_CRITICAL_OBJ, 8560,
        # MessageId: ERROR_DS_INIT_FAILURE_CONSOLE
        # MessageText:
        # Directory Services could not start because of the following error: %1.
        # Error Status: 0x%2. Please click OK to shutdown the system. You can use the recovery console to diagnose the system further.
        :DS_INIT_FAILURE_CONSOLE, 8561,
        # MessageId: ERROR_DS_SAM_INIT_FAILURE_CONSOLE
        # MessageText:
        # Security Accounts Manager initialization failed because of the following error: %1.
        # Error Status: 0x%2. Please click OK to shutdown the system. You can use the recovery console to diagnose the system further.
        :DS_SAM_INIT_FAILURE_CONSOLE, 8562,
        # MessageId: ERROR_DS_FOREST_VERSION_TOO_HIGH
        # MessageText:
        # The version of the operating system is incompatible with the current AD DS forest functional level or AD LDS Configuration Set functional level. You must upgrade to a new version of the operating system before this server can become an AD DS Domain Controller or add an AD LDS Instance in this AD DS Forest or AD LDS Configuration Set.
        :DS_FOREST_VERSION_TOO_HIGH, 8563,
        # MessageId: ERROR_DS_DOMAIN_VERSION_TOO_HIGH
        # MessageText:
        # The version of the operating system installed is incompatible with the current domain functional level. You must upgrade to a new version of the operating system before this server can become a domain controller in this domain.
        :DS_DOMAIN_VERSION_TOO_HIGH, 8564,
        # MessageId: ERROR_DS_FOREST_VERSION_TOO_LOW
        # MessageText:
        # The version of the operating system installed on this server no longer supports the current AD DS Forest functional level or AD LDS Configuration Set functional level. You must raise the AD DS Forest functional level or AD LDS Configuration Set functional level before this server can become an AD DS Domain Controller or an AD LDS Instance in this Forest or Configuration Set.
        :DS_FOREST_VERSION_TOO_LOW, 8565,
        # MessageId: ERROR_DS_DOMAIN_VERSION_TOO_LOW
        # MessageText:
        # The version of the operating system installed on this server no longer supports the current domain functional level. You must raise the domain functional level before this server can become a domain controller in this domain.
        :DS_DOMAIN_VERSION_TOO_LOW, 8566,
        # MessageId: ERROR_DS_INCOMPATIBLE_VERSION
        # MessageText:
        # The version of the operating system installed on this server is incompatible with the functional level of the domain or forest.
        :DS_INCOMPATIBLE_VERSION, 8567,
        # MessageId: ERROR_DS_LOW_DSA_VERSION
        # MessageText:
        # The functional level of the domain (or forest) cannot be raised to the requested value, because there exist one or more domain controllers in the domain (or forest) that are at a lower incompatible functional level.
        :DS_LOW_DSA_VERSION, 8568,
        # MessageId: ERROR_DS_NO_BEHAVIOR_VERSION_IN_MIXEDDOMAIN
        # MessageText:
        # The forest functional level cannot be raised to the requested value since one or more domains are still in mixed domain mode. All domains in the forest must be in native mode, for you to raise the forest functional level.
        :DS_NO_BEHAVIOR_VERSION_IN_MIXEDDOMAIN, 8569,
        # MessageId: ERROR_DS_NOT_SUPPORTED_SORT_ORDER
        # MessageText:
        # The sort order requested is not supported.
        :DS_NOT_SUPPORTED_SORT_ORDER, 8570,
        # MessageId: ERROR_DS_NAME_NOT_UNIQUE
        # MessageText:
        # The requested name already exists as a unique identifier.
        :DS_NAME_NOT_UNIQUE, 8571,
        # MessageId: ERROR_DS_MACHINE_ACCOUNT_CREATED_PRENT4
        # MessageText:
        # The machine account was created pre-NT4. The account needs to be recreated.
        :DS_MACHINE_ACCOUNT_CREATED_PRENT4, 8572,
        # MessageId: ERROR_DS_OUT_OF_VERSION_STORE
        # MessageText:
        # The database is out of version store.
        :DS_OUT_OF_VERSION_STORE, 8573,
        # MessageId: ERROR_DS_INCOMPATIBLE_CONTROLS_USED
        # MessageText:
        # Unable to continue operation because multiple conflicting controls were used.
        :DS_INCOMPATIBLE_CONTROLS_USED, 8574,
        # MessageId: ERROR_DS_NO_REF_DOMAIN
        # MessageText:
        # Unable to find a valid security descriptor reference domain for this partition.
        :DS_NO_REF_DOMAIN, 8575,
        # MessageId: ERROR_DS_RESERVED_LINK_ID
        # MessageText:
        # Schema update failed: The link identifier is reserved.
        :DS_RESERVED_LINK_ID, 8576,
        # MessageId: ERROR_DS_LINK_ID_NOT_AVAILABLE
        # MessageText:
        # Schema update failed: There are no link identifiers available.
        :DS_LINK_ID_NOT_AVAILABLE, 8577,
        # MessageId: ERROR_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER
        # MessageText:
        # An account group cannot have a universal group as a member.
        :DS_AG_CANT_HAVE_UNIVERSAL_MEMBER, 8578,
        # MessageId: ERROR_DS_MODIFYDN_DISALLOWED_BY_INSTANCE_TYPE
        # MessageText:
        # Rename or move operations on naming context heads or read-only objects are not allowed.
        :DS_MODIFYDN_DISALLOWED_BY_INSTANCE_TYPE, 8579,
        # MessageId: ERROR_DS_NO_OBJECT_MOVE_IN_SCHEMA_NC
        # MessageText:
        # Move operations on objects in the schema naming context are not allowed.
        :DS_NO_OBJECT_MOVE_IN_SCHEMA_NC, 8580,
        # MessageId: ERROR_DS_MODIFYDN_DISALLOWED_BY_FLAG
        # MessageText:
        # A system flag has been set on the object and does not allow the object to be moved or renamed.
        :DS_MODIFYDN_DISALLOWED_BY_FLAG, 8581,
        # MessageId: ERROR_DS_MODIFYDN_WRONG_GRANDPARENT
        # MessageText:
        # This object is not allowed to change its grandparent container. Moves are not forbidden on this object, but are restricted to sibling containers.
        :DS_MODIFYDN_WRONG_GRANDPARENT, 8582,
        # MessageId: ERROR_DS_NAME_ERROR_TRUST_REFERRAL
        # MessageText:
        # Unable to resolve completely, a referral to another forest is generated.
        :DS_NAME_ERROR_TRUST_REFERRAL, 8583,
        # MessageId: ERROR_NOT_SUPPORTED_ON_STANDARD_SERVER
        # MessageText:
        # The requested action is not supported on standard server.
        :NOT_SUPPORTED_ON_STANDARD_SERVER, 8584,
        # MessageId: ERROR_DS_CANT_ACCESS_REMOTE_PART_OF_AD
        # MessageText:
        # Could not access a partition of the directory service located on a remote server. Make sure at least one server is running for the partition in question.
        :DS_CANT_ACCESS_REMOTE_PART_OF_AD, 8585,
        # MessageId: ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE_V2
        # MessageText:
        # The directory cannot validate the proposed naming context (or partition) name because it does not hold a replica nor can it contact a replica of the naming context above the proposed naming context. Please ensure that the parent naming context is properly registered in DNS, and at least one replica of this naming context is reachable by the Domain Naming master.
        :DS_CR_IMPOSSIBLE_TO_VALIDATE_V2, 8586,
        # MessageId: ERROR_DS_THREAD_LIMIT_EXCEEDED
        # MessageText:
        # The thread limit for this request was exceeded.
        :DS_THREAD_LIMIT_EXCEEDED, 8587,
        # MessageId: ERROR_DS_NOT_CLOSEST
        # MessageText:
        # The Global catalog server is not in the closest site.
        :DS_NOT_CLOSEST, 8588,
        # MessageId: ERROR_DS_CANT_DERIVE_SPN_WITHOUT_SERVER_REF
        # MessageText:
        # The DS cannot derive a service principal name (SPN) with which to mutually authenticate the target server because the corresponding server object in the local DS database has no serverReference attribute.
        :DS_CANT_DERIVE_SPN_WITHOUT_SERVER_REF, 8589,
        # MessageId: ERROR_DS_SINGLE_USER_MODE_FAILED
        # MessageText:
        # The Directory Service failed to enter single user mode.
        :DS_SINGLE_USER_MODE_FAILED, 8590,
        # MessageId: ERROR_DS_NTDSCRIPT_SYNTAX_ERROR
        # MessageText:
        # The Directory Service cannot parse the script because of a syntax error.
        :DS_NTDSCRIPT_SYNTAX_ERROR, 8591,
        # MessageId: ERROR_DS_NTDSCRIPT_PROCESS_ERROR
        # MessageText:
        # The Directory Service cannot process the script because of an error.
        :DS_NTDSCRIPT_PROCESS_ERROR, 8592,
        # MessageId: ERROR_DS_DIFFERENT_REPL_EPOCHS
        # MessageText:
        # The directory service cannot perform the requested operation because the servers involved are of different replication epochs (which is usually related to a domain rename that is in progress).
        :DS_DIFFERENT_REPL_EPOCHS, 8593,
        # MessageId: ERROR_DS_DRS_EXTENSIONS_CHANGED
        # MessageText:
        # The directory service binding must be renegotiated due to a change in the server extensions information.
        :DS_DRS_EXTENSIONS_CHANGED, 8594,
        # MessageId: ERROR_DS_REPLICA_SET_CHANGE_NOT_ALLOWED_ON_DISABLED_CR
        # MessageText:
        # Operation not allowed on a disabled cross ref.
        :DS_REPLICA_SET_CHANGE_NOT_ALLOWED_ON_DISABLED_CR, 8595,
        # MessageId: ERROR_DS_NO_MSDS_INTID
        # MessageText:
        # Schema update failed: No values for msDS-IntId are available.
        :DS_NO_MSDS_INTID, 8596,
        # MessageId: ERROR_DS_DUP_MSDS_INTID
        # MessageText:
        # Schema update failed: Duplicate msDS-INtId. Retry the operation.
        :DS_DUP_MSDS_INTID, 8597,
        # MessageId: ERROR_DS_EXISTS_IN_RDNATTID
        # MessageText:
        # Schema deletion failed: attribute is used in rDNAttID.
        :DS_EXISTS_IN_RDNATTID, 8598,
        # MessageId: ERROR_DS_AUTHORIZATION_FAILED
        # MessageText:
        # The directory service failed to authorize the request.
        :DS_AUTHORIZATION_FAILED, 8599,
        # MessageId: ERROR_DS_INVALID_SCRIPT
        # MessageText:
        # The Directory Service cannot process the script because it is invalid.
        :DS_INVALID_SCRIPT, 8600,
        # MessageId: ERROR_DS_REMOTE_CROSSREF_OP_FAILED
        # MessageText:
        # The remote create cross reference operation failed on the Domain Naming Master FSMO. The operation's error is in the extended data.
        :DS_REMOTE_CROSSREF_OP_FAILED, 8601,
        # MessageId: ERROR_DS_CROSS_REF_BUSY
        # MessageText:
        # A cross reference is in use locally with the same name.
        :DS_CROSS_REF_BUSY, 8602,
        # MessageId: ERROR_DS_CANT_DERIVE_SPN_FOR_DELETED_DOMAIN
        # MessageText:
        # The DS cannot derive a service principal name (SPN) with which to mutually authenticate the target server because the server's domain has been deleted from the forest.
        :DS_CANT_DERIVE_SPN_FOR_DELETED_DOMAIN, 8603,
        # MessageId: ERROR_DS_CANT_DEMOTE_WITH_WRITEABLE_NC
        # MessageText:
        # Writeable NCs prevent this DC from demoting.
        :DS_CANT_DEMOTE_WITH_WRITEABLE_NC, 8604,
        # MessageId: ERROR_DS_DUPLICATE_ID_FOUND
        # MessageText:
        # The requested object has a non-unique identifier and cannot be retrieved.
        :DS_DUPLICATE_ID_FOUND, 8605,
        # MessageId: ERROR_DS_INSUFFICIENT_ATTR_TO_CREATE_OBJECT
        # MessageText:
        # Insufficient attributes were given to create an object. This object may not exist because it may have been deleted and already garbage collected.
        :DS_INSUFFICIENT_ATTR_TO_CREATE_OBJECT, 8606,
        # MessageId: ERROR_DS_GROUP_CONVERSION_ERROR
        # MessageText:
        # The group cannot be converted due to attribute restrictions on the requested group type.
        :DS_GROUP_CONVERSION_ERROR, 8607,
        # MessageId: ERROR_DS_CANT_MOVE_APP_BASIC_GROUP
        # MessageText:
        # Cross-domain move of non-empty basic application groups is not allowed.
        :DS_CANT_MOVE_APP_BASIC_GROUP, 8608,
        # MessageId: ERROR_DS_CANT_MOVE_APP_QUERY_GROUP
        # MessageText:
        # Cross-domain move of non-empty query based application groups is not allowed.
        :DS_CANT_MOVE_APP_QUERY_GROUP, 8609,
        # MessageId: ERROR_DS_ROLE_NOT_VERIFIED
        # MessageText:
        # The FSMO role ownership could not be verified because its directory partition has not replicated successfully with at least one replication partner.
        :DS_ROLE_NOT_VERIFIED, 8610,
        # MessageId: ERROR_DS_WKO_CONTAINER_CANNOT_BE_SPECIAL
        # MessageText:
        # The target container for a redirection of a well known object container cannot already be a special container.
        :DS_WKO_CONTAINER_CANNOT_BE_SPECIAL, 8611,
        # MessageId: ERROR_DS_DOMAIN_RENAME_IN_PROGRESS
        # MessageText:
        # The Directory Service cannot perform the requested operation because a domain rename operation is in progress.
        :DS_DOMAIN_RENAME_IN_PROGRESS, 8612,
        # MessageId: ERROR_DS_EXISTING_AD_CHILD_NC
        # MessageText:
        # The directory service detected a child partition below the requested partition name. The partition hierarchy must be created in a top down method.
        :DS_EXISTING_AD_CHILD_NC, 8613,
        # MessageId: ERROR_DS_REPL_LIFETIME_EXCEEDED
        # MessageText:
        # The directory service cannot replicate with this server because the time since the last replication with this server has exceeded the tombstone lifetime.
        :DS_REPL_LIFETIME_EXCEEDED, 8614,
        # MessageId: ERROR_DS_DISALLOWED_IN_SYSTEM_CONTAINER
        # MessageText:
        # The requested operation is not allowed on an object under the system container.
        :DS_DISALLOWED_IN_SYSTEM_CONTAINER, 8615,
        # MessageId: ERROR_DS_LDAP_SEND_QUEUE_FULL
        # MessageText:
        # The LDAP servers network send queue has filled up because the client is not processing the results of its requests fast enough. No more requests will be processed until the client catches up. If the client does not catch up then it will be disconnected.
        :DS_LDAP_SEND_QUEUE_FULL, 8616,
        # MessageId: ERROR_DS_DRA_OUT_SCHEDULE_WINDOW
        # MessageText:
        # The scheduled replication did not take place because the system was too busy to execute the request within the schedule window. The replication queue is overloaded. Consider reducing the number of partners or decreasing the scheduled replication frequency.
        :DS_DRA_OUT_SCHEDULE_WINDOW, 8617,
        # MessageId: ERROR_DS_POLICY_NOT_KNOWN
        # MessageText:
        # At this time, it cannot be determined if the branch replication policy is available on the hub domain controller. Please retry at a later time to account for replication latencies.
        :DS_POLICY_NOT_KNOWN, 8618,
        # MessageId: ERROR_NO_SITE_SETTINGS_OBJECT
        # MessageText:
        # The site settings object for the specified site does not exist.
        :NO_SITE_SETTINGS_OBJECT, 8619,
        # MessageId: ERROR_NO_SECRETS
        # MessageText:
        # The local account store does not contain secret material for the specified account.
        :NO_SECRETS, 8620,
        # MessageId: ERROR_NO_WRITABLE_DC_FOUND
        # MessageText:
        # Could not find a writable domain controller in the domain.
        :NO_WRITABLE_DC_FOUND, 8621,
        # MessageId: ERROR_DS_NO_SERVER_OBJECT
        # MessageText:
        # The server object for the domain controller does not exist.
        :DS_NO_SERVER_OBJECT, 8622,
        # MessageId: ERROR_DS_NO_NTDSA_OBJECT
        # MessageText:
        # The NTDS Settings object for the domain controller does not exist.
        :DS_NO_NTDSA_OBJECT, 8623,
        # MessageId: ERROR_DS_NON_ASQ_SEARCH
        # MessageText:
        # The requested search operation is not supported for ASQ searches.
        :DS_NON_ASQ_SEARCH, 8624,
        # MessageId: ERROR_DS_AUDIT_FAILURE
        # MessageText:
        # A required audit event could not be generated for the operation.
        :DS_AUDIT_FAILURE, 8625,
        # MessageId: ERROR_DS_INVALID_SEARCH_FLAG_SUBTREE
        # MessageText:
        # The search flags for the attribute are invalid. The subtree index bit is valid only on single valued attributes.
        :DS_INVALID_SEARCH_FLAG_SUBTREE, 8626,
        # MessageId: ERROR_DS_INVALID_SEARCH_FLAG_TUPLE
        # MessageText:
        # The search flags for the attribute are invalid. The tuple index bit is valid only on attributes of Unicode strings.
        :DS_INVALID_SEARCH_FLAG_TUPLE, 8627,
        # MessageId: ERROR_DS_HIERARCHY_TABLE_TOO_DEEP
        # MessageText:
        # The address books are nested too deeply. Failed to build the hierarchy table.
        :DS_HIERARCHY_TABLE_TOO_DEEP, 8628,
        # MessageId: ERROR_DS_DRA_CORRUPT_UTD_VECTOR
        # MessageText:
        # The specified up-to-date-ness vector is corrupt.
        :DS_DRA_CORRUPT_UTD_VECTOR, 8629,
        # MessageId: ERROR_DS_DRA_SECRETS_DENIED
        # MessageText:
        # The request to replicate secrets is denied.
        :DS_DRA_SECRETS_DENIED, 8630,
        # MessageId: ERROR_DS_RESERVED_MAPI_ID
        # MessageText:
        # Schema update failed: The MAPI identifier is reserved.
        :DS_RESERVED_MAPI_ID, 8631,
        # MessageId: ERROR_DS_MAPI_ID_NOT_AVAILABLE
        # MessageText:
        # Schema update failed: There are no MAPI identifiers available.
        :DS_MAPI_ID_NOT_AVAILABLE, 8632,
        # MessageId: ERROR_DS_DRA_MISSING_KRBTGT_SECRET
        # MessageText:
        # The replication operation failed because the required attributes of the local krbtgt object are missing.
        :DS_DRA_MISSING_KRBTGT_SECRET, 8633,
        # MessageId: ERROR_DS_DOMAIN_NAME_EXISTS_IN_FOREST
        # MessageText:
        # The domain name of the trusted domain already exists in the forest.
        :DS_DOMAIN_NAME_EXISTS_IN_FOREST, 8634,
        # MessageId: ERROR_DS_FLAT_NAME_EXISTS_IN_FOREST
        # MessageText:
        # The flat name of the trusted domain already exists in the forest.
        :DS_FLAT_NAME_EXISTS_IN_FOREST, 8635,
        # MessageId: ERROR_INVALID_USER_PRINCIPAL_NAME
        # MessageText:
        # The User Principal Name (UPN) is invalid.
        :INVALID_USER_PRINCIPAL_NAME, 8636,
        # MessageId: ERROR_DS_OID_MAPPED_GROUP_CANT_HAVE_MEMBERS
        # MessageText:
        # OID mapped groups cannot have members.
        :DS_OID_MAPPED_GROUP_CANT_HAVE_MEMBERS, 8637,
        # MessageId: ERROR_DS_OID_NOT_FOUND
        # MessageText:
        # The specified OID cannot be found.
        :DS_OID_NOT_FOUND, 8638,
        # MessageId: ERROR_DS_DRA_RECYCLED_TARGET
        # MessageText:
        # The replication operation failed because the target object referred by a link value is recycled.
        :DS_DRA_RECYCLED_TARGET, 8639,
        # MessageId: ERROR_DS_DISALLOWED_NC_REDIRECT
        # MessageText:
        # The redirect operation failed because the target object is in a NC different from the domain NC of the current domain controller.
        :DS_DISALLOWED_NC_REDIRECT, 8640,
        # MessageId: ERROR_DS_HIGH_ADLDS_FFL
        # MessageText:
        # The functional level of the AD LDS configuration set cannot be lowered to the requested value.
        :DS_HIGH_ADLDS_FFL, 8641,
        # MessageId: ERROR_DS_HIGH_DSA_VERSION
        # MessageText:
        # The functional level of the domain (or forest) cannot be lowered to the requested value.
        :DS_HIGH_DSA_VERSION, 8642,
        # MessageId: ERROR_DS_LOW_ADLDS_FFL
        # MessageText:
        # The functional level of the AD LDS configuration set cannot be raised to the requested value, because there exist one or more ADLDS instances that are at a lower incompatible functional level.
        :DS_LOW_ADLDS_FFL, 8643,
        # MessageId: ERROR_DOMAIN_SID_SAME_AS_LOCAL_WORKSTATION
        # MessageText:
        # The domain join cannot be completed because the SID of the domain you attempted to join was identical to the SID of this machine. This is a symptom of an improperly cloned operating system install.  You should run sysprep on this machine in order to generate a new machine SID. Please see http:#go.microsoft.com/fwlink/?LinkId=168895 for more information.
        :DOMAIN_SID_SAME_AS_LOCAL_WORKSTATION, 8644,
        # MessageId: ERROR_DS_UNDELETE_SAM_VALIDATION_FAILED
        # MessageText:
        # The undelete operation failed because the Sam Account Name or Additional Sam Account Name of the object being undeleted conflicts with an existing live object.
        :DS_UNDELETE_SAM_VALIDATION_FAILED, 8645,
        # MessageId: ERROR_INCORRECT_ACCOUNT_TYPE
        # MessageText:
        # The system is not authoritative for the specified account and therefore cannot complete the operation. Please retry the operation using the provider associated with this account. If this is an online provider please use the provider's online site.
        :INCORRECT_ACCOUNT_TYPE, 8646,
        # MessageId: ERROR_DS_SPN_VALUE_NOT_UNIQUE_IN_FOREST
        # MessageText:
        # The operation failed because SPN value provided for addition/modification is not unique forest-wide.
        :DS_SPN_VALUE_NOT_UNIQUE_IN_FOREST, 8647,
        # MessageId: ERROR_DS_UPN_VALUE_NOT_UNIQUE_IN_FOREST
        # MessageText:
        # The operation failed because UPN value provided for addition/modification is not unique forest-wide.
        :DS_UPN_VALUE_NOT_UNIQUE_IN_FOREST, 8648,
        # MessageId: ERROR_DS_MISSING_FOREST_TRUST
        # MessageText:
        # The operation failed because the addition/modification referenced an inbound forest-wide trust that is not present.
        :DS_MISSING_FOREST_TRUST, 8649,
        # MessageId: ERROR_DS_VALUE_KEY_NOT_UNIQUE
        # MessageText:
        # The link value specified was not found, but a link value with that key was found.
        :DS_VALUE_KEY_NOT_UNIQUE, 8650,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end