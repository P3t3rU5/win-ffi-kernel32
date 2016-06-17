require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    WorkerThread = enum :worker_thread, [
        :EXECUTEDEFAULT,              0x00000000,
        :EXECUTEINIOTHREAD,           0x00000001,
        :EXECUTEINUITHREAD,           0x00000002,
        :EXECUTEINWAITTHREAD,         0x00000004,
        :EXECUTEONLYONCE,             0x00000008,
        :EXECUTEINTIMERTHREAD,        0x00000020,
        :EXECUTELONGFUNCTION,         0x00000010,
        :EXECUTEINPERSISTENTIOTHREAD, 0x00000040,
        :EXECUTEINPERSISTENTTHREAD,   0x00000080,
        :TRANSFER_IMPERSONATION,      0x00000100
    ]
  end

end
