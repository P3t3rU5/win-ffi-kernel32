module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Reparse Point Error codes 4390 to 4399 ===#
        # MessageId: ERROR_NOT_A_REPARSE_POINT
        # MessageText:
        # The file or directory is not a reparse point.
        :NOT_A_REPARSE_POINT, 4390,
        # MessageId: ERROR_REPARSE_ATTRIBUTE_CONFLICT
        # MessageText:
        # The reparse point attribute cannot be set because it conflicts with an existing attribute.
        :REPARSE_ATTRIBUTE_CONFLICT, 4391,
        # MessageId: ERROR_INVALID_REPARSE_DATA
        # MessageText:
        # The data present in the reparse point buffer is invalid.
        :INVALID_REPARSE_DATA, 4392,
        # MessageId: ERROR_REPARSE_TAG_INVALID
        # MessageText:
        # The tag present in the reparse point buffer is invalid.
        :REPARSE_TAG_INVALID, 4393,
        # MessageId: ERROR_REPARSE_TAG_MISMATCH
        # MessageText:
        # There is a mismatch between the tag specified in the request and the tag present in the reparse point.
        :REPARSE_TAG_MISMATCH, 4394,
        # MessageId: ERROR_REPARSE_POINT_ENCOUNTERED
        # MessageText:
        # The object manager encountered a reparse point while retrieving an object.
        :REPARSE_POINT_ENCOUNTERED, 4395,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end