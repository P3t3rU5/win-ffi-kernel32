require_relative '../../constant/language'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnls/ns-winnls-cpinfo
    class CPINFO < FFIAdditions::Struct
      attr_accessor :MaxCharSize, :DefaultChar, :LeadByte

      layout MaxCharSize: :uint,
             DefaultChar: [:byte, MAX_DEFAULTCHAR],
             LeadByte:    [:byte, MAX_LEADBYTES]
    end
  end
end