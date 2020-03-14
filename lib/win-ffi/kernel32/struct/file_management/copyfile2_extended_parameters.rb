require_relative 'copyfile2_message'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nc-winbase-pcopyfile2_progress_routine
    # COPYFILE2_MESSAGE_ACTION CALLBACK CopyFile2ProgressRoutine(
    #   _In_     const COPYFILE2_MESSAGE *pMessage,
    #   _In_opt_       PVOID             pvCallbackContext)
    CopyFile2ProgressRoutine = callback 'CopyFile2ProgressRoutine', [COPYFILE2_MESSAGE.ptr(:in), :pointer], :dword

    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-copyfile2_extended_parameters
    class COPYFILE2_EXTENDED_PARAMETERS < FFIAdditions::Struct
      attr_accessor :dwSize,
                    :dwCopyFlags,
                    :pfCancel,
                    :pProgressRoutine,
                    :pvCallbackContext

      layout dwSize:            :dword,
             dwCopyFlags:       :dword,
             pfCancel:          :pointer,
             pProgressRoutine:  CopyFile2ProgressRoutine,
             pvCallbackContext: :pointer
    end
  end
end