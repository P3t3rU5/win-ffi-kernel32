require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    FindActctxSectionKeyReturn = enum :find_actctx_section_key_return, [
        :HACTCTX,           (0x00000001),
        :FLAGS,             (0x00000002),
        :ASSEMBLY_METADATA, (0x00000004),
    ]

    define_prefix(:FIND_ACTCTX_SECTION_KEY_RETURN, FindActctxSectionKeyReturn)
  end
end