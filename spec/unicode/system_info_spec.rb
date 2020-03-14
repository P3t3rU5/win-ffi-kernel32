require 'socket'

require_relative '../unicode'

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
          expect(Kernel32.DnsHostnameToComputerName(Socket.gethostname.to_w, computer_name, size)).to be true
          LOGGER.debug size.read_int32
          LOGGER.debug computer_name.read_array_of_uint16(size.read_int32).pack('U*')
          LOGGER.debug computer_name.size
          expect(computer_name.read_array_of_uint16(size.read_int32).pack('U*')).to eq Socket.gethostname.upcase
        end
      end
    end
  end

  describe 'ExpandEnvironmentStrings' do
    it 'should be Windows_NT' do
      source = '%OS%'.to_w
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 20) do |destiny|
        size = Kernel32.ExpandEnvironmentStrings(source, destiny, 20)
        result = destiny.read_array_of_uint16(size - 1).pack('U*')
        expect(result).to eq 'Windows_NT'
        LOGGER.debug result
      end
    end

    it 'should not expand' do
      source = '%BLABLABLA%'.to_w
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 40) do |destiny|
        size = Kernel32.ExpandEnvironmentStrings(source, destiny, 20)
        expect(destiny.read_array_of_uint16(size - 1).pack('U*')).to eq '%BLABLABLA%'
      end
    end
  end

  describe 'GetComputerName' do
    it 'Should be a String' do
      FFI::MemoryPointer.new(WinFFI.find_type(:wchar), Kernel32::MAX_COMPUTERNAME_LENGTH + 1) do |computer_name|
        FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |size|
          size.put_int32(0, 16)
          expect(Kernel32.GetComputerName(computer_name, size)).to be true
          LOGGER.debug size.read_int32
          LOGGER.debug computer_name.size
          LOGGER.debug computer_name.read_array_of_uint16(size.read_int32).pack('U*')
          expect(computer_name.read_array_of_uint16(size.read_int32).pack('U*')).to eq Socket.gethostname.upcase
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
            LOGGER.debug "#{format} #{computer_name.read_array_of_uint16(size.read_int32).pack('U*')}"
            expect(computer_name.read_array_of_uint16(size.read_int32).pack('U*')).to be_a String
          end
        end
      end
    end
  end

  describe 'GetSystemDirectory' do
    it 'should be C:\WINDOWS\system32' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 256) do |destination|
        expect(size = Kernel32.GetSystemDirectory(destination, 256)).not_to eq 0
        expect(destination.read_array_of_uint16(size).pack('U*')).to eq 'C:\WINDOWS\system32'
      end
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

  describe 'GetWindowsDirectory' do
    it 'should be C:\WINDOWS' do
      FFI::MemoryPointer.new(WinFFI.find_type(:tchar), 256) do |destination|
        expect(size = Kernel32.GetWindowsDirectory(destination, 256)).not_to eq 0
        expect(destination.read_array_of_uint16(size).pack('U*')).to eq 'C:\WINDOWS'
      end
    end
  end

  # needs admin rights
  # describe 'Kernel32#SetComputerName' do
  #   it 'should change the computer name' do
  #     expect(Kernel32.SetComputerName(Socket.gethostname.upcase)).to be true
  #     FFI::MemoryPointer.new(WinFFI.find_type(:tchar), Kernel32::MAX_COMPUTERNAME_LENGTH + 1) do |computer_name|
  #       FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |size|
  #         size.put_int32(0, 16)
  #         expect(Kernel32.GetComputerName(computer_name, size)).to be true
  #         expect(computer_name.read_array_of_uint16(size.read_int32).pack('U*')).to eq Socket.gethostname.upcase
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
        expect(destination.read_array_of_uint16(size).pack('U*')).to eq 'C:\WINDOWS\SysWOW64'
      end
    end
  end

  # needs admin power
  # describe 'Kernel32#GetFirmwareEnvironmentVariable' do
  # end
  # Kernel32#SetFirmwareEnvironmentVariable
  # Kernel32#EnumSystemFirmwareTables
  # Kernel32#GetSystemFirmwareTable

  describe 'VerifyVersionInfo' do
    condition_mask = 0
    Kernel32::VersionType.symbols.each do |type|
      it "#{type}" do
        version_info = WINDOWS_VERSION
        LOGGER.debug version_info.to_s
        condition_mask = Kernel32.VerSetConditionMask(condition_mask, type, :EQUAL)
        expect(condition_mask).to be_an Integer
        expect(Kernel32.VerifyVersionInfo(version_info, type, condition_mask)).to be true
      end
    end
  end
end