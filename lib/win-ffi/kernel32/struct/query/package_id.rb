require_relative 'package_version'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/appmodel/ns-appmodel-package_id
    class PACKAGE_ID < FFIAdditions::Struct
      attr_accessor :reserved,
                    :processorArchitecture,
                    :version,
                    :name,
                    :publisher,
                    :resourceId,
                    :publisherId

      layout reserved:              :uint32,
             processorArchitecture: :uint32,
             version:               PACKAGE_VERSION,
             name:                  :string,
             publisher:             :string,
             resourceId:            :string,
             publisherId:           :string
    end
  end
end