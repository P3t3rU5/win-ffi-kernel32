require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    FILE_ID_TYPE = enum :file_id_type, [
        :FileId,
        :ObjectId,
        :ExtendedFileId,
        :MaximumFileId
    ]

    define_suffix(:File, FILE_ID_TYPE, true)
  end
end