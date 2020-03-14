module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/previous-versions/windows/desktop/api/oobenotification/nf-oobenotification-oobecomplete
    # BOOL WINAPI OOBEComplete(_Out_ PBOOL OOBEComplete)
    def self.OOBEComplete(oOBEComplete); end
    attach_function 'OOBEComplete', [:pointer], :bool
  end
end