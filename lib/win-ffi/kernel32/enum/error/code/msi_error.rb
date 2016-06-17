module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== MSI Error codes 1600 to 1699  ===#
        # MessageId: ERROR_INSTALL_SERVICE_FAILURE
        # MessageText:
        # The Windows Installer Service could not be accessed. This can occur if the Windows Installer is not correctly
        # installed. Contact your support personnel for assistance.
        :INSTALL_SERVICE_FAILURE, 1601,
        # MessageId: ERROR_INSTALL_USEREXIT
        # MessageText:
        # User cancelled installation.
        :INSTALL_USEREXIT, 1602,
        # MessageId: ERROR_INSTALL_FAILURE
        # MessageText:
        # Fatal error during installation.
        :INSTALL_FAILURE, 1603,
        # MessageId: ERROR_INSTALL_SUSPEND
        # MessageText:
        # Installation suspended, incomplete.
        :INSTALL_SUSPEND, 1604,
        # MessageId: ERROR_UNKNOWN_PRODUCT
        # MessageText:
        # This action is only valid for products that are currently installed.
        :UNKNOWN_PRODUCT, 1605,
        # MessageId: ERROR_UNKNOWN_FEATURE
        # MessageText:
        # Feature ID not registered.
        :UNKNOWN_FEATURE, 1606,
        # MessageId: ERROR_UNKNOWN_COMPONENT
        # MessageText:
        # Component ID not registered.
        :UNKNOWN_COMPONENT, 1607,
        # MessageId: ERROR_UNKNOWN_PROPERTY
        # MessageText:
        # Unknown property.
        :UNKNOWN_PROPERTY, 1608,
        # MessageId: ERROR_INVALID_HANDLE_STATE
        # MessageText:
        # Handle is in an invalid state.
        :INVALID_HANDLE_STATE, 1609,
        # MessageId: ERROR_BAD_CONFIGURATION
        # MessageText:
        # The configuration data for this product is corrupt. Contact your support personnel.
        :BAD_CONFIGURATION, 1610,
        # MessageId: ERROR_INDEX_ABSENT
        # MessageText:
        # Component qualifier not present.
        :INDEX_ABSENT, 1611,
        # MessageId: ERROR_INSTALL_SOURCE_ABSENT
        # MessageText:
        # The installation source for this product is not available. Verify that the source exists and that you can
        # access it.
        :INSTALL_SOURCE_ABSENT, 1612,
        # MessageId: ERROR_INSTALL_PACKAGE_VERSION
        # MessageText:
        # This installation package cannot be installed by the Windows Installer service. You must install a Windows
        # service pack that contains a newer version of the Windows Installer service.
        :INSTALL_PACKAGE_VERSION, 1613,
        # MessageId: ERROR_PRODUCT_UNINSTALLED
        # MessageText:
        # Product is uninstalled.
        :PRODUCT_UNINSTALLED, 1614,
        # MessageId: ERROR_BAD_QUERY_SYNTAX
        # MessageText:
        # SQL query syntax invalid or unsupported.
        :BAD_QUERY_SYNTAX, 1615,
        # MessageId: ERROR_INVALID_FIELD
        # MessageText:
        # Record field does not exist.
        :INVALID_FIELD, 1616,
        # MessageId: ERROR_DEVICE_REMOVED
        # MessageText:
        # The device has been removed.
        :DEVICE_REMOVED, 1617,
        # MessageId: ERROR_INSTALL_ALREADY_RUNNING
        # MessageText:
        # Another installation is already in progress. Complete that installation before proceeding with this install.
        :INSTALL_ALREADY_RUNNING, 1618,
        # MessageId: ERROR_INSTALL_PACKAGE_OPEN_FAILED
        # MessageText:
        # This installation package could not be opened. Verify that the package exists and that you can access it, or
        # contact the application vendor to verify that this is a valid Windows Installer package.
        :INSTALL_PACKAGE_OPEN_FAILED, 1619,
        # MessageId: ERROR_INSTALL_PACKAGE_INVALID
        # MessageText:
        # This installation package could not be opened. Contact the application vendor to verify that this is a valid
        # Windows Installer package.
        :INSTALL_PACKAGE_INVALID, 1620,
        # MessageId: ERROR_INSTALL_UI_FAILURE
        # MessageText:
        # There was an error starting the Windows Installer service user interface. Contact your support personnel.
        :INSTALL_UI_FAILURE, 1621,
        # MessageId: ERROR_INSTALL_LOG_FAILURE
        # MessageText:
        # Error opening installation log file. Verify that the specified log file location exists and that you can write
        # to it.
        :INSTALL_LOG_FAILURE, 1622,
        # MessageId: ERROR_INSTALL_LANGUAGE_UNSUPPORTED
        # MessageText:
        # The language of this installation package is not supported by your system.
        :INSTALL_LANGUAGE_UNSUPPORTED, 1623,
        # MessageId: ERROR_INSTALL_TRANSFORM_FAILURE
        # MessageText:
        # Error applying transforms. Verify that the specified transform paths are valid.
        :INSTALL_TRANSFORM_FAILURE, 1624,
        # MessageId: ERROR_INSTALL_PACKAGE_REJECTED
        # MessageText:
        # This installation is forbidden by system policy. Contact your system administrator.
        :INSTALL_PACKAGE_REJECTED, 1625,
        # MessageId: ERROR_FUNCTION_NOT_CALLED
        # MessageText:
        # Function could not be executed.
        :FUNCTION_NOT_CALLED, 1626,
        # MessageId: ERROR_FUNCTION_FAILED
        # MessageText:
        # Function failed during execution.
        :FUNCTION_FAILED, 1627,
        # MessageId: ERROR_INVALID_TABLE
        # MessageText:
        # Invalid or unknown table specified.
        :INVALID_TABLE, 1628,
        # MessageId: ERROR_DATATYPE_MISMATCH
        # MessageText:
        # Data supplied is of wrong type.
        :DATATYPE_MISMATCH, 1629,
        # MessageId: ERROR_UNSUPPORTED_TYPE
        # MessageText:
        # Data of this type is not supported.
        :UNSUPPORTED_TYPE, 1630,
        # MessageId: ERROR_CREATE_FAILED
        # MessageText:
        # The Windows Installer service failed to start. Contact your support personnel.
        :CREATE_FAILED, 1631,
        # MessageId: ERROR_INSTALL_TEMP_UNWRITABLE
        # MessageText:
        # The Temp folder is on a drive that is full or is inaccessible. Free up space on the drive or verify that you
        # have write permission on the Temp folder.
        :INSTALL_TEMP_UNWRITABLE, 1632,
        # MessageId: ERROR_INSTALL_PLATFORM_UNSUPPORTED
        # MessageText:
        # This installation package is not supported by this processor type. Contact your product vendor.
        :INSTALL_PLATFORM_UNSUPPORTED, 1633,
        # MessageId: ERROR_INSTALL_NOTUSED
        # MessageText:
        # Component not used on this computer.
        :INSTALL_NOTUSED, 1634,
        # MessageId: ERROR_PATCH_PACKAGE_OPEN_FAILED
        # MessageText:
        # This update package could not be opened. Verify that the update package exists and that you can access it, or
        # contact the application vendor to verify that this is a valid Windows Installer update package.
        :PATCH_PACKAGE_OPEN_FAILED, 1635,
        # MessageId: ERROR_PATCH_PACKAGE_INVALID
        # MessageText:
        # This update package could not be opened. Contact the application vendor to verify that this is a valid Windows
        # Installer update package.
        :PATCH_PACKAGE_INVALID, 1636,
        # MessageId: ERROR_PATCH_PACKAGE_UNSUPPORTED
        # MessageText:
        # This update package cannot be processed by the Windows Installer service. You must install a Windows service
        # pack that contains a newer version of the Windows Installer service.
        :PATCH_PACKAGE_UNSUPPORTED, 1637,
        # MessageId: ERROR_PRODUCT_VERSION
        # MessageText:
        # Another version of this product is already installed. Installation of this version cannot continue. To
        # configure or remove the existing version of this product, use Add/Remove Programs on the Control Panel.
        :PRODUCT_VERSION, 1638,
        # MessageId: ERROR_INVALID_COMMAND_LINE
        # MessageText:
        # Invalid command line argument. Consult the Windows Installer SDK for detailed command line help.
        :INVALID_COMMAND_LINE, 1639,
        # MessageId: ERROR_INSTALL_REMOTE_DISALLOWED
        # MessageText:
        # Only administrators have permission to add, remove, or configure server software during a Terminal services
        # remote session. If you want to install or configure software on the server, contact your network administrator
        :INSTALL_REMOTE_DISALLOWED, 1640,
        # MessageId: ERROR_SUCCESS_REBOOT_INITIATED
        # MessageText:
        # The requested operation completed successfully. The system will be restarted so the changes can take effect.
        :SUCCESS_REBOOT_INITIATED, 1641,
        # MessageId: ERROR_PATCH_TARGET_NOT_FOUND
        # MessageText:
        # The upgrade cannot be installed by the Windows Installer service because the program to be upgraded may be
        # missing, or the upgrade may update a different version of the program. Verify that the program to be upgraded
        # exists on your computer and that you have the correct upgrade.
        :PATCH_TARGET_NOT_FOUND, 1642,
        # MessageId: ERROR_PATCH_PACKAGE_REJECTED
        # MessageText:
        # The update package is not permitted by software restriction policy.
        :PATCH_PACKAGE_REJECTED, 1643,
        # MessageId: ERROR_INSTALL_TRANSFORM_REJECTED
        # MessageText:
        # One or more customizations are not permitted by software restriction policy.
        :INSTALL_TRANSFORM_REJECTED, 1644,
        # MessageId: ERROR_INSTALL_REMOTE_PROHIBITED
        # MessageText:
        # The Windows Installer does not permit installation from a Remote Desktop Connection.
        :INSTALL_REMOTE_PROHIBITED, 1645,
        # MessageId: ERROR_PATCH_REMOVAL_UNSUPPORTED
        # MessageText:
        # Uninstallation of the update package is not supported.
        :PATCH_REMOVAL_UNSUPPORTED, 1646,
        # MessageId: ERROR_UNKNOWN_PATCH
        # MessageText:
        # The update is not applied to this product.
        :UNKNOWN_PATCH, 1647,
        # MessageId: ERROR_PATCH_NO_SEQUENCE
        # MessageText:
        # No valid sequence could be found for the set of updates.
        :PATCH_NO_SEQUENCE, 1648,
        # MessageId: ERROR_PATCH_REMOVAL_DISALLOWED
        # MessageText:
        # Update removal was disallowed by policy.
        :PATCH_REMOVAL_DISALLOWED, 1649,
        # MessageId: ERROR_INVALID_PATCH_XML
        # MessageText:
        # The XML update data is invalid.
        :INVALID_PATCH_XML, 1650,
        # MessageId: ERROR_PATCH_MANAGED_ADVERTISED_PRODUCT
        # MessageText:
        # Windows Installer does not permit updating of managed advertised products. At least one feature of the product must be installed before applying the update.
        :PATCH_MANAGED_ADVERTISED_PRODUCT, 1651,
        # MessageId: ERROR_INSTALL_SERVICE_SAFEBOOT
        # MessageText:
        # The Windows Installer service is not accessible in Safe Mode. Please try again when your computer is not in Safe Mode or you can use System Restore to return your machine to a previous good state.
        :INSTALL_SERVICE_SAFEBOOT, 1652,
        # MessageId: ERROR_FAIL_FAST_EXCEPTION
        # MessageText:
        # A fail fast exception occurred. Exception handlers will not be invoked and the process will be terminated immediately.
        :FAIL_FAST_EXCEPTION, 1653,
        # MessageId: ERROR_INSTALL_REJECTED
        # MessageText:
        # The app that you are trying to run is not supported on this version of Windows.
        :INSTALL_REJECTED, 1654,
        # MessageId: ERROR_DYNAMIC_CODE_BLOCKED
        # MessageText:
        # The operation was blocked as the process prohibits dynamic code generation.
        :DYNAMIC_CODE_BLOCKED, 1655,
        # MessageId: ERROR_NOT_SAME_OBJECT
        # MessageText:
        # The objects are not identical.
        :NOT_SAME_OBJECT, 1656,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end