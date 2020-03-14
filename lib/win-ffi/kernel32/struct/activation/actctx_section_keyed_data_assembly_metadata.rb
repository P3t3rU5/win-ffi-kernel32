module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-actctx_section_keyed_data
    class ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA < FFIAdditions::Struct
      attr_accessor :lpInformation,
                  :lpSectionBase,
                  :ulSectionLength,
                  :lpSectionGlobalDataBase,
                  :ulSectionGlobalDataLength

      layout lpInformation:             :pointer,
             lpSectionBase:             :pointer,
             ulSectionLength:           :ulong,
             lpSectionGlobalDataBase:   :pointer,
             ulSectionGlobalDataLength: :ulong
    end
  end
end