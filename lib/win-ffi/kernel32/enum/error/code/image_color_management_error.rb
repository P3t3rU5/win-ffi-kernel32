module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Image Color Management Error codes 2010 to 2049 ===#
        # MessageId: ERROR_INVALID_CMM
        # MessageText:
        # The specified color management module is invalid.
        :INVALID_CMM, 2010,
        # MessageId: ERROR_INVALID_PROFILE
        # MessageText:
        # The specified color profile is invalid.
        :INVALID_PROFILE, 2011,
        # MessageId: ERROR_TAG_NOT_FOUND
        # MessageText:
        # The specified tag was not found.
        :TAG_NOT_FOUND, 2012,
        # MessageId: ERROR_TAG_NOT_PRESENT
        # MessageText:
        # A required tag is not present.
        :TAG_NOT_PRESENT, 2013,
        # MessageId: ERROR_DUPLICATE_TAG
        # MessageText:
        # The specified tag is already present.
        :DUPLICATE_TAG, 2014,
        # MessageId: ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE
        # MessageText:
        # The specified color profile is not associated with the specified device.
        :PROFILE_NOT_ASSOCIATED_WITH_DEVICE, 2015,
        # MessageId: ERROR_PROFILE_NOT_FOUND
        # MessageText:
        # The specified color profile was not found.
        :PROFILE_NOT_FOUND, 2016,
        # MessageId: ERROR_INVALID_COLORSPACE
        # MessageText:
        # The specified color space is invalid.
        :INVALID_COLORSPACE, 2017,
        # MessageId: ERROR_ICM_NOT_ENABLED
        # MessageText:
        # Image Color Management is not enabled.
        :ICM_NOT_ENABLED, 2018,
        # MessageId: ERROR_DELETING_ICM_XFORM
        # MessageText:
        # There was an error while deleting the color transform.
        :DELETING_ICM_XFORM, 2019,
        # MessageId: ERROR_INVALID_TRANSFORM
        # MessageText:
        # The specified color transform is invalid.
        :INVALID_TRANSFORM, 2020,
        # MessageId: ERROR_COLORSPACE_MISMATCH
        # MessageText:
        # The specified transform does not match the bitmap's color space.
        :COLORSPACE_MISMATCH, 2021,
        # MessageId: ERROR_INVALID_COLORINDEX
        # MessageText:
        # The specified named color index is not present in the profile.
        :INVALID_COLORINDEX, 2022,
        # MessageId: ERROR_PROFILE_DOES_NOT_MATCH_DEVICE
        # MessageText:
        # The specified profile is intended for a device of a different type than the specified device.
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end