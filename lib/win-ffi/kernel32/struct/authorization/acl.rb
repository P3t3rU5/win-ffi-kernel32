require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class ACL < FFIAdditions::Struct
      layout AclRevision: :uchar,
             Sbz1:        :uchar,
             AclSize:    :ushort,
             AceCount:   :ushort,
             Sbz2:       :ushort
    end
  end
end