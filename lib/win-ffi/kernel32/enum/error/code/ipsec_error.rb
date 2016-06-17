module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Start of IPSec Error codes 13000 to 13999 ===#
        # MessageId: ERROR_IPSEC_QM_POLICY_EXISTS
        # MessageText:
        # The specified quick mode policy already exists.
        :IPSEC_QM_POLICY_EXISTS, 13000,
        # MessageId: ERROR_IPSEC_QM_POLICY_NOT_FOUND
        # MessageText:
        # The specified quick mode policy was not found.
        :IPSEC_QM_POLICY_NOT_FOUND, 13001,
        # MessageId: ERROR_IPSEC_QM_POLICY_IN_USE
        # MessageText:
        # The specified quick mode policy is being used.
        :IPSEC_QM_POLICY_IN_USE, 13002,
        # MessageId: ERROR_IPSEC_MM_POLICY_EXISTS
        # MessageText:
        # The specified main mode policy already exists.
        :IPSEC_MM_POLICY_EXISTS, 13003,
        # MessageId: ERROR_IPSEC_MM_POLICY_NOT_FOUND
        # MessageText:
        # The specified main mode policy was not found
        :IPSEC_MM_POLICY_NOT_FOUND, 13004,
        # MessageId: ERROR_IPSEC_MM_POLICY_IN_USE
        # MessageText:
        # The specified main mode policy is being used.
        :IPSEC_MM_POLICY_IN_USE, 13005,
        # MessageId: ERROR_IPSEC_MM_FILTER_EXISTS
        # MessageText:
        # The specified main mode filter already exists.
        :IPSEC_MM_FILTER_EXISTS, 13006,
        # MessageId: ERROR_IPSEC_MM_FILTER_NOT_FOUND
        # MessageText:
        # The specified main mode filter was not found.
        :IPSEC_MM_FILTER_NOT_FOUND, 13007,
        # MessageId: ERROR_IPSEC_TRANSPORT_FILTER_EXISTS
        # MessageText:
        # The specified transport mode filter already exists.
        :IPSEC_TRANSPORT_FILTER_EXISTS, 13008,
        # MessageId: ERROR_IPSEC_TRANSPORT_FILTER_NOT_FOUND
        # MessageText:
        # The specified transport mode filter does not exist.
        :IPSEC_TRANSPORT_FILTER_NOT_FOUND, 13009,
        # MessageId: ERROR_IPSEC_MM_AUTH_EXISTS
        # MessageText:
        # The specified main mode authentication list exists.
        :IPSEC_MM_AUTH_EXISTS, 13010,
        # MessageId: ERROR_IPSEC_MM_AUTH_NOT_FOUND
        # MessageText:
        # The specified main mode authentication list was not found.
        :IPSEC_MM_AUTH_NOT_FOUND, 13011,
        # MessageId: ERROR_IPSEC_MM_AUTH_IN_USE
        # MessageText:
        # The specified main mode authentication list is being used.
        :IPSEC_MM_AUTH_IN_USE, 13012,
        # MessageId: ERROR_IPSEC_DEFAULT_MM_POLICY_NOT_FOUND
        # MessageText:
        # The specified default main mode policy was not found.
        :IPSEC_DEFAULT_MM_POLICY_NOT_FOUND, 13013,
        # MessageId: ERROR_IPSEC_DEFAULT_MM_AUTH_NOT_FOUND
        # MessageText:
        # The specified default main mode authentication list was not found.
        :IPSEC_DEFAULT_MM_AUTH_NOT_FOUND, 13014,
        # MessageId: ERROR_IPSEC_DEFAULT_QM_POLICY_NOT_FOUND
        # MessageText:
        # The specified default quick mode policy was not found.
        :IPSEC_DEFAULT_QM_POLICY_NOT_FOUND, 13015,
        # MessageId: ERROR_IPSEC_TUNNEL_FILTER_EXISTS
        # MessageText:
        # The specified tunnel mode filter exists.
        :IPSEC_TUNNEL_FILTER_EXISTS, 13016,
        # MessageId: ERROR_IPSEC_TUNNEL_FILTER_NOT_FOUND
        # MessageText:
        # The specified tunnel mode filter was not found.
        :IPSEC_TUNNEL_FILTER_NOT_FOUND, 13017,
        # MessageId: ERROR_IPSEC_MM_FILTER_PENDING_DELETION
        # MessageText:
        # The Main Mode filter is pending deletion.
        :IPSEC_MM_FILTER_PENDING_DELETION, 13018,
        # MessageId: ERROR_IPSEC_TRANSPORT_FILTER_PENDING_DELETION
        # MessageText:
        # The transport filter is pending deletion.
        :IPSEC_TRANSPORT_FILTER_PENDING_DELETION, 13019,
        # MessageId: ERROR_IPSEC_TUNNEL_FILTER_PENDING_DELETION
        # MessageText:
        # The tunnel filter is pending deletion.
        :IPSEC_TUNNEL_FILTER_PENDING_DELETION, 13020,
        # MessageId: ERROR_IPSEC_MM_POLICY_PENDING_DELETION
        # MessageText:
        # The Main Mode policy is pending deletion.
        :IPSEC_MM_POLICY_PENDING_DELETION, 13021,
        # MessageId: ERROR_IPSEC_MM_AUTH_PENDING_DELETION
        # MessageText:
        # The Main Mode authentication bundle is pending deletion.
        :IPSEC_MM_AUTH_PENDING_DELETION, 13022,
        # MessageId: ERROR_IPSEC_QM_POLICY_PENDING_DELETION
        # MessageText:
        # The Quick Mode policy is pending deletion.
        :IPSEC_QM_POLICY_PENDING_DELETION, 13023,
        # MessageId: WARNING_IPSEC_MM_POLICY_PRUNED
        # MessageText:
        # The Main Mode policy was successfully added, but some of the requested offers are not supported.
        :WARNING_IPSEC_MM_POLICY_PRUNED, 13024,
        # MessageId: WARNING_IPSEC_QM_POLICY_PRUNED
        # MessageText:
        # The Quick Mode policy was successfully added, but some of the requested offers are not supported.
        :WARNING_IPSEC_QM_POLICY_PRUNED, 13025,
        # MessageId: ERROR_IPSEC_IKE_NEG_STATUS_BEGIN
        # MessageText:
        #  ERROR_IPSEC_IKE_NEG_STATUS_BEGIN
        :IPSEC_IKE_NEG_STATUS_BEGIN, 13800,
        # MessageId: ERROR_IPSEC_IKE_AUTH_FAIL
        # MessageText:
        # IKE authentication credentials are unacceptable
        :IPSEC_IKE_AUTH_FAIL, 13801,
        # MessageId: ERROR_IPSEC_IKE_ATTRIB_FAIL
        # MessageText:
        # IKE security attributes are unacceptable
        :IPSEC_IKE_ATTRIB_FAIL, 13802,
        # MessageId: ERROR_IPSEC_IKE_NEGOTIATION_PENDING
        # MessageText:
        # IKE Negotiation in progress
        :IPSEC_IKE_NEGOTIATION_PENDING, 13803,
        # MessageId: ERROR_IPSEC_IKE_GENERAL_PROCESSING_ERROR
        # MessageText:
        # General processing error
        :IPSEC_IKE_GENERAL_PROCESSING_ERROR, 13804,
        # MessageId: ERROR_IPSEC_IKE_TIMED_OUT
        # MessageText:
        # Negotiation timed out
        :IPSEC_IKE_TIMED_OUT, 13805,
        # MessageId: ERROR_IPSEC_IKE_NO_CERT
        # MessageText:
        # IKE failed to find valid machine certificate. Contact your Network Security Administrator about installing a
        # valid certificate in the appropriate Certificate Store.
        :IPSEC_IKE_NO_CERT, 13806,
        # MessageId: ERROR_IPSEC_IKE_SA_DELETED
        # MessageText:
        # IKE SA deleted by peer before establishment completed
        :IPSEC_IKE_SA_DELETED, 13807,
        # MessageId: ERROR_IPSEC_IKE_SA_REAPED
        # MessageText:
        # IKE SA deleted before establishment completed
        :IPSEC_IKE_SA_REAPED, 13808,
        # MessageId: ERROR_IPSEC_IKE_MM_ACQUIRE_DROP
        # MessageText:
        # Negotiation request sat in Queue too long
        :IPSEC_IKE_MM_ACQUIRE_DROP, 13809,
        # MessageId: ERROR_IPSEC_IKE_QM_ACQUIRE_DROP
        # MessageText:
        # Negotiation request sat in Queue too long
        :IPSEC_IKE_QM_ACQUIRE_DROP, 13810,
        # MessageId: ERROR_IPSEC_IKE_QUEUE_DROP_MM
        # MessageText:
        # Negotiation request sat in Queue too long
        :IPSEC_IKE_QUEUE_DROP_MM, 13811,
        # MessageId: ERROR_IPSEC_IKE_QUEUE_DROP_NO_MM
        # MessageText:
        # Negotiation request sat in Queue too long
        :IPSEC_IKE_QUEUE_DROP_NO_MM, 13812,
        # MessageId: ERROR_IPSEC_IKE_DROP_NO_RESPONSE
        # MessageText:
        # No response from peer
        :IPSEC_IKE_DROP_NO_RESPONSE, 13813,
        # MessageId: ERROR_IPSEC_IKE_MM_DELAY_DROP
        # MessageText:
        # Negotiation took too long
        :IPSEC_IKE_MM_DELAY_DROP, 13814,
        # MessageId: ERROR_IPSEC_IKE_QM_DELAY_DROP
        # MessageText:
        # Negotiation took too long
        :IPSEC_IKE_QM_DELAY_DROP, 13815,
        # MessageId: ERROR_IPSEC_IKE_ERROR
        # MessageText:
        # Unknown error occurred
        :IPSEC_IKE_ERROR, 13816,
        # MessageId: ERROR_IPSEC_IKE_CRL_FAILED
        # MessageText:
        # Certificate Revocation Check failed
        :IPSEC_IKE_CRL_FAILED, 13817,
        # MessageId: ERROR_IPSEC_IKE_INVALID_KEY_USAGE
        # MessageText:
        # Invalid certificate key usage
        :IPSEC_IKE_INVALID_KEY_USAGE, 13818,
        # MessageId: ERROR_IPSEC_IKE_INVALID_CERT_TYPE
        # MessageText:
        # Invalid certificate type
        :IPSEC_IKE_INVALID_CERT_TYPE, 13819,
        # MessageId: ERROR_IPSEC_IKE_NO_PRIVATE_KEY
        # MessageText:
        # IKE negotiation failed because the machine certificate used does not have a private key. IPsec certificates
        # require a private key. Contact your Network Security administrator about replacing with a certificate that has
        # a private key.
        :IPSEC_IKE_NO_PRIVATE_KEY, 13820,
        # MessageId: ERROR_IPSEC_IKE_SIMULTANEOUS_REKEY
        # MessageText:
        # Simultaneous rekeys were detected.
        :IPSEC_IKE_SIMULTANEOUS_REKEY, 13821,
        # MessageId: ERROR_IPSEC_IKE_DH_FAIL
        # MessageText:
        # Failure in Diffie-Hellman computation
        :IPSEC_IKE_DH_FAIL, 13822,
        # MessageId: ERROR_IPSEC_IKE_CRITICAL_PAYLOAD_NOT_RECOGNIZED
        # MessageText:
        # Don't know how to process critical payload
        :IPSEC_IKE_CRITICAL_PAYLOAD_NOT_RECOGNIZED, 13823,
        # MessageId: ERROR_IPSEC_IKE_INVALID_HEADER
        # MessageText:
        # Invalid header
        :IPSEC_IKE_INVALID_HEADER, 13824,
        # MessageId: ERROR_IPSEC_IKE_NO_POLICY
        # MessageText:
        # No policy configured
        :IPSEC_IKE_NO_POLICY, 13825,
        # MessageId: ERROR_IPSEC_IKE_INVALID_SIGNATURE
        # MessageText:
        # Failed to verify signature
        :IPSEC_IKE_INVALID_SIGNATURE, 13826,
        # MessageId: ERROR_IPSEC_IKE_KERBEROS_ERROR
        # MessageText:
        # Failed to authenticate using Kerberos
        :IPSEC_IKE_KERBEROS_ERROR, 13827,
        # MessageId: ERROR_IPSEC_IKE_NO_PUBLIC_KEY
        # MessageText:
        # Peer's certificate did not have a public key
        :IPSEC_IKE_NO_PUBLIC_KEY, 13828,
        # These must stay as a unit.
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR
        # MessageText:
        # Error processing error payload
        :IPSEC_IKE_PROCESS_ERR, 13829,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_SA
        # MessageText:
        # Error processing SA payload
        :IPSEC_IKE_PROCESS_ERR_SA, 13830,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_PROP
        # MessageText:
        # Error processing Proposal payload
        :IPSEC_IKE_PROCESS_ERR_PROP, 13831,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_TRANS
        # MessageText:
        # Error processing Transform payload
        :IPSEC_IKE_PROCESS_ERR_TRANS, 13832,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_KE
        # MessageText:
        # Error processing KE payload
        :IPSEC_IKE_PROCESS_ERR_KE, 13833,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_ID
        # MessageText:
        # Error processing ID payload
        :IPSEC_IKE_PROCESS_ERR_ID, 13834,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_CERT
        # MessageText:
        # Error processing Cert payload
        :IPSEC_IKE_PROCESS_ERR_CERT, 13835,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_CERT_REQ
        # MessageText:
        # Error processing Certificate Request payload
        :IPSEC_IKE_PROCESS_ERR_CERT_REQ, 13836,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_HASH
        # MessageText:
        # Error processing Hash payload
        :IPSEC_IKE_PROCESS_ERR_HASH, 13837,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_SIG
        # MessageText:
        # Error processing Signature payload
        :IPSEC_IKE_PROCESS_ERR_SIG, 13838,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_NONCE
        # MessageText:
        # Error processing Nonce payload
        :IPSEC_IKE_PROCESS_ERR_NONCE, 13839,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_NOTIFY
        # MessageText:
        # Error processing Notify payload
        :IPSEC_IKE_PROCESS_ERR_NOTIFY, 13840,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_DELETE
        # MessageText:
        # Error processing Delete Payload
        :IPSEC_IKE_PROCESS_ERR_DELETE, 13841,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_VENDOR
        # MessageText:
        # Error processing VendorId payload
        :IPSEC_IKE_PROCESS_ERR_VENDOR, 13842,
        # MessageId: ERROR_IPSEC_IKE_INVALID_PAYLOAD
        # MessageText:
        # Invalid payload received
        :IPSEC_IKE_INVALID_PAYLOAD, 13843,
        # MessageId: ERROR_IPSEC_IKE_LOAD_SOFT_SA
        # MessageText:
        # Soft SA loaded
        :IPSEC_IKE_LOAD_SOFT_SA, 13844,
        # MessageId: ERROR_IPSEC_IKE_SOFT_SA_TORN_DOWN
        # MessageText:
        # Soft SA torn down
        :IPSEC_IKE_SOFT_SA_TORN_DOWN, 13845,
        # MessageId: ERROR_IPSEC_IKE_INVALID_COOKIE
        # MessageText:
        # Invalid cookie received.
        :IPSEC_IKE_INVALID_COOKIE, 13846,
        # MessageId: ERROR_IPSEC_IKE_NO_PEER_CERT
        # MessageText:
        # Peer failed to send valid machine certificate
        :IPSEC_IKE_NO_PEER_CERT, 13847,
        # MessageId: ERROR_IPSEC_IKE_PEER_CRL_FAILED
        # MessageText:
        # Certification Revocation check of peer's certificate failed
        :IPSEC_IKE_PEER_CRL_FAILED, 13848,
        # MessageId: ERROR_IPSEC_IKE_POLICY_CHANGE
        # MessageText:
        # New policy invalidated SAs formed with old policy
        :IPSEC_IKE_POLICY_CHANGE, 13849,
        # MessageId: ERROR_IPSEC_IKE_NO_MM_POLICY
        # MessageText:
        # There is no available Main Mode IKE policy.
        :IPSEC_IKE_NO_MM_POLICY, 13850,
        # MessageId: ERROR_IPSEC_IKE_NOTCBPRIV
        # MessageText:
        # Failed to enabled TCB privilege.
        :IPSEC_IKE_NOTCBPRIV, 13851,
        # MessageId: ERROR_IPSEC_IKE_SECLOADFAIL
        # MessageText:
        # Failed to load SECURITY.DLL.
        :IPSEC_IKE_SECLOADFAIL, 13852,
        # MessageId: ERROR_IPSEC_IKE_FAILSSPINIT
        # MessageText:
        # Failed to obtain security function table dispatch address from SSPI.
        :IPSEC_IKE_FAILSSPINIT, 13853,
        # MessageId: ERROR_IPSEC_IKE_FAILQUERYSSP
        # MessageText:
        # Failed to query Kerberos package to obtain max token size.
        :IPSEC_IKE_FAILQUERYSSP, 13854,
        # MessageId: ERROR_IPSEC_IKE_SRVACQFAIL
        # MessageText:
        # Failed to obtain Kerberos server credentials for ISAKMP/ERROR_IPSEC_IKE service. Kerberos authentication will
        # not function. The most likely reason for this is lack of domain membership. This is normal if your computer is
        # a member of a workgroup.
        :IPSEC_IKE_SRVACQFAIL, 13855,
        # MessageId: ERROR_IPSEC_IKE_SRVQUERYCRED
        # MessageText:
        # Failed to determine SSPI principal name for ISAKMP/ERROR_IPSEC_IKE service (QueryCredentialsAttributes).
        :IPSEC_IKE_SRVQUERYCRED, 13856,
        # MessageId: ERROR_IPSEC_IKE_GETSPIFAIL
        # MessageText:
        # Failed to obtain new SPI for the inbound SA from IPsec driver. The most common cause for this is that the
        # driver does not have the correct filter. Check your policy to verify the filters.
        :IPSEC_IKE_GETSPIFAIL, 13857,
        # MessageId: ERROR_IPSEC_IKE_INVALID_FILTER
        # MessageText:
        # Given filter is invalid
        :IPSEC_IKE_INVALID_FILTER, 13858,
        # MessageId: ERROR_IPSEC_IKE_OUT_OF_MEMORY
        # MessageText:
        # Memory allocation failed.
        :IPSEC_IKE_OUT_OF_MEMORY, 13859,
        # MessageId: ERROR_IPSEC_IKE_ADD_UPDATE_KEY_FAILED
        # MessageText:
        # Failed to add Security Association to IPsec Driver. The most common cause for this is if the IKE negotiation
        # took too long to complete. If the problem persists, reduce the load on the faulting machine.
        :IPSEC_IKE_ADD_UPDATE_KEY_FAILED, 13860,
        # MessageId: ERROR_IPSEC_IKE_INVALID_POLICY
        # MessageText:
        # Invalid policy
        :IPSEC_IKE_INVALID_POLICY, 13861,
        # MessageId: ERROR_IPSEC_IKE_UNKNOWN_DOI
        # MessageText:
        # Invalid DOI
        :IPSEC_IKE_UNKNOWN_DOI, 13862,
        # MessageId: ERROR_IPSEC_IKE_INVALID_SITUATION
        # MessageText:
        # Invalid situation
        :IPSEC_IKE_INVALID_SITUATION, 13863,
        # MessageId: ERROR_IPSEC_IKE_DH_FAILURE
        # MessageText:
        # Diffie-Hellman failure
        :IPSEC_IKE_DH_FAILURE, 13864,
        # MessageId: ERROR_IPSEC_IKE_INVALID_GROUP
        # MessageText:
        # Invalid Diffie-Hellman group
        :IPSEC_IKE_INVALID_GROUP, 13865,
        # MessageId: ERROR_IPSEC_IKE_ENCRYPT
        # MessageText:
        # Error encrypting payload
        :IPSEC_IKE_ENCRYPT, 13866,
        # MessageId: ERROR_IPSEC_IKE_DECRYPT
        # MessageText:
        # Error decrypting payload
        :IPSEC_IKE_DECRYPT, 13867,
        # MessageId: ERROR_IPSEC_IKE_POLICY_MATCH
        # MessageText:
        # Policy match error
        :IPSEC_IKE_POLICY_MATCH, 13868,
        # MessageId: ERROR_IPSEC_IKE_UNSUPPORTED_ID
        # MessageText:
        # Unsupported ID
        :IPSEC_IKE_UNSUPPORTED_ID, 13869,
        # MessageId: ERROR_IPSEC_IKE_INVALID_HASH
        # MessageText:
        # Hash verification failed
        :IPSEC_IKE_INVALID_HASH, 13870,
        # MessageId: ERROR_IPSEC_IKE_INVALID_HASH_ALG
        # MessageText:
        # Invalid hash algorithm
        :IPSEC_IKE_INVALID_HASH_ALG, 13871,
        # MessageId: ERROR_IPSEC_IKE_INVALID_HASH_SIZE
        # MessageText:
        # Invalid hash size
        :IPSEC_IKE_INVALID_HASH_SIZE, 13872,
        # MessageId: ERROR_IPSEC_IKE_INVALID_ENCRYPT_ALG
        # MessageText:
        # Invalid encryption algorithm
        :IPSEC_IKE_INVALID_ENCRYPT_ALG, 13873,
        # MessageId: ERROR_IPSEC_IKE_INVALID_AUTH_ALG
        # MessageText:
        # Invalid authentication algorithm
        :IPSEC_IKE_INVALID_AUTH_ALG, 13874,
        # MessageId: ERROR_IPSEC_IKE_INVALID_SIG
        # MessageText:
        # Invalid certificate signature
        :IPSEC_IKE_INVALID_SIG, 13875,
        # MessageId: ERROR_IPSEC_IKE_LOAD_FAILED
        # MessageText:
        # Load failed
        :IPSEC_IKE_LOAD_FAILED, 13876,
        # MessageId: ERROR_IPSEC_IKE_RPC_DELETE
        # MessageText:
        # Deleted via RPC call
        :IPSEC_IKE_RPC_DELETE, 13877,
        # MessageId: ERROR_IPSEC_IKE_BENIGN_REINIT
        # MessageText:
        # Temporary state created to perform reinitialization. This is not a real failure.
        :IPSEC_IKE_BENIGN_REINIT, 13878,
        # MessageId: ERROR_IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY
        # MessageText:
        # The lifetime value received in the Responder Lifetime Notify is below the Windows 2000 configured minimum
        # value. Please fix the policy on the peer machine.
        :IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY, 13879,
        # MessageId: ERROR_IPSEC_IKE_INVALID_MAJOR_VERSION
        # MessageText:
        # The recipient cannot handle version of IKE specified in the header.
        :IPSEC_IKE_INVALID_MAJOR_VERSION, 13880,
        # MessageId: ERROR_IPSEC_IKE_INVALID_CERT_KEYLEN
        # MessageText:
        # Key length in certificate is too small for configured security requirements.
        :IPSEC_IKE_INVALID_CERT_KEYLEN, 13881,
        # MessageId: ERROR_IPSEC_IKE_MM_LIMIT
        # MessageText:
        # Max number of established MM SAs to peer exceeded.
        :IPSEC_IKE_MM_LIMIT, 13882,
        # MessageId: ERROR_IPSEC_IKE_NEGOTIATION_DISABLED
        # MessageText:
        # IKE received a policy that disables negotiation.
        :IPSEC_IKE_NEGOTIATION_DISABLED, 13883,
        # MessageId: ERROR_IPSEC_IKE_QM_LIMIT
        # MessageText:
        # Reached maximum quick mode limit for the main mode. New main mode will be started.
        :IPSEC_IKE_QM_LIMIT, 13884,
        # MessageId: ERROR_IPSEC_IKE_MM_EXPIRED
        # MessageText:
        # Main mode SA lifetime expired or peer sent a main mode delete.
        :IPSEC_IKE_MM_EXPIRED, 13885,
        # MessageId: ERROR_IPSEC_IKE_PEER_MM_ASSUMED_INVALID
        # MessageText:
        # Main mode SA assumed to be invalid because peer stopped responding.
        :IPSEC_IKE_PEER_MM_ASSUMED_INVALID, 13886,
        # MessageId: ERROR_IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH
        # MessageText:
        # Certificate doesn't chain to a trusted root in IPsec policy.
        :IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH, 13887,
        # MessageId: ERROR_IPSEC_IKE_UNEXPECTED_MESSAGE_ID
        # MessageText:
        # Received unexpected message ID.
        :IPSEC_IKE_UNEXPECTED_MESSAGE_ID, 13888,
        # MessageId: ERROR_IPSEC_IKE_INVALID_AUTH_PAYLOAD
        # MessageText:
        # Received invalid authentication offers.
        :IPSEC_IKE_INVALID_AUTH_PAYLOAD, 13889,
        # MessageId: ERROR_IPSEC_IKE_DOS_COOKIE_SENT
        # MessageText:
        # Sent DoS cookie notify to initiator.
        :IPSEC_IKE_DOS_COOKIE_SENT, 13890,
        # MessageId: ERROR_IPSEC_IKE_SHUTTING_DOWN
        # MessageText:
        # IKE service is shutting down.
        :IPSEC_IKE_SHUTTING_DOWN, 13891,
        # MessageId: ERROR_IPSEC_IKE_CGA_AUTH_FAILED
        # MessageText:
        # Could not verify binding between CGA address and certificate.
        :IPSEC_IKE_CGA_AUTH_FAILED, 13892,
        # MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_NATOA
        # MessageText:
        # Error processing NatOA payload.
        :IPSEC_IKE_PROCESS_ERR_NATOA, 13893,
        # MessageId: ERROR_IPSEC_IKE_INVALID_MM_FOR_QM
        # MessageText:
        # Parameters of the main mode are invalid for this quick mode.
        :IPSEC_IKE_INVALID_MM_FOR_QM, 13894,
        # MessageId: ERROR_IPSEC_IKE_QM_EXPIRED
        # MessageText:
        # Quick mode SA was expired by IPsec driver.
        :IPSEC_IKE_QM_EXPIRED, 13895,
        # MessageId: ERROR_IPSEC_IKE_TOO_MANY_FILTERS
        # MessageText:
        # Too many dynamically added IKEEXT filters were detected.
        :IPSEC_IKE_TOO_MANY_FILTERS, 13896,
        # Do NOT change this final value.  It is used in a public API structure
        # MessageId: ERROR_IPSEC_IKE_NEG_STATUS_END
        # MessageText:
        #  ERROR_IPSEC_IKE_NEG_STATUS_END
        :IPSEC_IKE_NEG_STATUS_END, 13897,
        # MessageId: ERROR_IPSEC_IKE_KILL_DUMMY_NAP_TUNNEL
        # MessageText:
        # NAP reauth succeeded and must delete the dummy NAP IKEv2 tunnel.
        :IPSEC_IKE_KILL_DUMMY_NAP_TUNNEL, 13898,
        # MessageId: ERROR_IPSEC_IKE_INNER_IP_ASSIGNMENT_FAILURE
        # MessageText:
        # Error in assigning inner IP address to initiator in tunnel mode.
        :IPSEC_IKE_INNER_IP_ASSIGNMENT_FAILURE, 13899,
        # MessageId: ERROR_IPSEC_IKE_REQUIRE_CP_PAYLOAD_MISSING
        # MessageText:
        # Require configuration payload missing.
        :IPSEC_IKE_REQUIRE_CP_PAYLOAD_MISSING, 13900,
        # MessageId: ERROR_IPSEC_KEY_MODULE_IMPERSONATION_NEGOTIATION_PENDING
        # MessageText:
        # A negotiation running as the security principle who issued the connection is in progress
        :IPSEC_KEY_MODULE_IMPERSONATION_NEGOTIATION_PENDING, 13901,
        # MessageId: ERROR_IPSEC_IKE_COEXISTENCE_SUPPRESS
        # MessageText:
        # SA was deleted due to IKEv1/AuthIP co-existence suppress check.
        :IPSEC_IKE_COEXISTENCE_SUPPRESS, 13902,
        # MessageId: ERROR_IPSEC_IKE_RATELIMIT_DROP
        # MessageText:
        # Incoming SA request was dropped due to peer IP address rate limiting.
        :IPSEC_IKE_RATELIMIT_DROP, 13903,
        # MessageId: ERROR_IPSEC_IKE_PEER_DOESNT_SUPPORT_MOBIKE
        # MessageText:
        # Peer does not support MOBIKE.
        :IPSEC_IKE_PEER_DOESNT_SUPPORT_MOBIKE, 13904,
        # MessageId: ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE
        # MessageText:
        # SA establishment is not authorized.
        :IPSEC_IKE_AUTHORIZATION_FAILURE, 13905,
        # MessageId: ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_FAILURE
        # MessageText:
        # SA establishment is not authorized because there is not a sufficiently strong PKINIT-based credential.
        :IPSEC_IKE_STRONG_CRED_AUTHORIZATION_FAILURE, 13906,
        # MessageId: ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE_WITH_OPTIONAL_RETRY
        # MessageText:
        # SA establishment is not authorized.  You may need to enter updated or different credentials such as a
        # smartcard.
        :IPSEC_IKE_AUTHORIZATION_FAILURE_WITH_OPTIONAL_RETRY, 13907,
        # MessageId: ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_AND_CERTMAP_FAILURE
        # MessageText:
        # SA establishment is not authorized because there is not a sufficiently strong PKINIT-based credential. This
        # might be related to certificate-to-account mapping failure for the SA.
        :IPSEC_IKE_STRONG_CRED_AUTHORIZATION_AND_CERTMAP_FAILURE, 13908,
        # Extended upper bound for IKE errors to accomodate new errors
        # MessageId: ERROR_IPSEC_IKE_NEG_STATUS_EXTENDED_END
        # MessageText:
        #  ERROR_IPSEC_IKE_NEG_STATUS_EXTENDED_END
        :IPSEC_IKE_NEG_STATUS_EXTENDED_END, 13909,
        # Following error codes are returned by IPsec kernel.
        # MessageId: ERROR_IPSEC_BAD_SPI
        # MessageText:
        # The SPI in the packet does not match a valid IPsec SA.
        :IPSEC_BAD_SPI, 13910,
        # MessageId: ERROR_IPSEC_SA_LIFETIME_EXPIRED
        # MessageText:
        # Packet was received on an IPsec SA whose lifetime has expired.
        :IPSEC_SA_LIFETIME_EXPIRED, 13911,
        # MessageId: ERROR_IPSEC_WRONG_SA
        # MessageText:
        # Packet was received on an IPsec SA that does not match the packet characteristics.
        :IPSEC_WRONG_SA, 13912,
        # MessageId: ERROR_IPSEC_REPLAY_CHECK_FAILED
        # MessageText:
        # Packet sequence number replay check failed.
        :IPSEC_REPLAY_CHECK_FAILED, 13913,
        # MessageId: ERROR_IPSEC_INVALID_PACKET
        # MessageText:
        # IPsec header and/or trailer in the packet is invalid.
        :IPSEC_INVALID_PACKET, 13914,
        # MessageId: ERROR_IPSEC_INTEGRITY_CHECK_FAILED
        # MessageText:
        # IPsec integrity check failed.
        :IPSEC_INTEGRITY_CHECK_FAILED, 13915,
        # MessageId: ERROR_IPSEC_CLEAR_TEXT_DROP
        # MessageText:
        # IPsec dropped a clear text packet.
        :IPSEC_CLEAR_TEXT_DROP, 13916,
        # MessageId: ERROR_IPSEC_AUTH_FIREWALL_DROP
        # MessageText:
        # IPsec dropped an incoming ESP packet in authenticated firewall mode. This drop is benign.
        :IPSEC_AUTH_FIREWALL_DROP, 13917,
        # MessageId: ERROR_IPSEC_THROTTLE_DROP
        # MessageText:
        # IPsec dropped a packet due to DoS throttling.
        :IPSEC_THROTTLE_DROP, 13918,
        # MessageId: ERROR_IPSEC_DOSP_BLOCK
        # MessageText:
        # IPsec DoS Protection matched an explicit block rule.
        :IPSEC_DOSP_BLOCK, 13925,
        # MessageId: ERROR_IPSEC_DOSP_RECEIVED_MULTICAST
        # MessageText:
        # IPsec DoS Protection received an IPsec specific multicast packet which is not allowed.
        :IPSEC_DOSP_RECEIVED_MULTICAST, 13926,
        # MessageId: ERROR_IPSEC_DOSP_INVALID_PACKET
        # MessageText:
        # IPsec DoS Protection received an incorrectly formatted packet.
        :IPSEC_DOSP_INVALID_PACKET, 13927,
        # MessageId: ERROR_IPSEC_DOSP_STATE_LOOKUP_FAILED
        # MessageText:
        # IPsec DoS Protection failed to look up state.
        :IPSEC_DOSP_STATE_LOOKUP_FAILED, 13928,
        # MessageId: ERROR_IPSEC_DOSP_MAX_ENTRIES
        # MessageText:
        # IPsec DoS Protection failed to create state because the maximum number of entries allowed by policy has been
        # reached.
        :IPSEC_DOSP_MAX_ENTRIES, 13929,
        # MessageId: ERROR_IPSEC_DOSP_KEYMOD_NOT_ALLOWED
        # MessageText:
        # IPsec DoS Protection received an IPsec negotiation packet for a keying module which is not allowed by policy.
        :IPSEC_DOSP_KEYMOD_NOT_ALLOWED, 13930,
        # MessageId: ERROR_IPSEC_DOSP_NOT_INSTALLED
        # MessageText:
        # IPsec DoS Protection has not been enabled.
        :IPSEC_DOSP_NOT_INSTALLED, 13931,
        # MessageId: ERROR_IPSEC_DOSP_MAX_PER_IP_RATELIMIT_QUEUES
        # MessageText:
        # IPsec DoS Protection failed to create a per internal IP rate limit queue because the maximum number of queues
        # allowed by policy has been reached.
        :IPSEC_DOSP_MAX_PER_IP_RATELIMIT_QUEUES, 13932,
        #=== End of IPSec Error codes 13000 to 13999 ===#
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end