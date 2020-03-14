module WinFFI
  module Kernel32
    HeapFlag32 = enum :heap_flag_32, [:DEFAULT, 1, :SHARED, 2]

    define_prefix(:HF32, HeapFlag32)
  end
end