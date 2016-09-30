require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA < FFIAdditions::Struct
      layout lpInformation:           :pointer,
             lpSectionBase:           :pointer,
             ulSectionLength:           :ulong,
             lpSectionGlobalDataBase: :pointer,
             ulSectionGlobalDataLength: :ulong
    end
  end
end