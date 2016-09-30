require 'rspec'
require_relative '../test/test_helper'
require 'win-ffi/kernel32/function/system_info'
require 'win-ffi/kernel32/base'
require 'win-ffi/kernel32/function/error'
require 'win-ffi/core/macro/util'
require 'win-ffi/kernel32/macro/system_info'

include WinFFI

using WinFFI::StringUtils

describe 'SystemInfo' do
  describe 'Kernel32#GetComputerName' do
    it 'Should be dasp-side' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), Kernel32::MAX_COMPUTERNAME_LENGTH + 1) do |computer_name|
        FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |size|
          size.put_int32(0, 16)
          expect(Kernel32.GetComputerName(computer_name, size)).to be true
          expect(computer_name.read_array_of_uint16(size.read_int32).pack('U*')).to eq 'DASP-SIDE'
        end
      end
    end
  end

  # Kernel32#GetComputerNameEx

  # describe 'Kernel32#DnsHostnameToComputerName' do
  #   it 'should' do
  #     hostname = "www.google.com"
  #     FFI::MemoryPointer.new(WinFFI.find_type(:tchar), Kernel32::MAX_COMPUTERNAME_LENGTH + 1) do |computer_name|
  #       FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |size|
  #         size.put_int32(0, 16)
  #         expect(Kernel32.DnsHostnameToComputerName(hostname, computer_name, size)).to be true
  #         LOGGER.debug(Kernel32.GetLastError)
  #         # expect(computer_name.read_array_of_uint16(16).pack('U*').strip).to eq 'DASP-SIDE'
  #         LOGGER.debug(computer_name.read_array_of_uint16(size.read_int32).pack('U*'))
  #       end
  #     end
  #   end
  # end

  describe 'Kernel32#ExpandEnvironmentStrings' do
    it 'should be Windows_NT' do
      source = '%OS%'.to_w
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 20) do |destiny|
        size = Kernel32.ExpandEnvironmentStrings(source, destiny, 20)
        expect(destiny.read_array_of_uint16(size - 1).pack('U*')).to eq 'Windows_NT'
      end
    end

    it 'should not expand' do
      source = '%BLABLABLA%'.to_w
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 20) do |destiny|
        size = Kernel32.ExpandEnvironmentStrings(source, destiny, 20)
        expect(destiny.read_array_of_uint16(size - 1).pack('U*')).to eq '%BLABLABLA%'
      end
    end
  end

  describe 'Kernel32#GetSystemDirectory' do
    it 'should be C:\WINDOWS\system32' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 256) do |destination|
        expect(size = Kernel32.GetSystemDirectory(destination, 256)).not_to eq 0
        expect(destination.read_array_of_uint16(size).pack('U*')).to eq 'C:\WINDOWS\system32'
      end
    end
  end

  describe 'Kernel32#GetSystemInfo' do
    it '' do
      system_info = Kernel32::SYSTEM_INFO.new
      Kernel32.GetSystemInfo(system_info)
      expect(system_info).to be_a Kernel32::SYSTEM_INFO
    end
  end

  describe 'GetSystemWindowsDirectory' do
    it 'should be C:\WINDOWS' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 256) do |destination|
        expect(size = Kernel32.GetSystemWindowsDirectory(destination, 256)).not_to eq 0
        expect(destination.read_array_of_uint16(size).pack('U*')).to eq 'C:\WINDOWS'
      end
    end
  end

  describe 'GetVersion' do
    it 'should be a number' do
      expect(version = Kernel32.GetVersion).to be_a Numeric

      expect(WinFFI.LOBYTE(WinFFI.LOWORD(version))).to be_a Numeric
      expect(WinFFI.HIBYTE(WinFFI.LOWORD(version))).to be_a Numeric

      if version < 0x80000000
        expect( WinFFI.HIWORD(version)).to be_a Numeric
      end
    end
  end

  describe 'Kernel32#GetWindowsDirectory' do
    it 'should be C:\WINDOWS' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 256) do |destination|
        expect(size = Kernel32.GetWindowsDirectory(destination, 256)).not_to eq 0
        expect(destination.read_array_of_uint16(size).pack('U*')).to eq 'C:\WINDOWS'
      end
    end
  end

  describe 'IsProcessorFeaturePresent' do
    it 'should check the processor features' do
      Kernel32::ProcessorFeature.symbols.each do |feature|
        result = nil
        expect{result = Kernel32.IsProcessorFeaturePresent(feature)}.not_to raise_error
        LOGGER.debug("#{feature} #{result}")
      end
    end
  end

  describe 'QueryPerformanceCounter and Kernel32#QueryPerformanceFrequency' do
    it 'should query the cpu clock frquency' do
      start_ticks = LARGE_INTEGER.new
      end_ticks   = LARGE_INTEGER.new
      frequency   = LARGE_INTEGER.new
      expect(Kernel32.QueryPerformanceCounter(start_ticks)).to be true
      LOGGER.debug(start_ticks.QuadPart)
      expect(Kernel32.QueryPerformanceCounter(end_ticks)).to be true
      LOGGER.debug(end_ticks.QuadPart)

      expect(Kernel32.QueryPerformanceFrequency(frequency)).to be true
      LOGGER.debug(frequency.QuadPart)

      LOGGER.debug(((end_ticks.QuadPart - start_ticks.QuadPart) / frequency.QuadPart.to_f) * 1000000) # in microseconds
    end
  end

  # needs admin rights
  # describe 'Kernel32#SetComputerName' do
  #   it 'should change the computer name' do
  #     expect(Kernel32.SetComputerName('DASP-SIDE')).to be true
  #     FFI::MemoryPointer.new(WinFFI.find_type(:tchar), Kernel32::MAX_COMPUTERNAME_LENGTH + 1) do |computer_name|
  #       FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |size|
  #         size.put_int32(0, 16)
  #         expect(Kernel32.GetComputerName(computer_name, size)).to be true
  #         expect(computer_name.read_array_of_uint16(size.read_int32).pack('U*')).to eq 'DASP-SIDE'
  #       end
  #     end
  #   end
  # end

  # SetComputerNameEx
  # SetComputerNameEx2

  # describe 'Kernel32#VerifyVersionInfo' do
  #   # Kernel32.VerifyVersionInfo(WindowsVersion, :MINORVERSION, )
  #   it '' do
  #     expect(Kernel32.IsWindowsXPOrGreater).to be true
  #   end
  # end

  # DnsHostnameToComputerNameExW

  describe 'GetSystemWow64Directory' do
    it 'should be C:\WINDOWS\SysWoW64' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 256) do |destination|
        expect(size = Kernel32.GetSystemWow64Directory(destination, 256)).not_to eq 0
        expect(destination.read_array_of_uint16(size).pack('U*')).to eq 'C:\WINDOWS\SysWoW64'
      end
    end
  end

  describe 'GetNativeSystemInfo' do
    it '' do
      system_info = Kernel32::SYSTEM_INFO.new
      Kernel32.GetNativeSystemInfo(system_info)
    end
  end

  # needs admin power
  # describe 'Kernel32#GetFirmwareEnvironmentVariable' do
  # end
  # Kernel32#SetFirmwareEnvironmentVariable
  # Kernel32#EnumSystemFirmwareTables
  # Kernel32#GetSystemFirmwareTable

  describe 'GetSystemRegistryQuota' do
    it 'retrieves the current size of the registry and the maximum size that the registry is allowed to attain on the system' do
      FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |quota_allowed|
        FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |quota_used|
          expect(Kernel32.GetSystemRegistryQuota(quota_allowed, quota_used)).to be true
          LOGGER.debug("#{quota_used.read_ulong}/#{quota_allowed.read_ulong}")
        end
      end
    end
  end

  describe 'GetProductInfo' do
    it '' do
      FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |product_type|
        expect(Kernel32.GetProductInfo(WindowsVersion.dwMajorVersion,
                                       WindowsVersion.dwMinorVersion,
                                       WindowsVersion.wServicePackMajor,
                                       WindowsVersion.wServicePackMinor, product_type)).to be true
        LOGGER.debug(Kernel32::ProductType[product_type.read_ulong])
      end
    end
  end

  describe 'GetFirmwareType' do
    it '' do
      FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |firmware_type|
        expect(Kernel32.GetFirmwareType(firmware_type)).to be true
        LOGGER.debug(Kernel32::FIRMWARE_TYPE[firmware_type.read_ulong])
      end
    end
  end

  describe 'IsNativeVhdBoot' do
    it '' do
      FFI::MemoryPointer.new(:bool) do |is_native_vhd_boot|
        expect(Kernel32.IsNativeVhdBoot(is_native_vhd_boot)).to be false
        expect(is_native_vhd_boot.read_uchar.to_i).to eq 0
      end
    end
  end

  describe 'AddConsoleAlias' do
    it '' do
      Kernel32.AddConsoleAlias('test', 'cd C:\programming\ruby\Ruby23\bin', 'ri.bat')
    end
  end
end