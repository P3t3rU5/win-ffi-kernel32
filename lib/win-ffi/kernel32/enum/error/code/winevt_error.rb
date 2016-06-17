module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Start of WinEvt Error codes 15000 to 15079 ===#
        # MessageId: ERROR_EVT_INVALID_CHANNEL_PATH
        # MessageText:
        # The specified channel path is invalid.
        :EVT_INVALID_CHANNEL_PATH, 15000,
        # MessageId: ERROR_EVT_INVALID_QUERY
        # MessageText:
        # The specified query is invalid.
        :EVT_INVALID_QUERY, 15001,
        # MessageId: ERROR_EVT_PUBLISHER_METADATA_NOT_FOUND
        # MessageText:
        # The publisher metadata cannot be found in the resource.
        :EVT_PUBLISHER_METADATA_NOT_FOUND, 15002,
        # MessageId: ERROR_EVT_EVENT_TEMPLATE_NOT_FOUND
        # MessageText:
        # The template for an event definition cannot be found in the resource (error = %1).
        :EVT_EVENT_TEMPLATE_NOT_FOUND, 15003,
        # MessageId: ERROR_EVT_INVALID_PUBLISHER_NAME
        # MessageText:
        # The specified publisher name is invalid.
        :EVT_INVALID_PUBLISHER_NAME, 15004,
        # MessageId: ERROR_EVT_INVALID_EVENT_DATA
        # MessageText:
        # The event data raised by the publisher is not compatible with the event template definition in the publisher's manifest
        :EVT_INVALID_EVENT_DATA, 15005,
        # MessageId: ERROR_EVT_CHANNEL_NOT_FOUND
        # MessageText:
        # The specified channel could not be found. Check channel configuration.
        :EVT_CHANNEL_NOT_FOUND, 15007,
        # MessageId: ERROR_EVT_MALFORMED_XML_TEXT
        # MessageText:
        # The specified xml text was not well-formed. See Extended Error for more details.
        :EVT_MALFORMED_XML_TEXT, 15008,
        # MessageId: ERROR_EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL
        # MessageText:
        # The caller is trying to subscribe to a direct channel which is not allowed. The events for a direct channel go directly to a logfile and cannot be subscribed to.
        :EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL, 15009,
        # MessageId: ERROR_EVT_CONFIGURATION_ERROR
        # MessageText:
        # Configuration error.
        :EVT_CONFIGURATION_ERROR, 15010,
        # MessageId: ERROR_EVT_QUERY_RESULT_STALE
        # MessageText:
        # The query result is stale / invalid. This may be due to the log being cleared or rolling over after the query result was created. Users should handle this code by releasing the query result object and reissuing the query.
        :EVT_QUERY_RESULT_STALE, 15011,
        # MessageId: ERROR_EVT_QUERY_RESULT_INVALID_POSITION
        # MessageText:
        # Query result is currently at an invalid position.
        :EVT_QUERY_RESULT_INVALID_POSITION, 15012,
        # MessageId: ERROR_EVT_NON_VALIDATING_MSXML
        # MessageText:
        # Registered MSXML doesn't support validation.
        :EVT_NON_VALIDATING_MSXML, 15013,
        # MessageId: ERROR_EVT_FILTER_ALREADYSCOPED
        # MessageText:
        # An expression can only be followed by a change of scope operation if it itself evaluates to a node set and is not already part of some other change of scope operation.
        :EVT_FILTER_ALREADYSCOPED, 15014,
        # MessageId: ERROR_EVT_FILTER_NOTELTSET
        # MessageText:
        # Can't perform a step operation from a term that does not represent an element set.
        :EVT_FILTER_NOTELTSET, 15015,
        # MessageId: ERROR_EVT_FILTER_INVARG
        # MessageText:
        # Left hand side arguments to binary operators must be either attributes, nodes or variables and right hand side arguments must be constants.
        :EVT_FILTER_INVARG, 15016,
        # MessageId: ERROR_EVT_FILTER_INVTEST
        # MessageText:
        # A step operation must involve either a node test or, in the case of a predicate, an algebraic expression against which to test each node in the node set identified by the preceeding node set can be evaluated.
        :EVT_FILTER_INVTEST, 15017,
        # MessageId: ERROR_EVT_FILTER_INVTYPE
        # MessageText:
        # This data type is currently unsupported.
        :EVT_FILTER_INVTYPE, 15018,
        # MessageId: ERROR_EVT_FILTER_PARSEERR
        # MessageText:
        # A syntax error occurred at position %1!d!
        :EVT_FILTER_PARSEERR, 15019,
        # MessageId: ERROR_EVT_FILTER_UNSUPPORTEDOP
        # MessageText:
        # This operator is unsupported by this implementation of the filter.
        :EVT_FILTER_UNSUPPORTEDOP, 15020,
        # MessageId: ERROR_EVT_FILTER_UNEXPECTEDTOKEN
        # MessageText:
        # The token encountered was unexpected.
        :EVT_FILTER_UNEXPECTEDTOKEN, 15021,
        # MessageId: ERROR_EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL
        # MessageText:
        # The requested operation cannot be performed over an enabled direct channel. The channel must first be disabled before performing the requested operation.
        :EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL, 15022,
        # MessageId: ERROR_EVT_INVALID_CHANNEL_PROPERTY_VALUE
        # MessageText:
        # Channel property %1!s! contains invalid value. The value has invalid type, is outside of valid range, can't be updated or is not supported by this type of channel.
        :EVT_INVALID_CHANNEL_PROPERTY_VALUE, 15023,
        # MessageId: ERROR_EVT_INVALID_PUBLISHER_PROPERTY_VALUE
        # MessageText:
        # Publisher property %1!s! contains invalid value. The value has invalid type, is outside of valid range, can't be updated or is not supported by this type of publisher.
        :EVT_INVALID_PUBLISHER_PROPERTY_VALUE, 15024,
        # MessageId: ERROR_EVT_CHANNEL_CANNOT_ACTIVATE
        # MessageText:
        # The channel fails to activate.
        :EVT_CHANNEL_CANNOT_ACTIVATE, 15025,
        # MessageId: ERROR_EVT_FILTER_TOO_COMPLEX
        # MessageText:
        # The xpath expression exceeded supported complexity. Please symplify it or split it into two or more simple expressions.
        :EVT_FILTER_TOO_COMPLEX, 15026,
        # MessageId: ERROR_EVT_MESSAGE_NOT_FOUND
        # MessageText:
        # the message resource is present but the message is not found in the string/message table
        :EVT_MESSAGE_NOT_FOUND, 15027,
        # MessageId: ERROR_EVT_MESSAGE_ID_NOT_FOUND
        # MessageText:
        # The message id for the desired message could not be found.
        :EVT_MESSAGE_ID_NOT_FOUND, 15028,
        # MessageId: ERROR_EVT_UNRESOLVED_VALUE_INSERT
        # MessageText:
        # The substitution string for insert index (%1) could not be found.
        :EVT_UNRESOLVED_VALUE_INSERT, 15029,
        # MessageId: ERROR_EVT_UNRESOLVED_PARAMETER_INSERT
        # MessageText:
        # The description string for parameter reference (%1) could not be found.
        :EVT_UNRESOLVED_PARAMETER_INSERT, 15030,
        # MessageId: ERROR_EVT_MAX_INSERTS_REACHED
        # MessageText:
        # The maximum number of replacements has been reached.
        :EVT_MAX_INSERTS_REACHED, 15031,
        # MessageId: ERROR_EVT_EVENT_DEFINITION_NOT_FOUND
        # MessageText:
        # The event definition could not be found for event id (%1).
        :EVT_EVENT_DEFINITION_NOT_FOUND, 15032,
        # MessageId: ERROR_EVT_MESSAGE_LOCALE_NOT_FOUND
        # MessageText:
        # The locale specific resource for the desired message is not present.
        :EVT_MESSAGE_LOCALE_NOT_FOUND, 15033,
        # MessageId: ERROR_EVT_VERSION_TOO_OLD
        # MessageText:
        # The resource is too old to be compatible.
        :EVT_VERSION_TOO_OLD, 15034,
        # MessageId: ERROR_EVT_VERSION_TOO_NEW
        # MessageText:
        # The resource is too new to be compatible.
        :EVT_VERSION_TOO_NEW, 15035,
        # MessageId: ERROR_EVT_CANNOT_OPEN_CHANNEL_OF_QUERY
        # MessageText:
        # The channel at index %1!d! of the query can't be opened.
        :EVT_CANNOT_OPEN_CHANNEL_OF_QUERY, 15036,
        # MessageId: ERROR_EVT_PUBLISHER_DISABLED
        # MessageText:
        # The publisher has been disabled and its resource is not available. This usually occurs when the publisher is in the process of being uninstalled or upgraded.
        :EVT_PUBLISHER_DISABLED, 15037,
        # MessageId: ERROR_EVT_FILTER_OUT_OF_RANGE
        # MessageText:
        # Attempted to create a numeric type that is outside of its valid range.
        :EVT_FILTER_OUT_OF_RANGE, 15038,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end