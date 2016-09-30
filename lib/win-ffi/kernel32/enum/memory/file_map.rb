require 'win-ffi/kernel32'

# require 'section_all_access'

module WinFFI
  module Kernel32
    FileMap = enum :file_map, [
        :WRITE,      0x0002,
        :READ,       0x0004,
        # TODO
        # :ALL_ACCESS, SECTION_ALL_ACCESS,
        :EXECUTE,    0x0020, # not included in FILE_MAP_ALL_ACCESS
        :COPY,       0x00000001,
        :RESERVE,    0x80000000,

    ]
  end
end