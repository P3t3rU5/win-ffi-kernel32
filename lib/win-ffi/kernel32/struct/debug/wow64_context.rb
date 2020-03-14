require_relative 'wow64_floating_save_area'

module WinFFI
  module Kernel32
    WOW64_MAXIMUM_SUPPORTED_EXTENSION = 512
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-wow64_context
    class WOW64_CONTEXT < FFIAdditions::Struct
      attr_accessor :ContextFlags,
                    :Dr0,
                    :Dr1,
                    :Dr2,
                    :Dr3,
                    :Dr6,
                    :Dr7,
                    :FloatSave,
                    :SegGs,
                    :SegFs,
                    :SegEs,
                    :SegDs,
                    :Edi,
                    :Esi,
                    :Ebx,
                    :Edx,
                    :Ecx,
                    :Eax,
                    :Ebp,
                    :Eip,
                    :SegCs,
                    :EFlags,
                    :Esp,
                    :SegSs,
                    :ExtendedRegisters

      layout ContextFlags:      :dword,
             Dr0:               :dword,
             Dr1:               :dword,
             Dr2:               :dword,
             Dr3:               :dword,
             Dr6:               :dword,
             Dr7:               :dword,
             FloatSave:         WOW64_FLOATING_SAVE_AREA,
             SegGs:             :dword,
             SegFs:             :dword,
             SegEs:             :dword,
             SegDs:             :dword,
             Edi:               :dword,
             Esi:               :dword,
             Ebx:               :dword,
             Edx:               :dword,
             Ecx:               :dword,
             Eax:               :dword,
             Ebp:               :dword,
             Eip:               :dword,
             SegCs:             :dword,
             EFlags:            :dword,
             Esp:               :dword,
             SegSs:             :dword,
             ExtendedRegisters: [:byte, WOW64_MAXIMUM_SUPPORTED_EXTENSION]
    end
  end
end