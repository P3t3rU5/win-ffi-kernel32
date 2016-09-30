require 'win-ffi/kernel32/struct/query/package_version'

module WinFFI
  module Kernel32
    class PACKAGE_ID < FFIAdditions::Struct
      layout reserved:              :uint32,
             processorArchitecture: :uint32,
             version:       PACKAGE_VERSION,
             name:                  :string,
             publisher:             :string,
             resourceId:            :string,
             publisherId:           :string,
    end
  end
end