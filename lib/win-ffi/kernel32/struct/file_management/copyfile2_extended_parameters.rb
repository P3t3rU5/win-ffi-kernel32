require 'win-ffi/kernel32/struct/file_management/copyfile2_message'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh449407(v=vs.85).aspx
    # COPYFILE2_MESSAGE_ACTION CALLBACK CopyFile2ProgressRoutine(
    #   _In_     const COPYFILE2_MESSAGE *pMessage,
    #   _In_opt_       PVOID             pvCallbackContext)
    CopyFile2ProgressRoutine = callback 'CopyFile2ProgressRoutine', [COPYFILE2_MESSAGE.ptr(:in), :pointer], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh449411(v=vs.85).aspx
    class COPYFILE2_EXTENDED_PARAMETERS < FFIAdditions::Struct
      layout dwSize:                             :dword,
             dwCopyFlags:                        :dword,
             pfCancel:                         :pointer,
             pProgressRoutine: CopyFile2ProgressRoutine,
             pvCallbackContext:                :pointer
    end
  end
end