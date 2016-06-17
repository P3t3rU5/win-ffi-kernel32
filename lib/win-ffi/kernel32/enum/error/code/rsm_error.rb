module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== RSM (Media Services) Error codes 4300 to 4349 ===#
        # MessageId: ERROR_INVALID_MEDIA
        # MessageText:
        # The media identifier does not represent a valid medium.
        :INVALID_MEDIA, 4300,
        # MessageId: ERROR_INVALID_LIBRARY
        # MessageText:
        # The library identifier does not represent a valid library.
        :INVALID_LIBRARY, 4301,
        # MessageId: ERROR_INVALID_MEDIA_POOL
        # MessageText:
        # The media pool identifier does not represent a valid media pool.
        :INVALID_MEDIA_POOL, 4302,
        # MessageId: ERROR_DRIVE_MEDIA_MISMATCH
        # MessageText:
        # The drive and medium are not compatible or exist in different libraries.
        :DRIVE_MEDIA_MISMATCH, 4303,
        # MessageId: ERROR_MEDIA_OFFLINE
        # MessageText:
        # The medium currently exists in an offline library and must be online to perform this operation.
        :MEDIA_OFFLINE, 4304,
        # MessageId: ERROR_LIBRARY_OFFLINE
        # MessageText:
        # The operation cannot be performed on an offline library.
        :LIBRARY_OFFLINE, 4305,
        # MessageId: ERROR_EMPTY
        # MessageText:
        # The library, drive, or media pool is empty.
        :EMPTY, 4306,
        # MessageId: ERROR_NOT_EMPTY
        # MessageText:
        # The library, drive, or media pool must be empty to perform this operation.
        :NOT_EMPTY, 4307,
        # MessageId: ERROR_MEDIA_UNAVAILABLE
        # MessageText:
        # No media is currently available in this media pool or library.
        :MEDIA_UNAVAILABLE, 4308,
        # MessageId: ERROR_RESOURCE_DISABLED
        # MessageText:
        # A resource required for this operation is disabled.
        :RESOURCE_DISABLED, 4309,
        # MessageId: ERROR_INVALID_CLEANER
        # MessageText:
        # The media identifier does not represent a valid cleaner.
        :INVALID_CLEANER, 4310,
        # MessageId: ERROR_UNABLE_TO_CLEAN
        # MessageText:
        # The drive cannot be cleaned or does not support cleaning.
        :UNABLE_TO_CLEAN, 4311,
        # MessageId: ERROR_OBJECT_NOT_FOUND
        # MessageText:
        # The object identifier does not represent a valid object.
        :OBJECT_NOT_FOUND, 4312,
        # MessageId: ERROR_DATABASE_FAILURE
        # MessageText:
        # Unable to read from or write to the database.
        :DATABASE_FAILURE, 4313,
        # MessageId: ERROR_DATABASE_FULL
        # MessageText:
        # The database is full.
        :DATABASE_FULL, 4314,
        # MessageId: ERROR_MEDIA_INCOMPATIBLE
        # MessageText:
        # The medium is not compatible with the device or media pool.
        :MEDIA_INCOMPATIBLE, 4315,
        # MessageId: ERROR_RESOURCE_NOT_PRESENT
        # MessageText:
        # The resource required for this operation does not exist.
        :RESOURCE_NOT_PRESENT, 4316,
        # MessageId: ERROR_INVALID_OPERATION
        # MessageText:
        # The operation identifier is not valid.
        :INVALID_OPERATION, 4317,
        # MessageId: ERROR_MEDIA_NOT_AVAILABLE
        # MessageText:
        # The media is not mounted or ready for use.
        :MEDIA_NOT_AVAILABLE, 4318,
        # MessageId: ERROR_DEVICE_NOT_AVAILABLE
        # MessageText:
        # The device is not ready for use.
        :DEVICE_NOT_AVAILABLE, 4319,
        # MessageId: ERROR_REQUEST_REFUSED
        # MessageText:
        # The operator or administrator has refused the request.
        :REQUEST_REFUSED, 4320,
        # MessageId: ERROR_INVALID_DRIVE_OBJECT
        # MessageText:
        # The drive identifier does not represent a valid drive.
        :INVALID_DRIVE_OBJECT, 4321,
        # MessageId: ERROR_LIBRARY_FULL
        # MessageText:
        # Library is full. No slot is available for use.
        :LIBRARY_FULL, 4322,
        # MessageId: ERROR_MEDIUM_NOT_ACCESSIBLE
        # MessageText:
        # The transport cannot access the medium.
        :MEDIUM_NOT_ACCESSIBLE, 4323,
        # MessageId: ERROR_UNABLE_TO_LOAD_MEDIUM
        # MessageText:
        # Unable to load the medium into the drive.
        :UNABLE_TO_LOAD_MEDIUM, 4324,
        # MessageId: ERROR_UNABLE_TO_INVENTORY_DRIVE
        # MessageText:
        # Unable to retrieve the drive status.
        :UNABLE_TO_INVENTORY_DRIVE, 4325,
        # MessageId: ERROR_UNABLE_TO_INVENTORY_SLOT
        # MessageText:
        # Unable to retrieve the slot status.
        :UNABLE_TO_INVENTORY_SLOT, 4326,
        # MessageId: ERROR_UNABLE_TO_INVENTORY_TRANSPORT
        # MessageText:
        # Unable to retrieve status about the transport.
        :UNABLE_TO_INVENTORY_TRANSPORT, 4327,
        # MessageId: ERROR_TRANSPORT_FULL
        # MessageText:
        # Cannot use the transport because it is already in use.
        :TRANSPORT_FULL, 4328,
        # MessageId: ERROR_CONTROLLING_IEPORT
        # MessageText:
        # Unable to open or close the inject/eject port.
        :CONTROLLING_IEPORT, 4329,
        # MessageId: ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA
        # MessageText:
        # Unable to eject the medium because it is in a drive.
        :UNABLE_TO_EJECT_MOUNTED_MEDIA, 4330,
        # MessageId: ERROR_CLEANER_SLOT_SET
        # MessageText:
        # A cleaner slot is already reserved.
        :CLEANER_SLOT_SET, 4331,
        # MessageId: ERROR_CLEANER_SLOT_NOT_SET
        # MessageText:
        # A cleaner slot is not reserved.
        :CLEANER_SLOT_NOT_SET, 4332,
        # MessageId: ERROR_CLEANER_CARTRIDGE_SPENT
        # MessageText:
        # The cleaner cartridge has performed the maximum number of drive cleanings.
        :CLEANER_CARTRIDGE_SPENT, 4333,
        # MessageId: ERROR_UNEXPECTED_OMID
        # MessageText:
        # Unexpected on-medium identifier.
        :UNEXPECTED_OMID, 4334,
        # MessageId: ERROR_CANT_DELETE_LAST_ITEM
        # MessageText:
        # The last remaining item in this group or resource cannot be deleted.
        :CANT_DELETE_LAST_ITEM, 4335,
        # MessageId: ERROR_MESSAGE_EXCEEDS_MAX_SIZE
        # MessageText:
        # The message provided exceeds the maximum size allowed for this parameter.
        :MESSAGE_EXCEEDS_MAX_SIZE, 4336,
        # MessageId: ERROR_VOLUME_CONTAINS_SYS_FILES
        # MessageText:
        # The volume contains system or paging files.
        :VOLUME_CONTAINS_SYS_FILES, 4337,
        # MessageId: ERROR_INDIGENOUS_TYPE
        # MessageText:
        # The media type cannot be removed from this library since at least one drive in the library reports it can
        # support this media type.
        :INDIGENOUS_TYPE, 4338,
        # MessageId: ERROR_NO_SUPPORTING_DRIVES
        # MessageText:
        # This offline media cannot be mounted on this system since no enabled drives are present which can be used.
        :NO_SUPPORTING_DRIVES, 4339,
        # MessageId: ERROR_CLEANER_CARTRIDGE_INSTALLED
        # MessageText:
        # A cleaner cartridge is present in the tape library.
        :CLEANER_CARTRIDGE_INSTALLED, 4340,
        # MessageId: ERROR_IEPORT_FULL
        # MessageText:
        # Cannot use the inject/eject port because it is not empty.
        :IEPORT_FULL, 4341,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end