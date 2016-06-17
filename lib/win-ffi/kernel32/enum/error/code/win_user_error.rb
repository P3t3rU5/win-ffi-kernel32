module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== WinUser Error codes 1400 to 1499 ===#
        # MessageId: ERROR_INVALID_WINDOW_HANDLE
        # MessageText:
        # Invalid window handle.
        :INVALID_WINDOW_HANDLE, 1400,
        # MessageId: ERROR_INVALID_MENU_HANDLE
        # MessageText:
        # Invalid menu handle.
        :INVALID_MENU_HANDLE, 1401,
        # MessageId: ERROR_INVALID_CURSOR_HANDLE
        # MessageText:
        # Invalid cursor handle.
        :INVALID_CURSOR_HANDLE, 1402,
        # MessageId: ERROR_INVALID_ACCEL_HANDLE
        # MessageText:
        # Invalid accelerator table handle.
        :INVALID_ACCEL_HANDLE, 1403,
        # MessageId: ERROR_INVALID_HOOK_HANDLE
        # MessageText:
        # Invalid hook handle.
        :INVALID_HOOK_HANDLE, 1404,
        # MessageId: ERROR_INVALID_DWP_HANDLE
        # MessageText:
        # Invalid handle to a multiple-window position structure.
        :INVALID_DWP_HANDLE, 1405,
        # MessageId: ERROR_TLW_WITH_WSCHILD
        # MessageText:
        # Cannot create a top-level child window.
        :TLW_WITH_WSCHILD, 1406,
        # MessageId: ERROR_CANNOT_FIND_WND_CLASS
        # MessageText:
        # Cannot find window class.
        :CANNOT_FIND_WND_CLASS, 1407,
        # MessageId: ERROR_WINDOW_OF_OTHER_THREAD
        # MessageText:
        # Invalid window; it belongs to other thread.
        :WINDOW_OF_OTHER_THREAD, 1408,
        # MessageId: ERROR_HOTKEY_ALREADY_REGISTERED
        # MessageText:
        # Hot key is already registered.
        :HOTKEY_ALREADY_REGISTERED, 1409,
        # MessageId: ERROR_CLASS_ALREADY_EXISTS
        # MessageText:
        # Class already exists.
        :CLASS_ALREADY_EXISTS, 1410,
        # MessageId: ERROR_CLASS_DOES_NOT_EXIST
        # MessageText:
        # Class does not exist.
        :CLASS_DOES_NOT_EXIST, 1411,
        # MessageId: ERROR_CLASS_HAS_WINDOWS
        # MessageText:
        # Class still has open windows.
        :CLASS_HAS_WINDOWS, 1412,
        # MessageId: ERROR_INVALID_INDEX
        # MessageText:
        # Invalid index.
        :INVALID_INDEX, 1413,
        # MessageId: ERROR_INVALID_ICON_HANDLE
        # MessageText:
        # Invalid icon handle.
        :INVALID_ICON_HANDLE, 1414,
        # MessageId: ERROR_PRIVATE_DIALOG_INDEX
        # MessageText:
        # Using private DIALOG window words.
        :PRIVATE_DIALOG_INDEX, 1415,
        # MessageId: ERROR_LISTBOX_ID_NOT_FOUND
        # MessageText:
        # The list box identifier was not found.
        :LISTBOX_ID_NOT_FOUND, 1416,
        # MessageId: ERROR_NO_WILDCARD_CHARACTERS
        # MessageText:
        # No wildcards were found.
        :NO_WILDCARD_CHARACTERS, 1417,
        # MessageId: ERROR_CLIPBOARD_NOT_OPEN
        # MessageText:
        # Thread does not have a clipboard open.
        :CLIPBOARD_NOT_OPEN, 1418,
        # MessageId: ERROR_HOTKEY_NOT_REGISTERED
        # MessageText:
        # Hot key is not registered.
        :HOTKEY_NOT_REGISTERED, 1419,
        # MessageId: ERROR_WINDOW_NOT_DIALOG
        # MessageText:
        # The window is not a valid dialog window.
        :WINDOW_NOT_DIALOG, 1420,
        # MessageId: ERROR_CONTROL_ID_NOT_FOUND
        # MessageText:
        # Control ID not found.
        :CONTROL_ID_NOT_FOUND, 1421,
        # MessageId: ERROR_INVALID_COMBOBOX_MESSAGE
        # MessageText:
        # Invalid message for a combo box because it does not have an edit control.
        :INVALID_COMBOBOX_MESSAGE, 1422,
        # MessageId: ERROR_WINDOW_NOT_COMBOBOX
        # MessageText:
        # The window is not a combo box.
        :WINDOW_NOT_COMBOBOX, 1423,
        # MessageId: ERROR_INVALID_EDIT_HEIGHT
        # MessageText:
        # Height must be less than 256.
        :INVALID_EDIT_HEIGHT, 1424,
        # MessageId: ERROR_DC_NOT_FOUND
        # MessageText:
        # Invalid device context (DC) handle.
        :DC_NOT_FOUND, 1425,
        # MessageId: ERROR_INVALID_HOOK_FILTER
        # MessageText:
        # Invalid hook procedure type.
        :INVALID_HOOK_FILTER, 1426,
        # MessageId: ERROR_INVALID_FILTER_PROC
        # MessageText:
        # Invalid hook procedure.
        :INVALID_FILTER_PROC, 1427,
        # MessageId: ERROR_HOOK_NEEDS_HMOD
        # MessageText:
        # Cannot set nonlocal hook without a module handle.
        :HOOK_NEEDS_HMOD, 1428,
        # MessageId: ERROR_GLOBAL_ONLY_HOOK
        # MessageText:
        # This hook procedure can only be set globally.
        :GLOBAL_ONLY_HOOK, 1429,
        # MessageId: ERROR_JOURNAL_HOOK_SET
        # MessageText:
        # The journal hook procedure is already installed.
        :JOURNAL_HOOK_SET, 1430,
        # MessageId: ERROR_HOOK_NOT_INSTALLED
        # MessageText:
        # The hook procedure is not installed.
        :HOOK_NOT_INSTALLED, 1431,
        # MessageId: ERROR_INVALID_LB_MESSAGE
        # MessageText:
        # Invalid message for single-selection list box.
        :INVALID_LB_MESSAGE, 1432,
        # MessageId: ERROR_SETCOUNT_ON_BAD_LB
        # MessageText:
        # LB_SETCOUNT sent to non-lazy list box.
        :SETCOUNT_ON_BAD_LB, 1433,
        # MessageId: ERROR_LB_WITHOUT_TABSTOPS
        # MessageText:
        # This list box does not support tab stops.
        :LB_WITHOUT_TABSTOPS, 1434,
        # MessageId: ERROR_DESTROY_OBJECT_OF_OTHER_THREAD
        # MessageText:
        # Cannot destroy object created by another thread.
        :DESTROY_OBJECT_OF_OTHER_THREAD, 1435,
        # MessageId: ERROR_CHILD_WINDOW_MENU
        # MessageText:
        # Child windows cannot have menus.
        :CHILD_WINDOW_MENU, 1436,
        # MessageId: ERROR_NO_SYSTEM_MENU
        # MessageText:
        # The window does not have a system menu.
        :NO_SYSTEM_MENU, 1437,
        # MessageId: ERROR_INVALID_MSGBOX_STYLE
        # MessageText:
        # Invalid message box style.
        :INVALID_MSGBOX_STYLE, 1438,
        # MessageId: ERROR_INVALID_SPI_VALUE
        # MessageText:
        # Invalid system-wide (SPI_*) parameter.
        :INVALID_SPI_VALUE, 1439,
        # MessageId: ERROR_SCREEN_ALREADY_LOCKED
        # MessageText:
        # Screen already locked.
        :SCREEN_ALREADY_LOCKED, 1440,
        # MessageId: ERROR_HWNDS_HAVE_DIFF_PARENT
        # MessageText:
        # All handles to windows in a multiple-window position structure must have the same parent.
        :HWNDS_HAVE_DIFF_PARENT, 1441,
        # MessageId: ERROR_NOT_CHILD_WINDOW
        # MessageText:
        # The window is not a child window.
        :NOT_CHILD_WINDOW, 1442,
        # MessageId: ERROR_INVALID_GW_COMMAND
        # MessageText:
        # Invalid GW_* command.
        :INVALID_GW_COMMAND, 1443,
        # MessageId: ERROR_INVALID_THREAD_ID
        # MessageText:
        # Invalid thread identifier.
        :INVALID_THREAD_ID, 1444,
        # MessageId: ERROR_NON_MDICHILD_WINDOW
        # MessageText:
        # Cannot process a message from a window that is not a multiple document interface (MDI) window.
        :NON_MDICHILD_WINDOW, 1445,
        # MessageId: ERROR_POPUP_ALREADY_ACTIVE
        # MessageText:
        # Popup menu already active.
        :POPUP_ALREADY_ACTIVE, 1446,
        # MessageId: ERROR_NO_SCROLLBARS
        # MessageText:
        # The window does not have scroll bars.
        :NO_SCROLLBARS, 1447,
        # MessageId: ERROR_INVALID_SCROLLBAR_RANGE
        # MessageText:
        # Scroll bar range cannot be greater than MAXLONG.
        :INVALID_SCROLLBAR_RANGE, 1448,
        # MessageId: ERROR_INVALID_SHOWWIN_COMMAND
        # MessageText:
        # Cannot show or remove the window in the way specified.
        :INVALID_SHOWWIN_COMMAND, 1449,
        # MessageId: ERROR_NO_SYSTEM_RESOURCES
        # MessageText:
        # Insufficient system resources exist to complete the requested service.
        :NO_SYSTEM_RESOURCES, 1450,
        # MessageId: ERROR_NONPAGED_SYSTEM_RESOURCES
        # MessageText:
        # Insufficient system resources exist to complete the requested service.
        :NONPAGED_SYSTEM_RESOURCES, 1451,
        # MessageId: ERROR_PAGED_SYSTEM_RESOURCES
        # MessageText:
        # Insufficient system resources exist to complete the requested service.
        :PAGED_SYSTEM_RESOURCES, 1452,
        # MessageId: ERROR_WORKING_SET_QUOTA
        # MessageText:
        # Insufficient quota to complete the requested service.
        :WORKING_SET_QUOTA, 1453,
        # MessageId: ERROR_PAGEFILE_QUOTA
        # MessageText:
        # Insufficient quota to complete the requested service.
        :PAGEFILE_QUOTA, 1454,
        # MessageId: ERROR_COMMITMENT_LIMIT
        # MessageText:
        # The paging file is too small for this operation to complete.
        :COMMITMENT_LIMIT, 1455,
        # MessageId: ERROR_MENU_ITEM_NOT_FOUND
        # MessageText:
        # A menu item was not found.
        :MENU_ITEM_NOT_FOUND, 1456,
        # MessageId: ERROR_INVALID_KEYBOARD_HANDLE
        # MessageText:
        # Invalid keyboard layout handle.
        :INVALID_KEYBOARD_HANDLE, 1457,
        # MessageId: ERROR_HOOK_TYPE_NOT_ALLOWED
        # MessageText:
        # Hook type not allowed.
        :HOOK_TYPE_NOT_ALLOWED, 1458,
        # MessageId: ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION
        # MessageText:
        # This operation requires an interactive window station.
        :REQUIRES_INTERACTIVE_WINDOWSTATION, 1459,
        # MessageId: ERROR_TIMEOUT
        # MessageText:
        # This operation returned because the timeout period expired.
        :TIMEOUT, 1460,
        # MessageId: ERROR_INVALID_MONITOR_HANDLE
        # MessageText:
        # Invalid monitor handle.
        :INVALID_MONITOR_HANDLE, 1461,
        # MessageId: ERROR_INCORRECT_SIZE
        # MessageText:
        # Incorrect size argument.
        :INCORRECT_SIZE, 1462,
        # MessageId: ERROR_SYMLINK_CLASS_DISABLED
        # MessageText:
        # The symbolic link cannot be followed because its type is disabled.
        :SYMLINK_CLASS_DISABLED, 1463,
        # MessageId: ERROR_SYMLINK_NOT_SUPPORTED
        # MessageText:
        # This application does not support the current operation on symbolic links.
        :SYMLINK_NOT_SUPPORTED, 1464,
        # MessageId: ERROR_XML_PARSE_ERROR
        # MessageText:
        # Windows was unable to parse the requested XML data.
        :XML_PARSE_ERROR, 1465,
        # MessageId: ERROR_XMLDSIG_ERROR
        # MessageText:
        # An error was encountered while processing an XML digital signature.
        :XMLDSIG_ERROR, 1466,
        # MessageId: ERROR_RESTART_APPLICATION
        # MessageText:
        # This application must be restarted.
        :RESTART_APPLICATION, 1467,
        # MessageId: ERROR_WRONG_COMPARTMENT
        # MessageText:
        # The caller made the connection request in the wrong routing compartment.
        :WRONG_COMPARTMENT, 1468,
        # MessageId: ERROR_AUTHIP_FAILURE
        # MessageText:
        # There was an AuthIP failure when attempting to connect to the remote host.
        :AUTHIP_FAILURE, 1469,
        # MessageId: ERROR_NO_NVRAM_RESOURCES
        # MessageText:
        # Insufficient NVRAM resources exist to complete the requested service. A reboot might be required.
        :NO_NVRAM_RESOURCES, 1470,
        # MessageId: ERROR_NOT_GUI_PROCESS
        # MessageText:
        # Unable to finish the requested operation because the specified process is not a GUI process.
        :NOT_GUI_PROCESS, 1471,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end