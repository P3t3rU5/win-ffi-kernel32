module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/ns-winnt-_acl
    class ACL < FFIAdditions::Struct
      attr_accessor :AclRevision,
                    :Sbz1,
                    :AclSize,
                    :AceCount,
                    :Sbz2

      layout AclRevision: :uchar,
             Sbz1:        :uchar,
             AclSize:     :ushort,
             AceCount:    :ushort,
             Sbz2:        :ushort
    end
  end
end