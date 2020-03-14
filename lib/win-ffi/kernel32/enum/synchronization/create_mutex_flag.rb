module WinFFI
  module Kernel32
    CreateMutexFlag = enum :create_mutex_flag, [:INITIAL_OWNER, 0x00000001]

    define_prefix(:CREATE_MUTEX, CreateMutexFlag)
  end
end