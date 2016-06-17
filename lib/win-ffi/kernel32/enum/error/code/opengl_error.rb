module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== OpenGL Error codes 2000 to 2009 ===#
        # MessageId: ERROR_INVALID_PIXEL_FORMAT
        # MessageText:
        # The pixel format is invalid.
        :INVALID_PIXEL_FORMAT, 2000,
        # MessageId: ERROR_BAD_DRIVER
        # MessageText:
        # The specified driver is invalid.
        :BAD_DRIVER, 2001,
        # MessageId: ERROR_INVALID_WINDOW_STYLE
        # MessageText:
        # The window style or class attribute is invalid for this operation.
        :INVALID_WINDOW_STYLE, 2002,
        # MessageId: ERROR_METAFILE_NOT_SUPPORTED
        # MessageText:
        # The requested metafile operation is not supported.
        :METAFILE_NOT_SUPPORTED, 2003,
        # MessageId: ERROR_TRANSFORM_NOT_SUPPORTED
        # MessageText:
        # The requested transformation operation is not supported.
        :TRANSFORM_NOT_SUPPORTED, 2004,
        # MessageId: ERROR_CLIPPING_NOT_SUPPORTED
        # MessageText:
        # The requested clipping operation is not supported.
        :CLIPPING_NOT_SUPPORTED, 2005,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end