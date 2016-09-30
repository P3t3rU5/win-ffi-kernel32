require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/activation/actctx_section_keyed_data_assembly_metadata'

module WinFFI
  module Kernel32
    class ACTCTX_SECTION_KEYED_DATA < FFIAdditions::Struct
      layout cbSize:                                                :ulong,
             ulDataFormatVersion:                                   :ulong,
             lpData:                                              :pointer,
             ulLength:                                              :ulong,
             lpSectionGlobalData:                                 :pointer,
             ulSectionGlobalDataLength:                             :ulong,
             lpSectionBase:                                       :pointer,
             ulSectionTotalLength:                                :pointer,
             hActCtx:                                              :handle,
             ulAssemblyRosterIndex:                                 :ulong,
             ulFlags:                                               :ulong,
             AssemblyMetadata: ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA
    end
  end
end