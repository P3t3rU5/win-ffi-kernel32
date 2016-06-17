module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Appx StateManager Codes 15800-15840 ===#
        # MessageId: ERROR_STATE_LOAD_STORE_FAILED
        # MessageText:
        # Loading the state store failed.
        :STATE_LOAD_STORE_FAILED, 15800,
        # MessageId: ERROR_STATE_GET_VERSION_FAILED
        # MessageText:
        # Retrieving the state version for the application failed.
        :STATE_GET_VERSION_FAILED, 15801,
        # MessageId: ERROR_STATE_SET_VERSION_FAILED
        # MessageText:
        # Setting the state version for the application failed.
        :STATE_SET_VERSION_FAILED, 15802,
        # MessageId: ERROR_STATE_STRUCTURED_RESET_FAILED
        # MessageText:
        # Resetting the structured state of the application failed.
        :STATE_STRUCTURED_RESET_FAILED, 15803,
        # MessageId: ERROR_STATE_OPEN_CONTAINER_FAILED
        # MessageText:
        # State Manager failed to open the container.
        :STATE_OPEN_CONTAINER_FAILED, 15804,
        # MessageId: ERROR_STATE_CREATE_CONTAINER_FAILED
        # MessageText:
        # State Manager failed to create the container.
        :STATE_CREATE_CONTAINER_FAILED, 15805,
        # MessageId: ERROR_STATE_DELETE_CONTAINER_FAILED
        # MessageText:
        # State Manager failed to delete the container.
        :STATE_DELETE_CONTAINER_FAILED, 15806,
        # MessageId: ERROR_STATE_READ_SETTING_FAILED
        # MessageText:
        # State Manager failed to read the setting.
        :STATE_READ_SETTING_FAILED, 15807,
        # MessageId: ERROR_STATE_WRITE_SETTING_FAILED
        # MessageText:
        # State Manager failed to write the setting.
        :STATE_WRITE_SETTING_FAILED, 15808,
        # MessageId: ERROR_STATE_DELETE_SETTING_FAILED
        # MessageText:
        # State Manager failed to delete the setting.
        :STATE_DELETE_SETTING_FAILED, 15809,
        # MessageId: ERROR_STATE_QUERY_SETTING_FAILED
        # MessageText:
        # State Manager failed to query the setting.
        :STATE_QUERY_SETTING_FAILED, 15810,
        # MessageId: ERROR_STATE_READ_COMPOSITE_SETTING_FAILED
        # MessageText:
        # State Manager failed to read the composite setting.
        :STATE_READ_COMPOSITE_SETTING_FAILED, 15811,
        # MessageId: ERROR_STATE_WRITE_COMPOSITE_SETTING_FAILED
        # MessageText:
        # State Manager failed to write the composite setting.
        :STATE_WRITE_COMPOSITE_SETTING_FAILED, 15812,
        # MessageId: ERROR_STATE_ENUMERATE_CONTAINER_FAILED
        # MessageText:
        # State Manager failed to enumerate the containers.
        :STATE_ENUMERATE_CONTAINER_FAILED, 15813,
        # MessageId: ERROR_STATE_ENUMERATE_SETTINGS_FAILED
        # MessageText:
        # State Manager failed to enumerate the settings.
        :STATE_ENUMERATE_SETTINGS_FAILED, 15814,
        # MessageId: ERROR_STATE_COMPOSITE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED
        # MessageText:
        # The size of the state manager composite setting value has exceeded the limit.
        :STATE_COMPOSITE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED, 15815,
        # MessageId: ERROR_STATE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED
        # MessageText:
        # The size of the state manager setting value has exceeded the limit.
        :STATE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED, 15816,
        # MessageId: ERROR_STATE_SETTING_NAME_SIZE_LIMIT_EXCEEDED
        # MessageText:
        # The length of the state manager setting name has exceeded the limit.
        :STATE_SETTING_NAME_SIZE_LIMIT_EXCEEDED, 15817,
        # MessageId: ERROR_STATE_CONTAINER_NAME_SIZE_LIMIT_EXCEEDED
        # MessageText:
        # The length of the state manager container name has exceeded the limit.
        :STATE_CONTAINER_NAME_SIZE_LIMIT_EXCEEDED, 15818,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end