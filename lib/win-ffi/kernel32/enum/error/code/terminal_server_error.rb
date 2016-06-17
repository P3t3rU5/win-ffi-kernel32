module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Terminal Server Error codes 7000 to 7099 ===#
        # MessageId: ERROR_CTX_WINSTATION_NAME_INVALID
        # MessageText:
        # The specified session name is invalid.
        :CTX_WINSTATION_NAME_INVALID, 7001,
        # MessageId: ERROR_CTX_INVALID_PD
        # MessageText:
        # The specified protocol driver is invalid.
        :CTX_INVALID_PD, 7002,
        # MessageId: ERROR_CTX_PD_NOT_FOUND
        # MessageText:
        # The specified protocol driver was not found in the system path.
        :CTX_PD_NOT_FOUND, 7003,
        # MessageId: ERROR_CTX_WD_NOT_FOUND
        # MessageText:
        # The specified terminal connection driver was not found in the system path.
        :CTX_WD_NOT_FOUND, 7004,
        # MessageId: ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY
        # MessageText:
        # A registry key for event logging could not be created for this session.
        :CTX_CANNOT_MAKE_EVENTLOG_ENTRY, 7005,
        # MessageId: ERROR_CTX_SERVICE_NAME_COLLISION
        # MessageText:
        # A service with the same name already exists on the system.
        :CTX_SERVICE_NAME_COLLISION, 7006,
        # MessageId: ERROR_CTX_CLOSE_PENDING
        # MessageText:
        # A close operation is pending on the session.
        :CTX_CLOSE_PENDING, 7007,
        # MessageId: ERROR_CTX_NO_OUTBUF
        # MessageText:
        # There are no free output buffers available.
        :CTX_NO_OUTBUF, 7008,
        # MessageId: ERROR_CTX_MODEM_INF_NOT_FOUND
        # MessageText:
        # The MODEM.INF file was not found.
        :CTX_MODEM_INF_NOT_FOUND, 7009,
        # MessageId: ERROR_CTX_INVALID_MODEMNAME
        # MessageText:
        # The modem name was not found in MODEM.INF.
        :CTX_INVALID_MODEMNAME, 7010,
        # MessageId: ERROR_CTX_MODEM_RESPONSE_ERROR
        # MessageText:
        # The modem did not accept the command sent to it. Verify that the configured modem name matches the attached
        # modem.
        :CTX_MODEM_RESPONSE_ERROR, 7011,
        # MessageId: ERROR_CTX_MODEM_RESPONSE_TIMEOUT
        # MessageText:
        # The modem did not respond to the command sent to it. Verify that the modem is properly cabled and powered on.
        :CTX_MODEM_RESPONSE_TIMEOUT, 7012,
        # MessageId: ERROR_CTX_MODEM_RESPONSE_NO_CARRIER
        # MessageText:
        # Carrier detect has failed or carrier has been dropped due to disconnect.
        :CTX_MODEM_RESPONSE_NO_CARRIER, 7013,
        # MessageId: ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE
        # MessageText:
        # Dial tone not detected within the required time. Verify that the phone cable is properly attached and
        # functional.
        :CTX_MODEM_RESPONSE_NO_DIALTONE, 7014,
        # MessageId: ERROR_CTX_MODEM_RESPONSE_BUSY
        # MessageText:
        # Busy signal detected at remote site on callback.
        :CTX_MODEM_RESPONSE_BUSY, 7015,
        # MessageId: ERROR_CTX_MODEM_RESPONSE_VOICE
        # MessageText:
        # Voice detected at remote site on callback.
        :CTX_MODEM_RESPONSE_VOICE, 7016,
        # MessageId: ERROR_CTX_TD_ERROR
        # MessageText:
        # Transport driver error
        :CTX_TD_ERROR, 7017,
        # MessageId: ERROR_CTX_WINSTATION_NOT_FOUND
        # MessageText:
        # The specified session cannot be found.
        :CTX_WINSTATION_NOT_FOUND, 7022,
        # MessageId: ERROR_CTX_WINSTATION_ALREADY_EXISTS
        # MessageText:
        # The specified session name is already in use.
        :CTX_WINSTATION_ALREADY_EXISTS, 7023,
        # MessageId: ERROR_CTX_WINSTATION_BUSY
        # MessageText:
        # The task you are trying to do can't be completed because Remote Desktop Services is currently busy. Please try
        # again in a few minutes. Other users should still be able to log on.
        :CTX_WINSTATION_BUSY, 7024,
        # MessageId: ERROR_CTX_BAD_VIDEO_MODE
        # MessageText:
        # An attempt has been made to connect to a session whose video mode is not supported by the current client.
        :CTX_BAD_VIDEO_MODE, 7025,
        # MessageId: ERROR_CTX_GRAPHICS_INVALID
        # MessageText:
        # The application attempted to enable DOS graphics mode. DOS graphics mode is not supported.
        :CTX_GRAPHICS_INVALID, 7035,
        # MessageId: ERROR_CTX_LOGON_DISABLED
        # MessageText:
        # Your interactive logon privilege has been disabled. Please contact your administrator.
        :CTX_LOGON_DISABLED, 7037,
        # MessageId: ERROR_CTX_NOT_CONSOLE
        # MessageText:
        # The requested operation can be performed only on the system console. This is most often the result of a driver
        # or system DLL requiring direct console access.
        :CTX_NOT_CONSOLE, 7038,
        # MessageId: ERROR_CTX_CLIENT_QUERY_TIMEOUT
        # MessageText:
        # The client failed to respond to the server connect message.
        :CTX_CLIENT_QUERY_TIMEOUT, 7040,
        # MessageId: ERROR_CTX_CONSOLE_DISCONNECT
        # MessageText:
        # Disconnecting the console session is not supported.
        :CTX_CONSOLE_DISCONNECT, 7041,
        # MessageId: ERROR_CTX_CONSOLE_CONNECT
        # MessageText:
        # Reconnecting a disconnected session to the console is not supported.
        :CTX_CONSOLE_CONNECT, 7042,
        # MessageId: ERROR_CTX_SHADOW_DENIED
        # MessageText:
        # The request to control another session remotely was denied.
        :CTX_SHADOW_DENIED, 7044,
        # MessageId: ERROR_CTX_WINSTATION_ACCESS_DENIED
        # MessageText:
        # The requested session access is denied.
        :CTX_WINSTATION_ACCESS_DENIED, 7045,
        # MessageId: ERROR_CTX_INVALID_WD
        # MessageText:
        # The specified terminal connection driver is invalid.
        :CTX_INVALID_WD, 7049,
        # MessageId: ERROR_CTX_SHADOW_INVALID
        # MessageText:
        # The requested session cannot be controlled remotely.
        # This may be because the session is disconnected or does not currently have a user logged on.
        :CTX_SHADOW_INVALID, 7050,
        # MessageId: ERROR_CTX_SHADOW_DISABLED
        # MessageText:
        # The requested session is not configured to allow remote control.
        :CTX_SHADOW_DISABLED, 7051,
        # MessageId: ERROR_CTX_CLIENT_LICENSE_IN_USE
        # MessageText:
        # Your request to connect to this Terminal Server has been rejected. Your Terminal Server client license number
        # is currently being used by another user. Please call your system administrator to obtain a unique license
        # number.
        :CTX_CLIENT_LICENSE_IN_USE, 7052,
        # MessageId: ERROR_CTX_CLIENT_LICENSE_NOT_SET
        # MessageText:
        # Your request to connect to this Terminal Server has been rejected. Your Terminal Server client license number
        # has not been entered for this copy of the Terminal Server client. Please contact your system administrator.
        :CTX_CLIENT_LICENSE_NOT_SET, 7053,
        # MessageId: ERROR_CTX_LICENSE_NOT_AVAILABLE
        # MessageText:
        # The number of connections to this computer is limited and all connections are in use right now. Try connecting
        # later or contact your system administrator.
        :CTX_LICENSE_NOT_AVAILABLE, 7054,
        # MessageId: ERROR_CTX_LICENSE_CLIENT_INVALID
        # MessageText:
        # The client you are using is not licensed to use this system. Your logon request is denied.
        :CTX_LICENSE_CLIENT_INVALID, 7055,
        # MessageId: ERROR_CTX_LICENSE_EXPIRED
        # MessageText:
        # The system license has expired. Your logon request is denied.
        :CTX_LICENSE_EXPIRED, 7056,
        # MessageId: ERROR_CTX_SHADOW_NOT_RUNNING
        # MessageText:
        # Remote control could not be terminated because the specified session is not currently being remotely
        # controlled.
        :CTX_SHADOW_NOT_RUNNING, 7057,
        # MessageId: ERROR_CTX_SHADOW_ENDED_BY_MODE_CHANGE
        # MessageText:
        # The remote control of the console was terminated because the display mode was changed. Changing the display
        # mode in a remote control session is not supported.
        :CTX_SHADOW_ENDED_BY_MODE_CHANGE, 7058,
        # MessageId: ERROR_ACTIVATION_COUNT_EXCEEDED
        # MessageText:
        # Activation has already been reset the maximum number of times for this installation. Your activation timer
        # will not be cleared.
        :ACTIVATION_COUNT_EXCEEDED, 7059,
        # MessageId: ERROR_CTX_WINSTATIONS_DISABLED
        # MessageText:
        # Remote logins are currently disabled.
        :CTX_WINSTATIONS_DISABLED, 7060,
        # MessageId: ERROR_CTX_ENCRYPTION_LEVEL_REQUIRED
        # MessageText:
        # You do not have the proper encryption level to access this Session.
        :CTX_ENCRYPTION_LEVEL_REQUIRED, 7061,
        # MessageId: ERROR_CTX_SESSION_IN_USE
        # MessageText:
        # The user %s\\%s is currently logged on to this computer. Only the current user or an administrator can log on
        # to this computer.
        :CTX_SESSION_IN_USE, 7062,
        # MessageId: ERROR_CTX_NO_FORCE_LOGOFF
        # MessageText:
        # The user %s\\%s is already logged on to the console of this computer. You do not have permission to log in at
        # this time. To resolve this issue, contact %s\\%s and have them log off.
        :CTX_NO_FORCE_LOGOFF, 7063,
        # MessageId: ERROR_CTX_ACCOUNT_RESTRICTION
        # MessageText:
        # Unable to log you on because of an account restriction.
        :CTX_ACCOUNT_RESTRICTION, 7064,
        # MessageId: ERROR_RDP_PROTOCOL_ERROR
        # MessageText:
        # The RDP protocol component %2 detected an error in the protocol stream and has disconnected the client.
        :RDP_PROTOCOL_ERROR, 7065,
        # MessageId: ERROR_CTX_CDM_CONNECT
        # MessageText:
        # The Client Drive Mapping Service Has Connected on Terminal Connection.
        :CTX_CDM_CONNECT, 7066,
        # MessageId: ERROR_CTX_CDM_DISCONNECT
        # MessageText:
        # The Client Drive Mapping Service Has Disconnected on Terminal Connection.
        :CTX_CDM_DISCONNECT, 7067,
        # MessageId: ERROR_CTX_SECURITY_LAYER_ERROR
        # MessageText:
        # The Terminal Server security layer detected an error in the protocol stream and has disconnected the client.
        :CTX_SECURITY_LAYER_ERROR, 7068,
        # MessageId: ERROR_TS_INCOMPATIBLE_SESSIONS
        # MessageText:
        # The target session is incompatible with the current session.
        :TS_INCOMPATIBLE_SESSIONS, 7069,
        # MessageId: ERROR_TS_VIDEO_SUBSYSTEM_ERROR
        # MessageText:
        # Windows can't connect to your session because a problem occurred in the Windows video subsystem. Try
        # connecting again later, or contact the server administrator for assistance.
        :TS_VIDEO_SUBSYSTEM_ERROR, 7070,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end