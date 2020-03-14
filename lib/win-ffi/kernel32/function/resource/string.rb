module WinFFI
  module Kernel32

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-lstrcata
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-lstrcatw
    # Warning  Do not use. Consider using StringCchCat instead.
    # @param [String] lpString1
    # @param [String] lpString2
    # @return [FFI::Pointer]
    def self.lstrcat(lpString1, lpString2) end
    encoded_function 'lstrcat', [:string, :string], :pointer

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-lstrcmp
    # @param [String] lpString1
    # @param [String] lpString2
    # @return [Integer]
    def self.lstrcmp(lpString1, lpString2) end
    attach_function 'lstrcmp', [:string, :string], :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-lstrcmpi
    # @param [String] lpString1
    # @param [String] lpString2
    # @return [Integer]
    def self.lstrcmpi(lpString1, lpString2) end
    attach_function 'lstrcmpi', [:string, :string], :int

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-lstrcpy
    # Warning  Do not use. Consider using StringCchCopy instead
    # @param [String] lpString1
    # @param [String] lpString2
    # @return [FFI::Pointer]
    def self.lstrcpy(lpString1, lpString2) end
    attach_function 'lstrcpy', [:string, :string], :pointer

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-lstrcpyn
    # Warning  Do not use. Consider using StringCchCopy instead.
    # @param [String] lpString1
    # @param [String] lpString2
    # @param [Integer] iMaxLength
    # @return [FFI::Pointer]
    def self.lstrcpyn(lpString1, lpString2, iMaxLength) end
    attach_function 'lstrcpyn', [:string, :string, :int], :pointer

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-lstrlen
    # @param [String] lpString
    # @return [Integer]
    def self.lstrlen(lpString) end
    attach_function 'lstrlen', [:string], :int
  end
end