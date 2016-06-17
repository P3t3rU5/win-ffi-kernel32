module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Start of GPIO error codes 15321 - 15340 ===#
        # MessageId: ERROR_SECONDARY_IC_PROVIDER_NOT_REGISTERED
        # MessageText:
        # The secondary interrupt controller instance that manages the specified interrupt is not registered.
        :SECONDARY_IC_PROVIDER_NOT_REGISTERED, 15321,
        # MessageId: ERROR_GPIO_CLIENT_INFORMATION_INVALID
        # MessageText:
        # The information supplied by the GPIO client driver is invalid.
        :GPIO_CLIENT_INFORMATION_INVALID, 15322,
        # MessageId: ERROR_GPIO_VERSION_NOT_SUPPORTED
        # MessageText:
        # The version specified by the GPIO client driver is not supported.
        :GPIO_VERSION_NOT_SUPPORTED, 15323,
        # MessageId: ERROR_GPIO_INVALID_REGISTRATION_PACKET
        # MessageText:
        # The registration packet supplied by the GPIO client driver is not valid.
        :GPIO_INVALID_REGISTRATION_PACKET, 15324,
        # MessageId: ERROR_GPIO_OPERATION_DENIED
        # MessageText:
        # The requested operation is not suppported for the specified handle.
        :GPIO_OPERATION_DENIED, 15325,
        # MessageId: ERROR_GPIO_INCOMPATIBLE_CONNECT_MODE
        # MessageText:
        # The requested connect mode conflicts with an existing mode on one or more of the specified pins.
        :GPIO_INCOMPATIBLE_CONNECT_MODE, 15326,
        # MessageId: ERROR_GPIO_INTERRUPT_ALREADY_UNMASKED
        # MessageText:
        # The interrupt requested to be unmasked is not masked.
        :GPIO_INTERRUPT_ALREADY_UNMASKED, 15327,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end