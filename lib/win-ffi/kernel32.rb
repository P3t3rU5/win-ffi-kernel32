require 'win-ffi/logger'
WinFFI::LOGGER.level = 'info'
require 'win-ffi/core'
require 'win-ffi/kernel32/base'
require_relative 'kernel32/version'

module WinFFI
  module Kernel32
    LOGGER.info "WinFFI Kernel32 v#{WinFFI::Kernel32::VERSION}"
  end
end
