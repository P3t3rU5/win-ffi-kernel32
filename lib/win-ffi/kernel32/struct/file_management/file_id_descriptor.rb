require 'win-ffi/kernel32/enum/file_management/file_id_type'

require 'win-ffi/core/struct/large_integer'
require 'win-ffi/core/struct/guid'

module WinFFI
  module Kernel32
    class FILE_ID_128 < FFIAdditions::Struct
      layout Identifier: [:byte, 16]
    end

    class FILE_ID_DESCRIPTOR_UNION < FFIAdditions::Union
      buffer = [
          FileId: LARGE_INTEGER,
          ObjectId:        GUID,
      ]

      buffer += [ExtendedFileId: FILE_ID_128] if WINDOWS_VERSION >= 8

      layout buffer
    end

    class FILE_ID_DESCRIPTOR < FFIAdditions::Struct
      layout dwSize:     :dword,
             Type:          FILE_ID_TYPE,
             u: FILE_ID_DESCRIPTOR_UNION
    end
  end
end