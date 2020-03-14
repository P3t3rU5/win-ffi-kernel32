module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/fileio/file-management-structures
    class FILE_SEGMENT_ELEMENT < FFIAdditions::Struct
      attr_accessor :Buffer, :Alignment

      layout Buffer:    :pointer,
             Alignment: :ulong_long
    end
  end
end