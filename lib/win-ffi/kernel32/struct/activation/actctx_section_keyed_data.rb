require_relative 'actctx_section_keyed_data_assembly_metadata'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-actctx_section_keyed_data
    class ACTCTX_SECTION_KEYED_DATA < FFIAdditions::Struct
      attr_accessor :cbSize,
                  :ulDataFormatVersion,
                  :lpData,
                  :ulLength,
                  :lpSectionGlobalData,
                  :ulSectionGlobalDataLength,
                  :lpSectionBase,
                  :ulSectionTotalLength,
                  :hActCtx,
                  :ulAssemblyRosterIndex,
                  :ulFlags,
                  :AssemblyMetadata

      layout cbSize:                    :ulong,
             ulDataFormatVersion:       :ulong,
             lpData:                    :pointer,
             ulLength:                  :ulong,
             lpSectionGlobalData:       :pointer,
             ulSectionGlobalDataLength: :ulong,
             lpSectionBase:             :pointer,
             ulSectionTotalLength:      :pointer,
             hActCtx:                   :handle,
             ulAssemblyRosterIndex:     :ulong,
             ulFlags:                   :ulong,
             AssemblyMetadata:          ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA

      def initialize
        super
        self.cbSize = self.size
      end

      private :cbSize=
    end
  end
end