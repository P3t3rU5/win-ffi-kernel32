module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Start of Wecsvc Error codes 15080 to 15099 ===#
        # MessageId: ERROR_EC_SUBSCRIPTION_CANNOT_ACTIVATE
        # MessageText:
        # The subscription fails to activate.
        :EC_SUBSCRIPTION_CANNOT_ACTIVATE, 15080,
        # MessageId: ERROR_EC_LOG_DISABLED
        # MessageText:
        # The log of the subscription is in disabled state, and can not be used to forward events to. The log must first be enabled before the subscription can be activated.
        :EC_LOG_DISABLED, 15081,
        # MessageId: ERROR_EC_CIRCULAR_FORWARDING
        # MessageText:
        # When forwarding events from local machine to itself, the query of the subscription can't contain target log of the subscription.
        :EC_CIRCULAR_FORWARDING, 15082,
        # MessageId: ERROR_EC_CREDSTORE_FULL
        # MessageText:
        # The credential store that is used to save credentials is full.
        :EC_CREDSTORE_FULL, 15083,
        # MessageId: ERROR_EC_CRED_NOT_FOUND
        # MessageText:
        # The credential used by this subscription can't be found in credential store.
        :EC_CRED_NOT_FOUND, 15084,
        # MessageId: ERROR_EC_NO_ACTIVE_CHANNEL
        # MessageText:
        # No active channel is found for the query.
        :EC_NO_ACTIVE_CHANNEL, 15085,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end