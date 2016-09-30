require 'win-ffi/core'
require 'win-ffi/core/lib_base'

module WinFFI
  module Wofutil
    extend LibBase

    ffi_lib 'Wofutil'
  end
end