module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Cluster Error codes 5000 to 5999 ===#
        # MessageId: ERROR_DEPENDENT_RESOURCE_EXISTS
        # MessageText:
        # The operation cannot be completed because other resources are dependent on this resource.
        :DEPENDENT_RESOURCE_EXISTS, 5001,
        # MessageId: ERROR_DEPENDENCY_NOT_FOUND
        # MessageText:
        # The cluster resource dependency cannot be found.
        :DEPENDENCY_NOT_FOUND, 5002,
        # MessageId: ERROR_DEPENDENCY_ALREADY_EXISTS
        # MessageText:
        # The cluster resource cannot be made dependent on the specified resource because it is already dependent.
        :DEPENDENCY_ALREADY_EXISTS, 5003,
        # MessageId: ERROR_RESOURCE_NOT_ONLINE
        # MessageText:
        # The cluster resource is not online.
        :RESOURCE_NOT_ONLINE, 5004,
        # MessageId: ERROR_HOST_NODE_NOT_AVAILABLE
        # MessageText:
        # A cluster node is not available for this operation.
        :HOST_NODE_NOT_AVAILABLE, 5005,
        # MessageId: ERROR_RESOURCE_NOT_AVAILABLE
        # MessageText:
        # The cluster resource is not available.
        :RESOURCE_NOT_AVAILABLE, 5006,
        # MessageId: ERROR_RESOURCE_NOT_FOUND
        # MessageText:
        # The cluster resource could not be found.
        :RESOURCE_NOT_FOUND, 5007,
        # MessageId: ERROR_SHUTDOWN_CLUSTER
        # MessageText:
        # The cluster is being shut down.
        :SHUTDOWN_CLUSTER, 5008,
        # MessageId: ERROR_CANT_EVICT_ACTIVE_NODE
        # MessageText:
        # A cluster node cannot be evicted from the cluster unless the node is down or it is the last node.
        :CANT_EVICT_ACTIVE_NODE, 5009,
        # MessageId: ERROR_OBJECT_ALREADY_EXISTS
        # MessageText:
        # The object already exists.
        :OBJECT_ALREADY_EXISTS, 5010,
        # MessageId: ERROR_OBJECT_IN_LIST
        # MessageText:
        # The object is already in the list.
        :OBJECT_IN_LIST, 5011,
        # MessageId: ERROR_GROUP_NOT_AVAILABLE
        # MessageText:
        # The cluster group is not available for any new requests.
        :GROUP_NOT_AVAILABLE, 5012,
        # MessageId: ERROR_GROUP_NOT_FOUND
        # MessageText:
        # The cluster group could not be found.
        :GROUP_NOT_FOUND, 5013,
        # MessageId: ERROR_GROUP_NOT_ONLINE
        # MessageText:
        # The operation could not be completed because the cluster group is not online.
        :GROUP_NOT_ONLINE, 5014,
        # MessageId: ERROR_HOST_NODE_NOT_RESOURCE_OWNER
        # MessageText:
        # The operation failed because either the specified cluster node is not the owner of the resource, or the node
        # is not a possible owner of the resource.
        :HOST_NODE_NOT_RESOURCE_OWNER, 5015,
        # MessageId: ERROR_HOST_NODE_NOT_GROUP_OWNER
        # MessageText:
        # The operation failed because either the specified cluster node is not the owner of the group, or the node is
        # not a possible owner of the group.
        :HOST_NODE_NOT_GROUP_OWNER, 5016,
        # MessageId: ERROR_RESMON_CREATE_FAILED
        # MessageText:
        # The cluster resource could not be created in the specified resource monitor.
        :RESMON_CREATE_FAILED, 5017,
        # MessageId: ERROR_RESMON_ONLINE_FAILED
        # MessageText:
        # The cluster resource could not be brought online by the resource monitor.
        :RESMON_ONLINE_FAILED, 5018,
        # MessageId: ERROR_RESOURCE_ONLINE
        # MessageText:
        # The operation could not be completed because the cluster resource is online.
        :RESOURCE_ONLINE, 5019,
        # MessageId: ERROR_QUORUM_RESOURCE
        # MessageText:
        # The cluster resource could not be deleted or brought offline because it is the quorum resource.
        :QUORUM_RESOURCE, 5020,
        # MessageId: ERROR_NOT_QUORUM_CAPABLE
        # MessageText:
        # The cluster could not make the specified resource a quorum resource because it is not capable of being a
        # quorum resource.
        :NOT_QUORUM_CAPABLE, 5021,
        # MessageId: ERROR_CLUSTER_SHUTTING_DOWN
        # MessageText:
        # The cluster software is shutting down.
        :CLUSTER_SHUTTING_DOWN, 5022,
        # MessageId: ERROR_INVALID_STATE
        # MessageText:
        # The group or resource is not in the correct state to perform the requested operation.
        :INVALID_STATE, 5023,
        # MessageId: ERROR_RESOURCE_PROPERTIES_STORED
        # MessageText:
        # The properties were stored but not all changes will take effect until the next time the resource is brought
        # online.
        :RESOURCE_PROPERTIES_STORED, 5024,
        # MessageId: ERROR_NOT_QUORUM_CLASS
        # MessageText:
        # The cluster could not make the specified resource a quorum resource because it does not belong to a shared
        # storage class.
        :NOT_QUORUM_CLASS, 5025,
        # MessageId: ERROR_CORE_RESOURCE
        # MessageText:
        # The cluster resource could not be deleted since it is a core resource.
        :CORE_RESOURCE, 5026,
        # MessageId: ERROR_QUORUM_RESOURCE_ONLINE_FAILED
        # MessageText:
        # The quorum resource failed to come online.
        :QUORUM_RESOURCE_ONLINE_FAILED, 5027,
        # MessageId: ERROR_QUORUMLOG_OPEN_FAILED
        # MessageText:
        # The quorum log could not be created or mounted successfully.
        :QUORUMLOG_OPEN_FAILED, 5028,
        # MessageId: ERROR_CLUSTERLOG_CORRUPT
        # MessageText:
        # The cluster log is corrupt.
        :CLUSTERLOG_CORRUPT, 5029,
        # MessageId: ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE
        # MessageText:
        # The record could not be written to the cluster log since it exceeds the maximum size.
        :CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE, 5030,
        # MessageId: ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE
        # MessageText:
        # The cluster log exceeds its maximum size.
        :CLUSTERLOG_EXCEEDS_MAXSIZE, 5031,
        # MessageId: ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND
        # MessageText:
        # No checkpoint record was found in the cluster log.
        :CLUSTERLOG_CHKPOINT_NOT_FOUND, 5032,
        # MessageId: ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE
        # MessageText:
        # The minimum required disk space needed for logging is not available.
        :CLUSTERLOG_NOT_ENOUGH_SPACE, 5033,
        # MessageId: ERROR_QUORUM_OWNER_ALIVE
        # MessageText:
        # The cluster node failed to take control of the quorum resource because the resource is owned by another active
        # node.
        :QUORUM_OWNER_ALIVE, 5034,
        # MessageId: ERROR_NETWORK_NOT_AVAILABLE
        # MessageText:
        # A cluster network is not available for this operation.
        :NETWORK_NOT_AVAILABLE, 5035,
        # MessageId: ERROR_NODE_NOT_AVAILABLE
        # MessageText:
        # A cluster node is not available for this operation.
        :NODE_NOT_AVAILABLE, 5036,
        # MessageId: ERROR_ALL_NODES_NOT_AVAILABLE
        # MessageText:
        # All cluster nodes must be running to perform this operation.
        :ALL_NODES_NOT_AVAILABLE, 5037,
        # MessageId: ERROR_RESOURCE_FAILED
        # MessageText:
        # A cluster resource failed.
        :RESOURCE_FAILED, 5038,
        # MessageId: ERROR_CLUSTER_INVALID_NODE
        # MessageText:
        # The cluster node is not valid.
        :CLUSTER_INVALID_NODE, 5039,
        # MessageId: ERROR_CLUSTER_NODE_EXISTS
        # MessageText:
        # The cluster node already exists.
        :CLUSTER_NODE_EXISTS, 5040,
        # MessageId: ERROR_CLUSTER_JOIN_IN_PROGRESS
        # MessageText:
        # A node is in the process of joining the cluster.
        :CLUSTER_JOIN_IN_PROGRESS, 5041,
        # MessageId: ERROR_CLUSTER_NODE_NOT_FOUND
        # MessageText:
        # The cluster node was not found.
        :CLUSTER_NODE_NOT_FOUND, 5042,
        # MessageId: ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND
        # MessageText:
        # The cluster local node information was not found.
        :CLUSTER_LOCAL_NODE_NOT_FOUND, 5043,
        # MessageId: ERROR_CLUSTER_NETWORK_EXISTS
        # MessageText:
        # The cluster network already exists.
        :CLUSTER_NETWORK_EXISTS, 5044,
        # MessageId: ERROR_CLUSTER_NETWORK_NOT_FOUND
        # MessageText:
        # The cluster network was not found.
        :CLUSTER_NETWORK_NOT_FOUND, 5045,
        # MessageId: ERROR_CLUSTER_NETINTERFACE_EXISTS
        # MessageText:
        # The cluster network interface already exists.
        :CLUSTER_NETINTERFACE_EXISTS, 5046,
        # MessageId: ERROR_CLUSTER_NETINTERFACE_NOT_FOUND
        # MessageText:
        # The cluster network interface was not found.
        :CLUSTER_NETINTERFACE_NOT_FOUND, 5047,
        # MessageId: ERROR_CLUSTER_INVALID_REQUEST
        # MessageText:
        # The cluster request is not valid for this object.
        :CLUSTER_INVALID_REQUEST, 5048,
        # MessageId: ERROR_CLUSTER_INVALID_NETWORK_PROVIDER
        # MessageText:
        # The cluster network provider is not valid.
        :CLUSTER_INVALID_NETWORK_PROVIDER, 5049,
        # MessageId: ERROR_CLUSTER_NODE_DOWN
        # MessageText:
        # The cluster node is down.
        :CLUSTER_NODE_DOWN, 5050,
        # MessageId: ERROR_CLUSTER_NODE_UNREACHABLE
        # MessageText:
        # The cluster node is not reachable.
        :CLUSTER_NODE_UNREACHABLE, 5051,
        # MessageId: ERROR_CLUSTER_NODE_NOT_MEMBER
        # MessageText:
        # The cluster node is not a member of the cluster.
        :CLUSTER_NODE_NOT_MEMBER, 5052,
        # MessageId: ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS
        # MessageText:
        # A cluster join operation is not in progress.
        :CLUSTER_JOIN_NOT_IN_PROGRESS, 5053,
        # MessageId: ERROR_CLUSTER_INVALID_NETWORK
        # MessageText:
        # The cluster network is not valid.
        :CLUSTER_INVALID_NETWORK, 5054,
        # MessageId: ERROR_CLUSTER_NODE_UP
        # MessageText:
        # The cluster node is up.
        :CLUSTER_NODE_UP, 5056,
        # MessageId: ERROR_CLUSTER_IPADDR_IN_USE
        # MessageText:
        # The cluster IP address is already in use.
        :CLUSTER_IPADDR_IN_USE, 5057,
        # MessageId: ERROR_CLUSTER_NODE_NOT_PAUSED
        # MessageText:
        # The cluster node is not paused.
        :CLUSTER_NODE_NOT_PAUSED, 5058,
        # MessageId: ERROR_CLUSTER_NO_SECURITY_CONTEXT
        # MessageText:
        # No cluster security context is available.
        :CLUSTER_NO_SECURITY_CONTEXT, 5059,
        # MessageId: ERROR_CLUSTER_NETWORK_NOT_INTERNAL
        # MessageText:
        # The cluster network is not configured for internal cluster communication.
        :CLUSTER_NETWORK_NOT_INTERNAL, 5060,
        # MessageId: ERROR_CLUSTER_NODE_ALREADY_UP
        # MessageText:
        # The cluster node is already up.
        :CLUSTER_NODE_ALREADY_UP, 5061,
        # MessageId: ERROR_CLUSTER_NODE_ALREADY_DOWN
        # MessageText:
        # The cluster node is already down.
        :CLUSTER_NODE_ALREADY_DOWN, 5062,
        # MessageId: ERROR_CLUSTER_NETWORK_ALREADY_ONLINE
        # MessageText:
        # The cluster network is already online.
        :CLUSTER_NETWORK_ALREADY_ONLINE, 5063,
        # MessageId: ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE
        # MessageText:
        # The cluster network is already offline.
        :CLUSTER_NETWORK_ALREADY_OFFLINE, 5064,
        # MessageId: ERROR_CLUSTER_NODE_ALREADY_MEMBER
        # MessageText:
        # The cluster node is already a member of the cluster.
        :CLUSTER_NODE_ALREADY_MEMBER, 5065,
        # MessageId: ERROR_CLUSTER_LAST_INTERNAL_NETWORK
        # MessageText:
        # The cluster network is the only one configured for internal cluster communication between two or more active
        # cluster nodes. The internal communication capability cannot be removed from the network.
        :CLUSTER_LAST_INTERNAL_NETWORK, 5066,
        # MessageId: ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS
        # MessageText:
        # One or more cluster resources depend on the network to provide service to clients. The client access
        # capability cannot be removed from the network.
        :CLUSTER_NETWORK_HAS_DEPENDENTS, 5067,
        # MessageId: ERROR_INVALID_OPERATION_ON_QUORUM
        # MessageText:
        # This operation cannot currently be performed on the cluster group containing the quorum resource.
        :INVALID_OPERATION_ON_QUORUM, 5068,
        # MessageId: ERROR_DEPENDENCY_NOT_ALLOWED
        # MessageText:
        # The cluster quorum resource is not allowed to have any dependencies.
        :DEPENDENCY_NOT_ALLOWED, 5069,
        # MessageId: ERROR_CLUSTER_NODE_PAUSED
        # MessageText:
        # The cluster node is paused.
        :CLUSTER_NODE_PAUSED, 5070,
        # MessageId: ERROR_NODE_CANT_HOST_RESOURCE
        # MessageText:
        # The cluster resource cannot be brought online. The owner node cannot run this resource.
        :NODE_CANT_HOST_RESOURCE, 5071,
        # MessageId: ERROR_CLUSTER_NODE_NOT_READY
        # MessageText:
        # The cluster node is not ready to perform the requested operation.
        :CLUSTER_NODE_NOT_READY, 5072,
        # MessageId: ERROR_CLUSTER_NODE_SHUTTING_DOWN
        # MessageText:
        # The cluster node is shutting down.
        :CLUSTER_NODE_SHUTTING_DOWN, 5073,
        # MessageId: ERROR_CLUSTER_JOIN_ABORTED
        # MessageText:
        # The cluster join operation was aborted.
        :CLUSTER_JOIN_ABORTED, 5074,
        # MessageId: ERROR_CLUSTER_INCOMPATIBLE_VERSIONS
        # MessageText:
        # The node failed to join the cluster because the joining node and other nodes in the cluster have incompatible
        # operating system versions. To get more information about operating system versions of the cluster, run the
        # Validate a Configuration Wizard or the Test-Cluster Windows PowerShell cmdlet.
        :CLUSTER_INCOMPATIBLE_VERSIONS, 5075,
        # MessageId: ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED
        # MessageText:
        # This resource cannot be created because the cluster has reached the limit on the number of resources it can
        # monitor.
        :CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED, 5076,
        # MessageId: ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED
        # MessageText:
        # The system configuration changed during the cluster join or form operation. The join or form operation was
        # aborted.
        :CLUSTER_SYSTEM_CONFIG_CHANGED, 5077,
        # MessageId: ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND
        # MessageText:
        # The specified resource type was not found.
        :CLUSTER_RESOURCE_TYPE_NOT_FOUND, 5078,
        # MessageId: ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED
        # MessageText:
        # The specified node does not support a resource of this type. This may be due to version inconsistencies or due
        # to the absence of the resource DLL on this node.
        :CLUSTER_RESTYPE_NOT_SUPPORTED, 5079,
        # MessageId: ERROR_CLUSTER_RESNAME_NOT_FOUND
        # MessageText:
        # The specified resource name is not supported by this resource DLL. This may be due to a bad (or changed) name
        # supplied to the resource DLL.
        :CLUSTER_RESNAME_NOT_FOUND, 5080,
        # MessageId: ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED
        # MessageText:
        # No authentication package could be registered with the RPC server.
        :CLUSTER_NO_RPC_PACKAGES_REGISTERED, 5081,
        # MessageId: ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST
        # MessageText:
        # You cannot bring the group online because the owner of the group is not in the preferred list for the group.
        # To change the owner node for the group, move the group.
        :CLUSTER_OWNER_NOT_IN_PREFLIST, 5082,
        # MessageId: ERROR_CLUSTER_DATABASE_SEQMISMATCH
        # MessageText:
        # The join operation failed because the cluster database sequence number has changed or is incompatible with the
        # locker node. This may happen during a join operation if the cluster database was changing during the join.
        :CLUSTER_DATABASE_SEQMISMATCH, 5083,
        # MessageId: ERROR_RESMON_INVALID_STATE
        # MessageText:
        # The resource monitor will not allow the fail operation to be performed while the resource is in its current
        # state. This may happen if the resource is in a pending state.
        :RESMON_INVALID_STATE, 5084,
        # MessageId: ERROR_CLUSTER_GUM_NOT_LOCKER
        # MessageText:
        # A non locker code got a request to reserve the lock for making global updates.
        :CLUSTER_GUM_NOT_LOCKER, 5085,
        # MessageId: ERROR_QUORUM_DISK_NOT_FOUND
        # MessageText:
        # The quorum disk could not be located by the cluster service.
        :QUORUM_DISK_NOT_FOUND, 5086,
        # MessageId: ERROR_DATABASE_BACKUP_CORRUPT
        # MessageText:
        # The backed up cluster database is possibly corrupt.
        :DATABASE_BACKUP_CORRUPT, 5087,
        # MessageId: ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT
        # MessageText:
        # A DFS root already exists in this cluster node.
        :CLUSTER_NODE_ALREADY_HAS_DFS_ROOT, 5088,
        # MessageId: ERROR_RESOURCE_PROPERTY_UNCHANGEABLE
        # MessageText:
        # An attempt to modify a resource property failed because it conflicts with another existing property.
        :RESOURCE_PROPERTY_UNCHANGEABLE, 5089,
        # MessageId: ERROR_NO_ADMIN_ACCESS_POINT
        # MessageText:
        # This operation is not supported on a cluster without an Administrator Access Point.
        :NO_ADMIN_ACCESS_POINT, 5090,
        # Codes from 4300 through 5889 overlap with codes in ds\published\inc\apperr2.w. Do not add any more error codes
        # in that range.
        # MessageId: ERROR_CLUSTER_MEMBERSHIP_INVALID_STATE
        # MessageText:
        # An operation was attempted that is incompatible with the current membership state of the node.
        :CLUSTER_MEMBERSHIP_INVALID_STATE, 5890,
        # MessageId: ERROR_CLUSTER_QUORUMLOG_NOT_FOUND
        # MessageText:
        # The quorum resource does not contain the quorum log.
        :CLUSTER_QUORUMLOG_NOT_FOUND, 5891,
        # MessageId: ERROR_CLUSTER_MEMBERSHIP_HALT
        # MessageText:
        # The membership engine requested shutdown of the cluster service on this node.
        :CLUSTER_MEMBERSHIP_HALT, 5892,
        # MessageId: ERROR_CLUSTER_INSTANCE_ID_MISMATCH
        # MessageText:
        # The join operation failed because the cluster instance ID of the joining node does not match the cluster
        # instance ID of the sponsor node.
        :CLUSTER_INSTANCE_ID_MISMATCH, 5893,
        # MessageId: ERROR_CLUSTER_NETWORK_NOT_FOUND_FOR_IP
        # MessageText:
        # A matching cluster network for the specified IP address could not be found.
        :CLUSTER_NETWORK_NOT_FOUND_FOR_IP, 5894,
        # MessageId: ERROR_CLUSTER_PROPERTY_DATA_TYPE_MISMATCH
        # MessageText:
        # The actual data type of the property did not match the expected data type of the property.
        :CLUSTER_PROPERTY_DATA_TYPE_MISMATCH, 5895,
        # MessageId: ERROR_CLUSTER_EVICT_WITHOUT_CLEANUP
        # MessageText:
        # The cluster node was evicted from the cluster successfully, but the node was not cleaned up. To determine what
        # cleanup steps failed and how to recover, see the Failover Clustering application event log using Event Viewer.
        :CLUSTER_EVICT_WITHOUT_CLEANUP, 5896,
        # MessageId: ERROR_CLUSTER_PARAMETER_MISMATCH
        # MessageText:
        # Two or more parameter values specified for a resource's properties are in conflict.
        :CLUSTER_PARAMETER_MISMATCH, 5897,
        # MessageId: ERROR_NODE_CANNOT_BE_CLUSTERED
        # MessageText:
        # This computer cannot be made a member of a cluster.
        :NODE_CANNOT_BE_CLUSTERED, 5898,
        # MessageId: ERROR_CLUSTER_WRONG_OS_VERSION
        # MessageText:
        # This computer cannot be made a member of a cluster because it does not have the correct version of Windows
        # installed.
        :CLUSTER_WRONG_OS_VERSION, 5899,
        # MessageId: ERROR_CLUSTER_CANT_CREATE_DUP_CLUSTER_NAME
        # MessageText:
        # A cluster cannot be created with the specified cluster name because that cluster name is already in use.
        # Specify a different name for the cluster.
        :CLUSTER_CANT_CREATE_DUP_CLUSTER_NAME, 5900,
        # MessageId: ERROR_CLUSCFG_ALREADY_COMMITTED
        # MessageText:
        # The cluster configuration action has already been committed.
        :CLUSCFG_ALREADY_COMMITTED, 5901,
        # MessageId: ERROR_CLUSCFG_ROLLBACK_FAILED
        # MessageText:
        # The cluster configuration action could not be rolled back.
        :CLUSCFG_ROLLBACK_FAILED, 5902,
        # MessageId: ERROR_CLUSCFG_SYSTEM_DISK_DRIVE_LETTER_CONFLICT
        # MessageText:
        # The drive letter assigned to a system disk on one node conflicted with the drive letter assigned to a disk on
        # another node.
        :CLUSCFG_SYSTEM_DISK_DRIVE_LETTER_CONFLICT, 5903,
        # MessageId: ERROR_CLUSTER_OLD_VERSION
        # MessageText:
        # One or more nodes in the cluster are running a version of Windows that does not support this operation.
        :CLUSTER_OLD_VERSION, 5904,
        # MessageId: ERROR_CLUSTER_MISMATCHED_COMPUTER_ACCT_NAME
        # MessageText:
        # The name of the corresponding computer account doesn't match the Network Name for this resource.
        :CLUSTER_MISMATCHED_COMPUTER_ACCT_NAME, 5905,
        # MessageId: ERROR_CLUSTER_NO_NET_ADAPTERS
        # MessageText:
        # No network adapters are available.
        :CLUSTER_NO_NET_ADAPTERS, 5906,
        # MessageId: ERROR_CLUSTER_POISONED
        # MessageText:
        # The cluster node has been poisoned.
        :CLUSTER_POISONED, 5907,
        # MessageId: ERROR_CLUSTER_GROUP_MOVING
        # MessageText:
        # The group is unable to accept the request since it is moving to another node.
        :CLUSTER_GROUP_MOVING, 5908,
        # MessageId: ERROR_CLUSTER_RESOURCE_TYPE_BUSY
        # MessageText:
        # The resource type cannot accept the request since is too busy performing another operation.
        :CLUSTER_RESOURCE_TYPE_BUSY, 5909,
        # MessageId: ERROR_RESOURCE_CALL_TIMED_OUT
        # MessageText:
        # The call to the cluster resource DLL timed out.
        :RESOURCE_CALL_TIMED_OUT, 5910,
        # MessageId: ERROR_INVALID_CLUSTER_IPV6_ADDRESS
        # MessageText:
        # The address is not valid for an IPv6 Address resource. A global IPv6 address is required, and it must match a
        # cluster network. Compatibility addresses are not permitted.
        :INVALID_CLUSTER_IPV6_ADDRESS, 5911,
        # MessageId: ERROR_CLUSTER_INTERNAL_INVALID_FUNCTION
        # MessageText:
        # An internal cluster error occurred. A call to an invalid function was attempted.
        :CLUSTER_INTERNAL_INVALID_FUNCTION, 5912,
        # MessageId: ERROR_CLUSTER_PARAMETER_OUT_OF_BOUNDS
        # MessageText:
        # A parameter value is out of acceptable range.
        :CLUSTER_PARAMETER_OUT_OF_BOUNDS, 5913,
        # MessageId: ERROR_CLUSTER_PARTIAL_SEND
        # MessageText:
        # A network error occurred while sending data to another node in the cluster. The number of bytes transmitted
        # was less than required.
        :CLUSTER_PARTIAL_SEND, 5914,
        # MessageId: ERROR_CLUSTER_REGISTRY_INVALID_FUNCTION
        # MessageText:
        # An invalid cluster registry operation was attempted.
        :CLUSTER_REGISTRY_INVALID_FUNCTION, 5915,
        # MessageId: ERROR_CLUSTER_INVALID_STRING_TERMINATION
        # MessageText:
        # An input string of characters is not properly terminated.
        :CLUSTER_INVALID_STRING_TERMINATION, 5916,
        # MessageId: ERROR_CLUSTER_INVALID_STRING_FORMAT
        # MessageText:
        # An input string of characters is not in a valid format for the data it represents.
        :CLUSTER_INVALID_STRING_FORMAT, 5917,
        # MessageId: ERROR_CLUSTER_DATABASE_TRANSACTION_IN_PROGRESS
        # MessageText:
        # An internal cluster error occurred. A cluster database transaction was attempted while a transaction was
        # already in progress.
        :CLUSTER_DATABASE_TRANSACTION_IN_PROGRESS, 5918,
        # MessageId: ERROR_CLUSTER_DATABASE_TRANSACTION_NOT_IN_PROGRESS
        # MessageText:
        # An internal cluster error occurred. There was an attempt to commit a cluster database transaction while no
        # transaction was in progress.
        :CLUSTER_DATABASE_TRANSACTION_NOT_IN_PROGRESS, 5919,
        # MessageId: ERROR_CLUSTER_NULL_DATA
        # MessageText:
        # An internal cluster error occurred. Data was not properly initialized.
        :CLUSTER_NULL_DATA, 5920,
        # MessageId: ERROR_CLUSTER_PARTIAL_READ
        # MessageText:
        # An error occurred while reading from a stream of data. An unexpected number of bytes was returned.
        :CLUSTER_PARTIAL_READ, 5921,
        # MessageId: ERROR_CLUSTER_PARTIAL_WRITE
        # MessageText:
        # An error occurred while writing to a stream of data. The required number of bytes could not be written.
        :CLUSTER_PARTIAL_WRITE, 5922,
        # MessageId: ERROR_CLUSTER_CANT_DESERIALIZE_DATA
        # MessageText:
        # An error occurred while deserializing a stream of cluster data.
        :CLUSTER_CANT_DESERIALIZE_DATA, 5923,
        # MessageId: ERROR_DEPENDENT_RESOURCE_PROPERTY_CONFLICT
        # MessageText:
        # One or more property values for this resource are in conflict with one or more property values associated with
        # its dependent resource(s).
        :DEPENDENT_RESOURCE_PROPERTY_CONFLICT, 5924,
        # MessageId: ERROR_CLUSTER_NO_QUORUM
        # MessageText:
        # A quorum of cluster nodes was not present to form a cluster.
        :CLUSTER_NO_QUORUM, 5925,
        # MessageId: ERROR_CLUSTER_INVALID_IPV6_NETWORK
        # MessageText:
        # The cluster network is not valid for an IPv6 Address resource, or it does not match the configured address.
        :CLUSTER_INVALID_IPV6_NETWORK, 5926,
        # MessageId: ERROR_CLUSTER_INVALID_IPV6_TUNNEL_NETWORK
        # MessageText:
        # The cluster network is not valid for an IPv6 Tunnel resource. Check the configuration of the IP Address
        # resource on which the IPv6 Tunnel resource depends.
        :CLUSTER_INVALID_IPV6_TUNNEL_NETWORK, 5927,
        # MessageId: ERROR_QUORUM_NOT_ALLOWED_IN_THIS_GROUP
        # MessageText:
        # Quorum resource cannot reside in the Available Storage group.
        :QUORUM_NOT_ALLOWED_IN_THIS_GROUP, 5928,
        # MessageId: ERROR_DEPENDENCY_TREE_TOO_COMPLEX
        # MessageText:
        # The dependencies for this resource are nested too deeply.
        :DEPENDENCY_TREE_TOO_COMPLEX, 5929,
        # MessageId: ERROR_EXCEPTION_IN_RESOURCE_CALL
        # MessageText:
        # The call into the resource DLL raised an unhandled exception.
        :EXCEPTION_IN_RESOURCE_CALL, 5930,
        # MessageId: ERROR_CLUSTER_RHS_FAILED_INITIALIZATION
        # MessageText:
        # The RHS process failed to initialize.
        :CLUSTER_RHS_FAILED_INITIALIZATION, 5931,
        # MessageId: ERROR_CLUSTER_NOT_INSTALLED
        # MessageText:
        # The Failover Clustering feature is not installed on this node.
        :CLUSTER_NOT_INSTALLED, 5932,
        # MessageId: ERROR_CLUSTER_RESOURCES_MUST_BE_ONLINE_ON_THE_SAME_NODE
        # MessageText:
        # The resources must be online on the same node for this operation
        :CLUSTER_RESOURCES_MUST_BE_ONLINE_ON_THE_SAME_NODE, 5933,
        # MessageId: ERROR_CLUSTER_MAX_NODES_IN_CLUSTER
        # MessageText:
        # A new node can not be added since this cluster is already at its maximum number of nodes.
        :CLUSTER_MAX_NODES_IN_CLUSTER, 5934,
        # MessageId: ERROR_CLUSTER_TOO_MANY_NODES
        # MessageText:
        # This cluster can not be created since the specified number of nodes exceeds the maximum allowed limit.
        :CLUSTER_TOO_MANY_NODES, 5935,
        # MessageId: ERROR_CLUSTER_OBJECT_ALREADY_USED
        # MessageText:
        # An attempt to use the specified cluster name failed because an enabled computer object with the given name
        # already exists in the domain.
        :CLUSTER_OBJECT_ALREADY_USED, 5936,
        # MessageId: ERROR_NONCORE_GROUPS_FOUND
        # MessageText:
        # This cluster cannot be destroyed. It has non-core application groups which must be deleted before the cluster
        # can be destroyed.
        :NONCORE_GROUPS_FOUND, 5937,
        # MessageId: ERROR_FILE_SHARE_RESOURCE_CONFLICT
        # MessageText:
        # File share associated with file share witness resource cannot be hosted by this cluster or any of its nodes.
        :FILE_SHARE_RESOURCE_CONFLICT, 5938,
        # MessageId: ERROR_CLUSTER_EVICT_INVALID_REQUEST
        # MessageText:
        # Eviction of this node is invalid at this time. Due to quorum requirements node eviction will result in cluster
        # shutdown.
        # If it is the last node in the cluster, destroy cluster command should be used.
        :CLUSTER_EVICT_INVALID_REQUEST, 5939,
        # MessageId: ERROR_CLUSTER_SINGLETON_RESOURCE
        # MessageText:
        # Only one instance of this resource type is allowed in the cluster.
        :CLUSTER_SINGLETON_RESOURCE, 5940,
        # MessageId: ERROR_CLUSTER_GROUP_SINGLETON_RESOURCE
        # MessageText:
        # Only one instance of this resource type is allowed per resource group.
        :CLUSTER_GROUP_SINGLETON_RESOURCE, 5941,
        # MessageId: ERROR_CLUSTER_RESOURCE_PROVIDER_FAILED
        # MessageText:
        # The resource failed to come online due to the failure of one or more provider resources.
        :CLUSTER_RESOURCE_PROVIDER_FAILED, 5942,
        # MessageId: ERROR_CLUSTER_RESOURCE_CONFIGURATION_ERROR
        # MessageText:
        # The resource has indicated that it cannot come online on any node.
        :CLUSTER_RESOURCE_CONFIGURATION_ERROR, 5943,
        # MessageId: ERROR_CLUSTER_GROUP_BUSY
        # MessageText:
        # The current operation cannot be performed on this group at this time.
        :CLUSTER_GROUP_BUSY, 5944,
        # MessageId: ERROR_CLUSTER_NOT_SHARED_VOLUME
        # MessageText:
        # The directory or file is not located on a cluster shared volume.
        :CLUSTER_NOT_SHARED_VOLUME, 5945,
        # MessageId: ERROR_CLUSTER_INVALID_SECURITY_DESCRIPTOR
        # MessageText:
        # The Security Descriptor does not meet the requirements for a cluster.
        :CLUSTER_INVALID_SECURITY_DESCRIPTOR, 5946,
        # MessageId: ERROR_CLUSTER_SHARED_VOLUMES_IN_USE
        # MessageText:
        # There is one or more shared volumes resources configured in the cluster.
        # Those resources must be moved to available storage in order for operation to succeed.
        :CLUSTER_SHARED_VOLUMES_IN_USE, 5947,
        # MessageId: ERROR_CLUSTER_USE_SHARED_VOLUMES_API
        # MessageText:
        # This group or resource cannot be directly manipulated.
        # Use shared volume APIs to perform desired operation.
        :CLUSTER_USE_SHARED_VOLUMES_API, 5948,
        # MessageId: ERROR_CLUSTER_BACKUP_IN_PROGRESS
        # MessageText:
        # Back up is in progress. Please wait for backup completion before trying this operation again.
        :CLUSTER_BACKUP_IN_PROGRESS, 5949,
        # MessageId: ERROR_NON_CSV_PATH
        # MessageText:
        # The path does not belong to a cluster shared volume.
        :NON_CSV_PATH, 5950,
        # MessageId: ERROR_CSV_VOLUME_NOT_LOCAL
        # MessageText:
        # The cluster shared volume is not locally mounted on this node.
        :CSV_VOLUME_NOT_LOCAL, 5951,
        # MessageId: ERROR_CLUSTER_WATCHDOG_TERMINATING
        # MessageText:
        # The cluster watchdog is terminating.
        :CLUSTER_WATCHDOG_TERMINATING, 5952,
        # MessageId: ERROR_CLUSTER_RESOURCE_VETOED_MOVE_INCOMPATIBLE_NODES
        # MessageText:
        # A resource vetoed a move between two nodes because they are incompatible.
        :CLUSTER_RESOURCE_VETOED_MOVE_INCOMPATIBLE_NODES, 5953,
        # MessageId: ERROR_CLUSTER_INVALID_NODE_WEIGHT
        # MessageText:
        # The request is invalid either because node weight cannot be changed while the cluster is in disk-only quorum
        # mode, or because changing the node weight would violate the minimum cluster quorum requirements.
        :CLUSTER_INVALID_NODE_WEIGHT, 5954,
        # MessageId: ERROR_CLUSTER_RESOURCE_VETOED_CALL
        # MessageText:
        # The resource vetoed the call.
        :CLUSTER_RESOURCE_VETOED_CALL, 5955,
        # MessageId: ERROR_RESMON_SYSTEM_RESOURCES_LACKING
        # MessageText:
        # Resource could not start or run because it could not reserve sufficient system resources.
        :RESMON_SYSTEM_RESOURCES_LACKING, 5956,
        # MessageId: ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_DESTINATION
        # MessageText:
        # A resource vetoed a move between two nodes because the destination currently does not have enough resources to
        # complete the operation.
        :CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_DESTINATION, 5957,
        # MessageId: ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_SOURCE
        # MessageText:
        # A resource vetoed a move between two nodes because the source currently does not have enough resources to
        # complete the operation.
        :CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_SOURCE, 5958,
        # MessageId: ERROR_CLUSTER_GROUP_QUEUED
        # MessageText:
        # The requested operation can not be completed because the group is queued for an operation.
        :CLUSTER_GROUP_QUEUED, 5959,
        # MessageId: ERROR_CLUSTER_RESOURCE_LOCKED_STATUS
        # MessageText:
        # The requested operation can not be completed because a resource has locked status.
        :CLUSTER_RESOURCE_LOCKED_STATUS, 5960,
        # MessageId: ERROR_CLUSTER_SHARED_VOLUME_FAILOVER_NOT_ALLOWED
        # MessageText:
        # The resource cannot move to another node because a cluster shared volume vetoed the operation.
        :CLUSTER_SHARED_VOLUME_FAILOVER_NOT_ALLOWED, 5961,
        # MessageId: ERROR_CLUSTER_NODE_DRAIN_IN_PROGRESS
        # MessageText:
        # A node drain is already in progress.
        :CLUSTER_NODE_DRAIN_IN_PROGRESS, 5962,
        # MessageId: ERROR_CLUSTER_DISK_NOT_CONNECTED
        # MessageText:
        # Clustered storage is not connected to the node.
        :CLUSTER_DISK_NOT_CONNECTED, 5963,
        # MessageId: ERROR_DISK_NOT_CSV_CAPABLE
        # MessageText:
        # The disk is not configured in a way to be used with CSV. CSV disks must have at least one partition that is
        # formatted with NTFS or REFS.
        :DISK_NOT_CSV_CAPABLE, 5964,
        # MessageId: ERROR_RESOURCE_NOT_IN_AVAILABLE_STORAGE
        # MessageText:
        # The resource must be part of the Available Storage group to complete this action.
        :RESOURCE_NOT_IN_AVAILABLE_STORAGE, 5965,
        # MessageId: ERROR_CLUSTER_SHARED_VOLUME_REDIRECTED
        # MessageText:
        # CSVFS failed operation as volume is in redirected mode.
        :CLUSTER_SHARED_VOLUME_REDIRECTED, 5966,
        # MessageId: ERROR_CLUSTER_SHARED_VOLUME_NOT_REDIRECTED
        # MessageText:
        # CSVFS failed operation as volume is not in redirected mode.
        :CLUSTER_SHARED_VOLUME_NOT_REDIRECTED, 5967,
        # MessageId: ERROR_CLUSTER_CANNOT_RETURN_PROPERTIES
        # MessageText:
        # Cluster properties cannot be returned at this time.
        :CLUSTER_CANNOT_RETURN_PROPERTIES, 5968,
        # MessageId: ERROR_CLUSTER_RESOURCE_CONTAINS_UNSUPPORTED_DIFF_AREA_FOR_SHARED_VOLUMES
        # MessageText:
        # The clustered disk resource contains software snapshot diff area that are not supported for Cluster Shared Volumes.
        :CLUSTER_RESOURCE_CONTAINS_UNSUPPORTED_DIFF_AREA_FOR_SHARED_VOLUMES, 5969,
        # MessageId: ERROR_CLUSTER_RESOURCE_IS_IN_MAINTENANCE_MODE
        # MessageText:
        # The operation cannot be completed because the resource is in maintenance mode.
        :CLUSTER_RESOURCE_IS_IN_MAINTENANCE_MODE, 5970,
        # MessageId: ERROR_CLUSTER_AFFINITY_CONFLICT
        # MessageText:
        # The operation cannot be completed because of cluster affinity conflicts
        :CLUSTER_AFFINITY_CONFLICT, 5971,
        # MessageId: ERROR_CLUSTER_RESOURCE_IS_REPLICA_VIRTUAL_MACHINE
        # MessageText:
        # The operation cannot be completed because the resource is a replica virtual machine.
        :CLUSTER_RESOURCE_IS_REPLICA_VIRTUAL_MACHINE, 5972,
        # MessageId: ERROR_CLUSTER_UPGRADE_INCOMPATIBLE_VERSIONS
        # MessageText:
        # The Cluster Functional Level could not be increased because not all nodes in the cluster support the updated version.
        :CLUSTER_UPGRADE_INCOMPATIBLE_VERSIONS, 5973,
        # MessageId: ERROR_CLUSTER_UPGRADE_FIX_QUORUM_NOT_SUPPORTED
        # MessageText:
        # Updating the cluster functional level failed because the cluster is running in fix quorum mode.
        # Start additional nodes which are members of the cluster until the cluster reaches quorum and the cluster will automatically
        # switch out of fix quorum mode, or stop and restart the cluster without the FixQuorum switch. Once the cluster is out
        # of fix quorum mode retry the Update-ClusterFunctionalLevel PowerShell cmdlet to update the cluster functional level.
        :CLUSTER_UPGRADE_FIX_QUORUM_NOT_SUPPORTED, 5974,
        # MessageId: ERROR_CLUSTER_UPGRADE_RESTART_REQUIRED
        # MessageText:
        # The cluster functional level has been successfully updated but not all features are available yet. Restart the cluster by
        # using the Stop-Cluster PowerShell cmdlet followed by the Start-Cluster PowerShell cmdlet and all cluster features will
        # be available.
        :CLUSTER_UPGRADE_RESTART_REQUIRED, 5975,
        # MessageId: ERROR_CLUSTER_UPGRADE_IN_PROGRESS
        # MessageText:
        # The cluster is currently performing a version upgrade.
        :CLUSTER_UPGRADE_IN_PROGRESS, 5976,
        # MessageId: ERROR_CLUSTER_UPGRADE_INCOMPLETE
        # MessageText:
        # The cluster did not successfully complete the version upgrade.
        :CLUSTER_UPGRADE_INCOMPLETE, 5977,
        # MessageId: ERROR_CLUSTER_NODE_IN_GRACE_PERIOD
        # MessageText:
        # The cluster node is in grace period.
        :CLUSTER_NODE_IN_GRACE_PERIOD, 5978,
        # MessageId: ERROR_CLUSTER_CSV_IO_PAUSE_TIMEOUT
        # MessageText:
        # The operation has failed because CSV volume was not able to recover in time specified on this file object.
        :CLUSTER_CSV_IO_PAUSE_TIMEOUT, 5979,
        # MessageId: ERROR_NODE_NOT_ACTIVE_CLUSTER_MEMBER
        # MessageText:
        # The operation failed because the requested node is not currently part of active cluster membership.
        :NODE_NOT_ACTIVE_CLUSTER_MEMBER, 5980,
        # MessageId: ERROR_CLUSTER_RESOURCE_NOT_MONITORED
        # MessageText:
        # The operation failed because the requested cluster resource is currently unmonitored.
        :CLUSTER_RESOURCE_NOT_MONITORED, 5981,
        # MessageId: ERROR_CLUSTER_RESOURCE_DOES_NOT_SUPPORT_UNMONITORED
        # MessageText:
        # The operation failed because a resource does not support running in an unmonitored state.
        :CLUSTER_RESOURCE_DOES_NOT_SUPPORT_UNMONITORED, 5982,
        # MessageId: ERROR_CLUSTER_RESOURCE_IS_REPLICATED
        # MessageText:
        # The operation cannot be completed because a resource participates in replication.
        :CLUSTER_RESOURCE_IS_REPLICATED, 5983,
        # MessageId: ERROR_CLUSTER_NODE_ISOLATED
        # MessageText:
        # The operation failed because the requested cluster node has been isolated
        :CLUSTER_NODE_ISOLATED, 5984,
        # MessageId: ERROR_CLUSTER_NODE_QUARANTINED
        # MessageText:
        # The operation failed because the requested cluster node has been quarantined
        :CLUSTER_NODE_QUARANTINED, 5985,
        # MessageId: ERROR_CLUSTER_DATABASE_UPDATE_CONDITION_FAILED
        # MessageText:
        # The operation failed because the specified database update condition was not met
        :CLUSTER_DATABASE_UPDATE_CONDITION_FAILED, 5986,
        # MessageId: ERROR_CLUSTER_SPACE_DEGRADED
        # MessageText:
        # A clustered space is in a degraded condition and the requested action cannot be completed at this time.
        :CLUSTER_SPACE_DEGRADED, 5987,
        # MessageId: ERROR_CLUSTER_TOKEN_DELEGATION_NOT_SUPPORTED
        # MessageText:
        # The operation failed because token delegation for this control is not supported.
        :CLUSTER_TOKEN_DELEGATION_NOT_SUPPORTED, 5988,
        # MessageId: ERROR_CLUSTER_CSV_INVALID_HANDLE
        # MessageText:
        # The operation has failed because CSV has invalidated this file object.
        :CLUSTER_CSV_INVALID_HANDLE, 5989,
        # MessageId: ERROR_CLUSTER_CSV_SUPPORTED_ONLY_ON_COORDINATOR
        # MessageText:
        # This operation is supported only on the CSV coordinator node.
        :CLUSTER_CSV_SUPPORTED_ONLY_ON_COORDINATOR, 5990,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end