module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== WinSock Error Codes 10000 to 11999 ===#
        # WinSock error codes are also defined in WinSock.h
        # and WinSock2.h, hence the IFDEF
        #ifndef WSABASEERR
        :WSABASEERR, 10000,
        # MessageId: WSAEINTR
        # MessageText:
        # A blocking operation was interrupted by a call to WSACancelBlockingCall.
        :WSAEINTR, 10004,
        # MessageId: WSAEBADF
        # MessageText:
        # The file handle supplied is not valid.
        :WSAEBADF, 10009,
        # MessageId: WSAEACCES
        # MessageText:
        # An attempt was made to access a socket in a way forbidden by its access permissions.
        :WSAEACCES, 10013,
        # MessageId: WSAEFAULT
        # MessageText:
        # The system detected an invalid pointer address in attempting to use a pointer argument in a call.
        :WSAEFAULT, 10014,
        # MessageId: WSAEINVAL
        # MessageText:
        # An invalid argument was supplied.
        :WSAEINVAL, 10022,
        # MessageId: WSAEMFILE
        # MessageText:
        # Too many open sockets.
        :WSAEMFILE, 10024,
        # MessageId: WSAEWOULDBLOCK
        # MessageText:
        # A non-blocking socket operation could not be completed immediately.
        :WSAEWOULDBLOCK, 10035,
        # MessageId: WSAEINPROGRESS
        # MessageText:
        # A blocking operation is currently executing.
        :WSAEINPROGRESS, 10036,
        # MessageId: WSAEALREADY
        # MessageText:
        # An operation was attempted on a non-blocking socket that already had an operation in progress.
        :WSAEALREADY, 10037,
        # MessageId: WSAENOTSOCK
        # MessageText:
        # An operation was attempted on something that is not a socket.
        :WSAENOTSOCK, 10038,
        # MessageId: WSAEDESTADDRREQ
        # MessageText:
        # A required address was omitted from an operation on a socket.
        :WSAEDESTADDRREQ, 10039,
        # MessageId: WSAEMSGSIZE
        # MessageText:
        # A message sent on a datagram socket was larger than the internal message buffer or some other network limit, or the buffer used to receive a datagram into was smaller than the datagram itself.
        :WSAEMSGSIZE, 10040,
        # MessageId: WSAEPROTOTYPE
        # MessageText:
        # A protocol was specified in the socket function call that does not support the semantics of the socket type requested.
        :WSAEPROTOTYPE, 10041,
        # MessageId: WSAENOPROTOOPT
        # MessageText:
        # An unknown, invalid, or unsupported option or level was specified in a getsockopt or setsockopt call.
        :WSAENOPROTOOPT, 10042,
        # MessageId: WSAEPROTONOSUPPORT
        # MessageText:
        # The requested protocol has not been configured into the system, or no implementation for it exists.
        :WSAEPROTONOSUPPORT, 10043,
        # MessageId: WSAESOCKTNOSUPPORT
        # MessageText:
        # The support for the specified socket type does not exist in this address family.
        :WSAESOCKTNOSUPPORT, 10044,
        # MessageId: WSAEOPNOTSUPP
        # MessageText:
        # The attempted operation is not supported for the type of object referenced.
        :WSAEOPNOTSUPP, 10045,
        # MessageId: WSAEPFNOSUPPORT
        # MessageText:
        # The protocol family has not been configured into the system or no implementation for it exists.
        :WSAEPFNOSUPPORT, 10046,
        # MessageId: WSAEAFNOSUPPORT
        # MessageText:
        # An address incompatible with the requested protocol was used.
        :WSAEAFNOSUPPORT, 10047,
        # MessageId: WSAEADDRINUSE
        # MessageText:
        # Only one usage of each socket address (protocol/network address/port) is normally permitted.
        :WSAEADDRINUSE, 10048,
        # MessageId: WSAEADDRNOTAVAIL
        # MessageText:
        # The requested address is not valid in its context.
        :WSAEADDRNOTAVAIL, 10049,
        # MessageId: WSAENETDOWN
        # MessageText:
        # A socket operation encountered a dead network.
        :WSAENETDOWN, 10050,
        # MessageId: WSAENETUNREACH
        # MessageText:
        # A socket operation was attempted to an unreachable network.
        :WSAENETUNREACH, 10051,
        # MessageId: WSAENETRESET
        # MessageText:
        # The connection has been broken due to keep-alive activity detecting a failure while the operation was in progress.
        :WSAENETRESET, 10052,
        # MessageId: WSAECONNABORTED
        # MessageText:
        # An established connection was aborted by the software in your host machine.
        :WSAECONNABORTED, 10053,
        # MessageId: WSAECONNRESET
        # MessageText:
        # An existing connection was forcibly closed by the remote host.
        :WSAECONNRESET, 10054,
        # MessageId: WSAENOBUFS
        # MessageText:
        # An operation on a socket could not be performed because the system lacked sufficient buffer space or because a queue was full.
        :WSAENOBUFS, 10055,
        # MessageId: WSAEISCONN
        # MessageText:
        # A connect request was made on an already connected socket.
        :WSAEISCONN, 10056,
        # MessageId: WSAENOTCONN
        # MessageText:
        # A request to send or receive data was disallowed because the socket is not connected and (when sending on a datagram socket using a sendto call) no address was supplied.
        :WSAENOTCONN, 10057,
        # MessageId: WSAESHUTDOWN
        # MessageText:
        # A request to send or receive data was disallowed because the socket had already been shut down in that direction with a previous shutdown call.
        :WSAESHUTDOWN, 10058,
        # MessageId: WSAETOOMANYREFS
        # MessageText:
        # Too many references to some kernel object.
        :WSAETOOMANYREFS, 10059,
        # MessageId: WSAETIMEDOUT
        # MessageText:
        # A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond.
        :WSAETIMEDOUT, 10060,
        # MessageId: WSAECONNREFUSED
        # MessageText:
        # No connection could be made because the target machine actively refused it.
        :WSAECONNREFUSED, 10061,
        # MessageId: WSAELOOP
        # MessageText:
        # Cannot translate name.
        :WSAELOOP, 10062,
        # MessageId: WSAENAMETOOLONG
        # MessageText:
        # Name component or name was too long.
        :WSAENAMETOOLONG, 10063,
        # MessageId: WSAEHOSTDOWN
        # MessageText:
        # A socket operation failed because the destination host was down.
        :WSAEHOSTDOWN, 10064,
        # MessageId: WSAEHOSTUNREACH
        # MessageText:
        # A socket operation was attempted to an unreachable host.
        :WSAEHOSTUNREACH, 10065,
        # MessageId: WSAENOTEMPTY
        # MessageText:
        # Cannot remove a directory that is not empty.
        :WSAENOTEMPTY, 10066,
        # MessageId: WSAEPROCLIM
        # MessageText:
        # A Windows Sockets implementation may have a limit on the number of applications that may use it simultaneously.
        :WSAEPROCLIM, 10067,
        # MessageId: WSAEUSERS
        # MessageText:
        # Ran out of quota.
        :WSAEUSERS, 10068,
        # MessageId: WSAEDQUOT
        # MessageText:
        # Ran out of disk quota.
        :WSAEDQUOT, 10069,
        # MessageId: WSAESTALE
        # MessageText:
        # File handle reference is no longer available.
        :WSAESTALE, 10070,
        # MessageId: WSAEREMOTE
        # MessageText:
        # Item is not available locally.
        :WSAEREMOTE, 10071,
        # MessageId: WSASYSNOTREADY
        # MessageText:
        # WSAStartup cannot function at this time because the underlying system it uses to provide network services is currently unavailable.
        :WSASYSNOTREADY, 10091,
        # MessageId: WSAVERNOTSUPPORTED
        # MessageText:
        # The Windows Sockets version requested is not supported.
        :WSAVERNOTSUPPORTED, 10092,
        # MessageId: WSANOTINITIALISED
        # MessageText:
        # Either the application has not called WSAStartup, or WSAStartup failed.
        :WSANOTINITIALISED, 10093,
        # MessageId: WSAEDISCON
        # MessageText:
        # Returned by WSARecv or WSARecvFrom to indicate the remote party has initiated a graceful shutdown sequence.
        :WSAEDISCON, 10101,
        # MessageId: WSAENOMORE
        # MessageText:
        # No more results can be returned by WSALookupServiceNext.
        :WSAENOMORE, 10102,
        # MessageId: WSAECANCELLED
        # MessageText:
        # A call to WSALookupServiceEnd was made while this call was still processing. The call has been canceled.
        :WSAECANCELLED, 10103,
        # MessageId: WSAEINVALIDPROCTABLE
        # MessageText:
        # The procedure call table is invalid.
        :WSAEINVALIDPROCTABLE, 10104,
        # MessageId: WSAEINVALIDPROVIDER
        # MessageText:
        # The requested service provider is invalid.
        :WSAEINVALIDPROVIDER, 10105,
        # MessageId: WSAEPROVIDERFAILEDINIT
        # MessageText:
        # The requested service provider could not be loaded or initialized.
        :WSAEPROVIDERFAILEDINIT, 10106,
        # MessageId: WSASYSCALLFAILURE
        # MessageText:
        # A system call has failed.
        :WSASYSCALLFAILURE, 10107,
        # MessageId: WSASERVICE_NOT_FOUND
        # MessageText:
        # No such service is known. The service cannot be found in the specified name space.
        :WSASERVICE_NOT_FOUND, 10108,
        # MessageId: WSATYPE_NOT_FOUND
        # MessageText:
        # The specified class was not found.
        :WSATYPE_NOT_FOUND, 10109,
        # MessageId: WSA_E_NO_MORE
        # MessageText:
        # No more results can be returned by WSALookupServiceNext.
        :WSA_E_NO_MORE, 10110,
        # MessageId: WSA_E_CANCELLED
        # MessageText:
        # A call to WSALookupServiceEnd was made while this call was still processing. The call has been canceled.
        :WSA_E_CANCELLED, 10111,
        # MessageId: WSAEREFUSED
        # MessageText:
        # A database query failed because it was actively refused.
        :WSAEREFUSED, 10112,
        # MessageId: WSAHOST_NOT_FOUND
        # MessageText:
        # No such host is known.
        :WSAHOST_NOT_FOUND, 11001,
        # MessageId: WSATRY_AGAIN
        # MessageText:
        # This is usually a temporary error during hostname resolution and means that the local server did not receive a response from an authoritative server.
        :WSATRY_AGAIN, 11002,
        # MessageId: WSANO_RECOVERY
        # MessageText:
        # A non-recoverable error occurred during a database lookup.
        :WSANO_RECOVERY, 11003,
        # MessageId: WSANO_DATA
        # MessageText:
        # The requested name is valid, but no data of the requested type was found.
        :WSANO_DATA, 11004,
        # MessageId: WSA_QOS_RECEIVERS
        # MessageText:
        # At least one reserve has arrived.
        :WSA_QOS_RECEIVERS, 11005,
        # MessageId: WSA_QOS_SENDERS
        # MessageText:
        # At least one path has arrived.
        :WSA_QOS_SENDERS, 11006,
        # MessageId: WSA_QOS_NO_SENDERS
        # MessageText:
        # There are no senders.
        :WSA_QOS_NO_SENDERS, 11007,
        # MessageId: WSA_QOS_NO_RECEIVERS
        # MessageText:
        # There are no receivers.
        :WSA_QOS_NO_RECEIVERS, 11008,
        # MessageId: WSA_QOS_REQUEST_CONFIRMED
        # MessageText:
        # Reserve has been confirmed.
        :WSA_QOS_REQUEST_CONFIRMED, 11009,
        # MessageId: WSA_QOS_ADMISSION_FAILURE
        # MessageText:
        # Error due to lack of resources.
        :WSA_QOS_ADMISSION_FAILURE, 11010,
        # MessageId: WSA_QOS_POLICY_FAILURE
        # MessageText:
        # Rejected for administrative reasons - bad credentials.
        :WSA_QOS_POLICY_FAILURE, 11011,
        # MessageId: WSA_QOS_BAD_STYLE
        # MessageText:
        # Unknown or conflicting style.
        :WSA_QOS_BAD_STYLE, 11012,
        # MessageId: WSA_QOS_BAD_OBJECT
        # MessageText:
        # Problem with some part of the filterspec or providerspecific buffer in general.
        :WSA_QOS_BAD_OBJECT, 11013,
        # MessageId: WSA_QOS_TRAFFIC_CTRL_ERROR
        # MessageText:
        # Problem with some part of the flowspec.
        :WSA_QOS_TRAFFIC_CTRL_ERROR, 11014,
        # MessageId: WSA_QOS_GENERIC_ERROR
        # MessageText:
        # General QOS error.
        :WSA_QOS_GENERIC_ERROR, 11015,
        # MessageId: WSA_QOS_ESERVICETYPE
        # MessageText:
        # An invalid or unrecognized service type was found in the flowspec.
        :WSA_QOS_ESERVICETYPE, 11016,
        # MessageId: WSA_QOS_EFLOWSPEC
        # MessageText:
        # An invalid or inconsistent flowspec was found in the QOS structure.
        :WSA_QOS_EFLOWSPEC, 11017,
        # MessageId: WSA_QOS_EPROVSPECBUF
        # MessageText:
        # Invalid QOS provider-specific buffer.
        :WSA_QOS_EPROVSPECBUF, 11018,
        # MessageId: WSA_QOS_EFILTERSTYLE
        # MessageText:
        # An invalid QOS filter style was used.
        :WSA_QOS_EFILTERSTYLE, 11019,
        # MessageId: WSA_QOS_EFILTERTYPE
        # MessageText:
        # An invalid QOS filter type was used.
        :WSA_QOS_EFILTERTYPE, 11020,
        # MessageId: WSA_QOS_EFILTERCOUNT
        # MessageText:
        # An incorrect number of QOS FILTERSPECs were specified in the FLOWDESCRIPTOR.
        :WSA_QOS_EFILTERCOUNT, 11021,
        # MessageId: WSA_QOS_EOBJLENGTH
        # MessageText:
        # An object with an invalid ObjectLength field was specified in the QOS provider-specific buffer.
        :WSA_QOS_EOBJLENGTH, 11022,
        # MessageId: WSA_QOS_EFLOWCOUNT
        # MessageText:
        # An incorrect number of flow descriptors was specified in the QOS structure.
        :WSA_QOS_EFLOWCOUNT, 11023,
        # MessageId: WSA_QOS_EUNKOWNPSOBJ
        # MessageText:
        # An unrecognized object was found in the QOS provider-specific buffer.
        :WSA_QOS_EUNKOWNPSOBJ, 11024,
        # MessageId: WSA_QOS_EPOLICYOBJ
        # MessageText:
        # An invalid policy object was found in the QOS provider-specific buffer.
        :WSA_QOS_EPOLICYOBJ, 11025,
        # MessageId: WSA_QOS_EFLOWDESC
        # MessageText:
        # An invalid QOS flow descriptor was found in the flow descriptor list.
        :WSA_QOS_EFLOWDESC, 11026,
        # MessageId: WSA_QOS_EPSFLOWSPEC
        # MessageText:
        # An invalid or inconsistent flowspec was found in the QOS provider specific buffer.
        :WSA_QOS_EPSFLOWSPEC, 11027,
        # MessageId: WSA_QOS_EPSFILTERSPEC
        # MessageText:
        # An invalid FILTERSPEC was found in the QOS provider-specific buffer.
        :WSA_QOS_EPSFILTERSPEC, 11028,
        # MessageId: WSA_QOS_ESDMODEOBJ
        # MessageText:
        # An invalid shape discard mode object was found in the QOS provider specific buffer.
        :WSA_QOS_ESDMODEOBJ, 11029,
        # MessageId: WSA_QOS_ESHAPERATEOBJ
        # MessageText:
        # An invalid shaping rate object was found in the QOS provider-specific buffer.
        :WSA_QOS_ESHAPERATEOBJ, 11030,
        # MessageId: WSA_QOS_RESERVED_PETYPE
        # MessageText:
        # A reserved policy element was found in the QOS provider-specific buffer.
        :WSA_QOS_RESERVED_PETYPE, 11031,
        # MessageId: WSA_SECURE_HOST_NOT_FOUND
        # MessageText:
        # No such host is known securely.
        :WSA_SECURE_HOST_NOT_FOUND, 11032,
        # MessageId: WSA_IPSEC_NAME_POLICY_ERROR
        # MessageText:
        # Name based IPSEC policy could not be added.
        :WSA_IPSEC_NAME_POLICY_ERROR, 11033,
        #endif
        # defined(WSABASEERR)
        # End of WinSock Error Codes 10000 to 11999 ===#
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end