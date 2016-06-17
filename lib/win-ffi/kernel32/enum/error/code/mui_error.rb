module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Start of MUI Error codes 15100 to 15199  ===#
        # MessageId: ERROR_MUI_FILE_NOT_FOUND
        # MessageText:
        # The resource loader failed to find MUI file.
        :MUI_FILE_NOT_FOUND, 15100,    # MessageId: ERROR_MUI_INVALID_FILE
        # MessageText:
        # The resource loader failed to load MUI file because the file fail to pass validation.
        :MUI_INVALID_FILE, 15101,    # MessageId: ERROR_MUI_INVALID_RC_CONFIG
        # MessageText:
        # The RC Manifest is corrupted with garbage data or unsupported version or missing required item.
        :MUI_INVALID_RC_CONFIG, 15102,    # MessageId: ERROR_MUI_INVALID_LOCALE_NAME
        # MessageText:
        # The RC Manifest has invalid culture name.
        :MUI_INVALID_LOCALE_NAME, 15103,    # MessageId: ERROR_MUI_INVALID_ULTIMATEFALLBACK_NAME
        # MessageText:
        # The RC Manifest has invalid ultimatefallback name.
        :MUI_INVALID_ULTIMATEFALLBACK_NAME, 15104,    # MessageId: ERROR_MUI_FILE_NOT_LOADED
        # MessageText:
        # The resource loader cache doesn't have loaded MUI entry.
        :MUI_FILE_NOT_LOADED, 15105,    # MessageId: ERROR_RESOURCE_ENUM_USER_STOP
        # MessageText:
        # User stopped resource enumeration.
        :RESOURCE_ENUM_USER_STOP, 15106,
        # MessageId: ERROR_MUI_INTLSETTINGS_UILANG_NOT_INSTALLED
        # MessageText:
        # UI language installation failed.
        :MUI_INTLSETTINGS_UILANG_NOT_INSTALLED, 15107,
        # MessageId: ERROR_MUI_INTLSETTINGS_INVALID_LOCALE_NAME
        # MessageText:
        # Locale installation failed.
        :MUI_INTLSETTINGS_INVALID_LOCALE_NAME, 15108,
        # MessageId: ERROR_MRM_RUNTIME_NO_DEFAULT_OR_NEUTRAL_RESOURCE
        # MessageText:
        # A resource does not have default or neutral value.
        :MRM_RUNTIME_NO_DEFAULT_OR_NEUTRAL_RESOURCE, 15110,
        # MessageId: ERROR_MRM_INVALID_PRICONFIG
        # MessageText:
        # Invalid PRI config file.
        :MRM_INVALID_PRICONFIG, 15111,
        # MessageId: ERROR_MRM_INVALID_FILE_TYPE
        # MessageText:
        # Invalid file type.
        :MRM_INVALID_FILE_TYPE, 15112,
        # MessageId: ERROR_MRM_UNKNOWN_QUALIFIER
        # MessageText:
        # Unknown qualifier.
        :MRM_UNKNOWN_QUALIFIER, 15113,
        # MessageId: ERROR_MRM_INVALID_QUALIFIER_VALUE
        # MessageText:
        # Invalid qualifier value.
        :MRM_INVALID_QUALIFIER_VALUE, 15114,
        # MessageId: ERROR_MRM_NO_CANDIDATE
        # MessageText:
        # No Candidate found.
        :MRM_NO_CANDIDATE, 15115,
        # MessageId: ERROR_MRM_NO_MATCH_OR_DEFAULT_CANDIDATE
        # MessageText:
        # The ResourceMap or NamedResource has an item that does not have default or neutral resource..
        :MRM_NO_MATCH_OR_DEFAULT_CANDIDATE, 15116,
        # MessageId: ERROR_MRM_RESOURCE_TYPE_MISMATCH
        # MessageText:
        # Invalid ResourceCandidate type.
        :MRM_RESOURCE_TYPE_MISMATCH, 15117,
        # MessageId: ERROR_MRM_DUPLICATE_MAP_NAME
        # MessageText:
        # Duplicate Resource Map.
        :MRM_DUPLICATE_MAP_NAME, 15118,
        # MessageId: ERROR_MRM_DUPLICATE_ENTRY
        # MessageText:
        # Duplicate Entry.
        :MRM_DUPLICATE_ENTRY, 15119,
        # MessageId: ERROR_MRM_INVALID_RESOURCE_IDENTIFIER
        # MessageText:
        # Invalid Resource Identifier.
        :MRM_INVALID_RESOURCE_IDENTIFIER, 15120,
        # MessageId: ERROR_MRM_FILEPATH_TOO_LONG
        # MessageText:
        # Filepath too long.
        :MRM_FILEPATH_TOO_LONG, 15121,
        # MessageId: ERROR_MRM_UNSUPPORTED_DIRECTORY_TYPE
        # MessageText:
        # Unsupported directory type.
        :MRM_UNSUPPORTED_DIRECTORY_TYPE, 15122,
        # MessageId: ERROR_MRM_INVALID_PRI_FILE
        # MessageText:
        # Invalid PRI File.
        :MRM_INVALID_PRI_FILE, 15126,
        # MessageId: ERROR_MRM_NAMED_RESOURCE_NOT_FOUND
        # MessageText:
        # NamedResource Not Found.
        :MRM_NAMED_RESOURCE_NOT_FOUND, 15127,
        # MessageId: ERROR_MRM_MAP_NOT_FOUND
        # MessageText:
        # ResourceMap Not Found.
        :MRM_MAP_NOT_FOUND, 15135,
        # MessageId: ERROR_MRM_UNSUPPORTED_PROFILE_TYPE
        # MessageText:
        # Unsupported MRT profile type.
        :MRM_UNSUPPORTED_PROFILE_TYPE, 15136,
        # MessageId: ERROR_MRM_INVALID_QUALIFIER_OPERATOR
        # MessageText:
        # Invalid qualifier operator.
        :MRM_INVALID_QUALIFIER_OPERATOR, 15137,
        # MessageId: ERROR_MRM_INDETERMINATE_QUALIFIER_VALUE
        # MessageText:
        # Unable to determine qualifier value or qualifier value has not been set.
        :MRM_INDETERMINATE_QUALIFIER_VALUE, 15138,
        # MessageId: ERROR_MRM_AUTOMERGE_ENABLED
        # MessageText:
        # Automerge is enabled in the PRI file.
        :MRM_AUTOMERGE_ENABLED, 15139,
        # MessageId: ERROR_MRM_TOO_MANY_RESOURCES
        # MessageText:
        # Too many resources defined for package.
        :MRM_TOO_MANY_RESOURCES, 15140,
        # MessageId: ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_MERGE
        # MessageText:
        # Resource File can not be used for merge operation.
        :MRM_UNSUPPORTED_FILE_TYPE_FOR_MERGE, 15141,
        # MessageId: ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_LOAD_UNLOAD_PRI_FILE
        # MessageText:
        # Load/UnloadPriFiles cannot be used with resource packages.
        :MRM_UNSUPPORTED_FILE_TYPE_FOR_LOAD_UNLOAD_PRI_FILE, 15142,
        # MessageId: ERROR_MRM_NO_CURRENT_VIEW_ON_THREAD
        # MessageText:
        # Resource Contexts may not be created on threads that do not have a CoreWindow.
        :MRM_NO_CURRENT_VIEW_ON_THREAD, 15143,
        # MessageId: ERROR_DIFFERENT_PROFILE_RESOURCE_MANAGER_EXIST
        # MessageText:
        # The singleton Resource Manager with different profile is already created.
        :DIFFERENT_PROFILE_RESOURCE_MANAGER_EXIST, 15144,
        # MessageId: ERROR_OPERATION_NOT_ALLOWED_FROM_SYSTEM_COMPONENT
        # MessageText:
        # The system component cannot operate given API operation
        :OPERATION_NOT_ALLOWED_FROM_SYSTEM_COMPONENT, 15145,
        # MessageId: ERROR_MRM_DIRECT_REF_TO_NON_DEFAULT_RESOURCE
        # MessageText:
        # The resource is a direct reference to a non-default resource candidate.
        :MRM_DIRECT_REF_TO_NON_DEFAULT_RESOURCE, 15146,
        # MessageId: ERROR_MRM_GENERATION_COUNT_MISMATCH
        # MessageText:
        # Resource Map has been re-generated and the query string is not valid anymore.
        :MRM_GENERATION_COUNT_MISMATCH, 15147,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end