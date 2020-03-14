module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-addatoma
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-addatomw
    # @param [String] lpString
    # @return [ATOM]
    def self.AddAtom(lpString) end
    encoded_function 'AddAtom', [:string], :atom

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-deleteatom
    # @param [ATOM] nAtom
    # @return [ATOM]
    def self.DeleteAtom(nAtom) end
    attach_function 'DeleteAtom', [:atom], :atom

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findatoma
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findatomw
    # @param [String] lpString
    # @return [ATOM]
    def self.FindAtom(lpString) end
    encoded_function 'FindAtom', [:string], :atom

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getatomnamea
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getatomnamew
    # @param [ATOM] nAtom
    # @param [String] lpBuffer
    # @param [Integer] nSize
    # @return [Integer]
    def self.GetAtomName(nAtom, lpBuffer, nSize) end
    encoded_function 'GetAtomName', [:atom, :string, :int], :uint

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globaladdatoma
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globaladdatomw
    # @param [String] lpString
    # @return [ATOM]
    def self.GlobalAddAtom(lpString) end
    encoded_function 'GlobalAddAtom', [:string], :atom

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globaladdatomexa
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globaladdatomexw
    # @param [String] lpString
    # @param [Integer] flags
    # @return [ATOM]
    def self.GlobalAddAtomEx(lpString, flags) end
    encoded_function 'GlobalAddAtomEx', [:string, :dword], :atom

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globaldeleteatom
    # @param [ATOM] nAtom
    # @return [ATOM]
    def self.GlobalDeleteAtom(nAtom) end
    attach_function 'GlobalDeleteAtom', [:atom], :atom

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalfindatoma
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalfindatomw
    # @param [String] lpString
    # @return [ATOM]
    def self.GlobalFindAtom(lpString) end
    encoded_function 'GlobalFindAtom', [:string], :atom

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalgetatomnamea
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalgetatomnamew
    # @param [ATOM] nAtom
    # @param [String] lpBuffer
    # @param [Integer] nSize
    # @return [Integer]
    def self.GlobalGetAtomName(nAtom, lpBuffer, nSize) end
    encoded_function 'GlobalGetAtomName', [:atom, :string, :int], :uint

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-initatomtable
    # @param [Integer] nSize
    # @return [true, false]
    def self.InitAtomTable(nSize) end
    attach_function 'InitAtomTable', [:dword], :bool
  end
end
