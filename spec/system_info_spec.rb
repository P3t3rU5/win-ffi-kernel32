require 'socket'

require_relative 'ascii'

require 'win-ffi/core/macro/util'

require_relative '../lib/win-ffi/kernel32/function/system_info'
require_relative '../lib/win-ffi/kernel32/function/error'
require_relative '../lib/win-ffi/kernel32/macro/system_info'
require_relative '../lib/win-ffi/kernel32/constant'

include WinFFI

describe 'SystemInfo' do
  describe 'Kernel32#GetSystemInfo' do
    it '' do
      system_info = Kernel32::SYSTEM_INFO.new
      Kernel32.GetSystemInfo(system_info)
      expect(system_info).to be_a Kernel32::SYSTEM_INFO
    end
  end

  describe 'GetVersion' do
    it 'should be a number' do
      expect(version = Kernel32.GetVersion).to be_a Numeric

      loword = WinFFI.LOWORD(version)
      hiword = WinFFI.HIWORD(version)

      expect(WinFFI.LOBYTE(loword)).to be_a Numeric
      expect(WinFFI.HIBYTE(loword)).to be_a Numeric

      if version < 0x80000000
        expect(hiword).to be_a Numeric
      end
    end
  end

  describe 'IsProcessorFeaturePresent' do
    Kernel32::ProcessorFeature.symbols.each do |feature|
      it "should check the processor feature: #{feature}" do
        result = nil
        expect{result = Kernel32.IsProcessorFeaturePresent(feature)}.not_to raise_error
        LOGGER.debug("#{feature}: #{result}")
      end
    end
  end

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

  describe 'GetNativeSystemInfo' do
    it '' do
      system_info = Kernel32::SYSTEM_INFO.new
      Kernel32.GetNativeSystemInfo(system_info)
    end
  end

  describe 'GetProductInfo' do
    it '' do
      FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |product_type|
        expect(Kernel32.GetProductInfo(WINDOWS_VERSION.dwMajorVersion,
                                       WINDOWS_VERSION.dwMinorVersion,
                                       WINDOWS_VERSION.wServicePackMajor,
                                       WINDOWS_VERSION.wServicePackMinor, product_type)).to be true
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
        expect{ Kernel32.IsNativeVhdBoot(is_native_vhd_boot) }.not_to raise_error
        expect(is_native_vhd_boot.read_uchar.to_i).to eq 0
      end
    end
  end

  describe 'QueryPerformanceCounter and QueryPerformanceFrequency' do
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
end