require 'win-ffi/kernel32'
module WinFFI
  module Kernel32
    def self.clear_error_buffer
      ErrorBuffer.clear
      remove_const :ErrorBuffer
    end
  end
end