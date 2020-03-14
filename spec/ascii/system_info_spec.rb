require 'socket'

require_relative '../ascii'

require 'win-ffi/core/macro/util'

require_relative '../../lib/win-ffi/kernel32/function/system_info'
require_relative '../../lib/win-ffi/kernel32/function/error'
require_relative '../../lib/win-ffi/kernel32/macro/system_info'
require_relative '../../lib/win-ffi/kernel32/constant'

include WinFFI

using WinFFI::StringUtils

describe 'SystemInfo' do
  describe 'DnsHostnameToComputerName' do
    it '' do
      FFI::MemoryPointer.new(WinFFI.find_type(:wchar), Kernel32::MAX_COMPUTERNAME_LENGTH + 1) do |computer_name|
        FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |size|
          size.put_int32(0, 16)
          expect(Kernel32.DnsHostnameToComputerName(Socket.gethostname, computer_name, size)).to be true
          LOGGER.debug size.read_int32
          LOGGER.debug computer_name.read_string
          LOGGER.debug computer_name.size
          expect(computer_name.read_string).to eq Socket.gethostname.upcase
        end
      end
    end
  end

  describe 'ExpandEnvironmentStrings' do
    it 'should be Windows_NT' do
      source = '%OS%'
      FFI::MemoryPointer.new(WinFFI.find_type(:wchar), 20) do |destiny|
        size = Kernel32.ExpandEnvironmentStrings(source, destiny, 20)
        expect(destiny.read_string(size - 1)).to eq 'Windows_NT'
      end
    end

    it 'should not expand' do
      source = '%BLABLABLA%'
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 20) do |destiny|
        size = Kernel32.ExpandEnvironmentStrings(source, destiny, 20)
        expect(destiny.read_string(size - 1)).to eq '%BLABLABLA%'
      end
    end
  end

  describe 'GetComputerName' do
    it 'Should be a String' do
      FFI::MemoryPointer.new(WinFFI.find_type(:wchar), Kernel32::MAX_COMPUTERNAME_LENGTH + 1) do |computer_name|
        FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |size|
          LOGGER.debug size
          size.put_int32(0, 16)
          expect(Kernel32.GetComputerName(computer_name, size)).to be true
          LOGGER.debug size.read_int32
          LOGGER.debug computer_name.read_string
          LOGGER.debug computer_name.size
          expect(computer_name.read_string(size.read_int32)).to eq Socket.gethostname.upcase
        end
      end
    end
  end

  describe 'GetComputerNameEx' do
    Kernel32::ComputerNameFormat.symbols[0..-2].each do |format|
      it "Gets the #{format}" do
        FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |size|
          expect(Kernel32.GetComputerNameEx(format, FFI::Pointer::NULL, size)).to be false
          FFI::MemoryPointer.new(WinFFI.find_type(:wchar), size.read_int32 + 1) do |computer_name|
            expect(Kernel32.GetComputerNameEx(format, computer_name, size)).to be true
            LOGGER.debug computer_name.size
            LOGGER.debug "#{format}:   #{computer_name.read_string}"
            expect(computer_name.read_string).to be_a String
          end
        end
      end
    end
  end

  describe 'GetSystemDirectory' do
    it 'should be C:\WINDOWS\system32' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 256) do |destination|
        expect(size = Kernel32.GetSystemDirectory(destination, 256)).not_to eq 0
        expect(destination.read_string(size)).to eq 'C:\WINDOWS\system32'
      end
    end
  end

  describe 'GetSystemWindowsDirectory' do
    it 'should be C:\WINDOWS' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 256) do |destination|
        expect(size = Kernel32.GetSystemWindowsDirectory(destination, 256)).not_to eq 0
        expect(destination.read_string(size)).to eq 'C:\WINDOWS'
      end
    end
  end

  describe 'GetWindowsDirectory' do
    it 'should be C:\WINDOWS' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 256) do |destination|
        expect(size = Kernel32.GetWindowsDirectory(destination, 256)).not_to eq 0
        expect(destination.read_string(size)).to eq 'C:\WINDOWS'
      end
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
  #   # Kernel32.VerifyVersionInfo(WINDOWS_VERSION, :MINORVERSION, )
  #   it '' do
  #     expect(Kernel32.IsWindowsXPOrGreater).to be true
  #   end
  # end

  # DnsHostnameToComputerNameExW

  describe 'GetSystemWow64Directory' do
    it 'should be C:\WINDOWS\SysWoW64' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 256) do |destination|
        expect(size = Kernel32.GetSystemWow64Directory(destination, 256)).not_to eq 0
        expect(destination.read_string(size)).to eq 'C:\WINDOWS\SysWOW64'
      end
    end
  end

  # needs admin power
  # describe 'Kernel32#GetFirmwareEnvironmentVariable' do
  # end
  # Kernel32#SetFirmwareEnvironmentVariable
  # Kernel32#EnumSystemFirmwareTables
  # Kernel32#GetSystemFirmwareTable
end