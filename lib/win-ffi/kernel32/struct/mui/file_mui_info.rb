module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnls/ns-winnls-filemuiinfo
    class FILEMUIINFO < FFIAdditions::Struct
      attr_accessor :dwSize,
                    :dwVersion,
                    :dwFileType,
                    :pChecksum,
                    :pServiceChecksum,
                    :dwLanguageNameOffset,
                    :dwTypeIDMainSize,
                    :dwTypeIDMainOffset,
                    :dwTypeNameMainOffset,
                    :dwTypeIDMUISize,
                    :dwTypeIDMUIOffset,
                    :dwTypeNameMUIOffset,
                    :abBuffer

      layout dwSize:               :dword,
             dwVersion:            :dword,
             dwFileType:           :dword,
             pChecksum:            [:byte, 16],
             pServiceChecksum:     [:byte, 16],
             dwLanguageNameOffset: :dword,
             dwTypeIDMainSize:     :dword,
             dwTypeIDMainOffset:   :dword,
             dwTypeNameMainOffset: :dword,
             dwTypeIDMUISize:      :dword,
             dwTypeIDMUIOffset:    :dword,
             dwTypeNameMUIOffset:  :dword,
             abBuffer:             [:byte, 8]

      def initialize
        super
        self[:dwSize] = self.size
      end

      def culture
        dwLanguageNameOffset > 0
      end

      def type_ids
        dwTypeIDMainOffset > 0
      end

      def main_type_id
        dwTypeIDMainSize
      end

      def mui_type_ids
        dwTypeIDMUIOffset > 0
      end

      def mui_type_id
        dwTypeIDMUISize && dwTypeIDMUIOffset > 0
      end

      def mui_type_names
        dwTypeNameMUIOffset > 0
      end

    end
  end
end