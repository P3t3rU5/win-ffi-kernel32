require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    QueryActctxFlag = enum :query_actctx_flag, [
        :USE_ACTIVE_ACTCTX, (0x00000004),
        :ACTCTX_IS_HMODULE, (0x00000008),
        :ACTCTX_IS_ADDRESS, (0x00000010),
        :NO_ADDREF,         (0x80000000),
    ]

    define_prefix(:QUERY_ACTCTX_FLAG, QueryActctxFlag)
  end
end