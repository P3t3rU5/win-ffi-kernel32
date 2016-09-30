require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    PrivateNamespaceFlag = enum :private_namespace_flag, [
        :FLAG_DESTROY, 0x00000001
    ]

    define_prefix(:PRIVATE_NAMESPACE, PrivateNamespaceFlag)
  end
end