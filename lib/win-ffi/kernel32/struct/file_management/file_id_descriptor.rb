require 'win-ffi/core/struct/large_integer'
require 'win-ffi/core/struct/guid'

require_relative '../../enum/file_management/file_id_type'

module WinFFI
  module Kernel32
    class FILE_ID_128 < FFIAdditions::Struct
      attr_accessor :Identifier

      layout Identifier: [:byte, 16]
    end

    class FILE_ID_DESCRIPTOR_UNION < FFIAdditions::Union
      attr_accessor :FileId, :ObjectId,

      buffer = {
          FileId:   LARGE_INTEGER,
          ObjectId: GUID,
      }

      if WINDOWS_VERSION >= 8
        attr_accessor :ExtendedFileId

        buffer.merge({ExtendedFileId: FILE_ID_128})
      end

      layout buffer
    end

    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-file_id_descriptor
    class FILE_ID_DESCRIPTOR < FFIAdditions::Struct
      attr_accessor :dwSize, :Type, :u

      layout dwSize: :dword,
             Type:   FILE_ID_TYPE,
             u:      FILE_ID_DESCRIPTOR_UNION
    end
  end
end