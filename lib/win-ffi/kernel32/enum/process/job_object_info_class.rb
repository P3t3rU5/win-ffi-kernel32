require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    JobObjectInfoClass = enum :job_object_info_class, [
        :BasicAccountingInformation, 1,
        :BasicLimitInformation,
        :BasicProcessIdList,
        :BasicUIRestrictions,
        :SecurityLimitInformation,  # deprecated
        :EndOfJobTimeInformation,
        :AssociateCompletionPortInformation,
        :BasicAndIoAccountingInformation,
        :ExtendedLimitInformation,
        :JobSetInformation,
        :GroupInformation,
        :NotificationLimitInformation,
        :LimitViolationInformation,
        :GroupInformationEx,
        :CpuRateControlInformation,
        :CompletionFilter,
        :CompletionCounter,
        :Reserved1Information, 18,
        :Reserved2Information,
        :Reserved3Information,
        :Reserved4Information,
        :Reserved5Information,
        :Reserved6Information,
        :Reserved7Information,
        :Reserved8Information,
        :Reserved9Information,
        :Reserved10Information,
        :Reserved11Information,
        :Reserved12Information,
        :Reserved13Information,
        :Reserved14Information,
        :NetRateControlInformation,
        :NotificationLimitInformation2,
        :LimitViolationInformation2,
        :CreateSilo,
        :SiloBasicInformation,
        :SiloRootDirectory,
        :ServerSiloBasicInformation,
        :ServerSiloServiceSessionId,
        :ServerSiloInitialize,
        :ServerSiloDefaultCompartmentId,
        :Max
    ]
  end
end