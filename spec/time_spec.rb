require_relative 'spec_helper'
require_relative '../lib/win-ffi/kernel32/function/time'


include WinFFI

describe 'Time' do
  describe 'DosDateTimeToFileTime' do
    it 'converts dos time to FILETIME' do
      file_time = Kernel32::FILETIME.new
      expect(Kernel32.DosDateTimeToFileTime(0x0021, 0x0000, file_time)).to be true
      # LOGGER.debug(file_time.dwLowDateTime)
      # LOGGER.debug(file_time.dwHighDateTime)
    end
  end

  describe 'FileTimeToDosDateTime' do

  end

  describe 'GetLocalTime' do
    it 'should return the local time' do
      buffer = Kernel32::SYSTEMTIME.new
      Kernel32.GetLocalTime(buffer)
      expect(Kernel32::DayOfWeek.symbols).to include(buffer.day_of_the_week)
      expect(Kernel32::Month.symbols).to include(buffer.month)
      expect(buffer.wDayOfWeek).to be_a Numeric
      expect(buffer.wDay).to be_a Numeric
      expect(buffer.wMonth).to be_a Numeric
      expect(buffer.wYear).to be_a Numeric
      expect(buffer.wHour).to be_a Numeric
      expect(buffer.wMinute).to be_a Numeric
      expect(buffer.wSecond).to be_a Numeric
      expect(buffer.wMilliseconds).to be_a Numeric
      LOGGER.debug(buffer.to_s)
    end

    it 'works as a method for SYSTEMTIME class' do
      result = Kernel32::SYSTEMTIME.new.current_local_time
      expect(result).to be_a Kernel32::SYSTEMTIME
      expect(Kernel32::DayOfWeek.symbols).to include(result.day_of_the_week)
      expect(Kernel32::Month.symbols).to include(result.month)
      expect(result.wDayOfWeek).to be_a Numeric
      expect(result.wDay).to be_a Numeric
      expect(result.wMonth).to be_a Numeric
      expect(result.wYear).to be_a Numeric
      expect(result.wHour).to be_a Numeric
      expect(result.wMinute).to be_a Numeric
      expect(result.wSecond).to be_a Numeric
      expect(result.wMilliseconds).to be_a Numeric
      LOGGER.debug(result.to_s)
    end
  end

  describe 'GetSystemTime' do
    it 'should return the local time' do
      buffer = Kernel32::SYSTEMTIME.new
      Kernel32.GetSystemTime(buffer)
      expect(Kernel32::DayOfWeek.symbols).to include(buffer.day_of_the_week)
      expect(Kernel32::Month.symbols).to include(buffer.month)
      expect(buffer.wDayOfWeek).to be_a Numeric
      expect(buffer.wDay).to be_a Numeric
      expect(buffer.wMonth).to be_a Numeric
      expect(buffer.wYear).to be_a Numeric
      expect(buffer.wHour).to be_a Numeric
      expect(buffer.wMinute).to be_a Numeric
      expect(buffer.wSecond).to be_a Numeric
      expect(buffer.wMilliseconds).to be_a Numeric
      LOGGER.debug(buffer.to_s)
    end

    it 'works as a method for SYSTEMTIME class' do
      result = Kernel32::SYSTEMTIME.new.current_system_time
      expect(result).to be_a Kernel32::SYSTEMTIME
      expect(Kernel32::DayOfWeek.symbols).to include(result.day_of_the_week)
      expect(Kernel32::Month.symbols).to include(result.month)
      expect(result.wDayOfWeek).to be_a Numeric
      expect(result.wDay).to be_a Numeric
      expect(result.wMonth).to be_a Numeric
      expect(result.wYear).to be_a Numeric
      expect(result.wHour).to be_a Numeric
      expect(result.wMinute).to be_a Numeric
      expect(result.wSecond).to be_a Numeric
      expect(result.wMilliseconds).to be_a Numeric
      LOGGER.debug(result.to_s)
    end
  end

  describe 'GetSystemTimeAdjustment' do
    it 'should return if there is a time adjustment and its ammount' do
      FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |time_adjustment|
        FFI::MemoryPointer.new(WinFFI.find_type(:dword)) do |time_increment|
          FFI::MemoryPointer.new(:bool) do |adjustment_disabled|
            expect(Kernel32.GetSystemTimeAdjustment(time_adjustment, time_increment, adjustment_disabled)).to be true
            LOGGER.debug("#{time_adjustment.read_ulong}, #{time_increment.read_ulong}, #{adjustment_disabled.read_uchar}")
          end
        end
      end
    end
  end

  describe 'GetSystemTimeAsFileTime' do
    it 'convertes SystemTime to FILETIME' do
      file_time = Kernel32::FILETIME.new
      Kernel32.GetSystemTimeAsFileTime(file_time)
      LOGGER.debug("#{file_time.dwLowDateTime}, #{file_time.dwHighDateTime}")
    end
  end

  describe 'GetTickCount' do
    it 'returns the number of miliseconds sonce the system started up to 49.7 days' do
      expect(Kernel32.GetTickCount).to be_a Numeric
      LOGGER.debug(Kernel32.GetTickCount)
    end
  end

  describe 'GetTimeZoneInformation' do
    it 'Retrieves the current time zone settings.' do
      time_zone_info = Kernel32::TIME_ZONE_INFORMATION.new
      result = Kernel32::TimeZoneId[Kernel32.GetTimeZoneInformation(time_zone_info)]
      expect(result).not_to eq :INVALID
      LOGGER.debug(result)
    end

    it 'works as an instance method for TIME_ZONE_INFORMATION' do
      expect(Kernel32::TIME_ZONE_INFORMATION.new.current).not_to eq :INVALID
    end
  end

  describe 'QueryInterruptTime' do
    it '' do
      FFI::MemoryPointer.new(:ulong_long) do |interrupt_time|
        Kernel32.QueryInterruptTime(interrupt_time)
        expect(interrupt_time.read_ulong_long / 1e7).to be_a Numeric
      end
    end
  end

  # needs admin priveleges
  # describe 'SetLocalTime' do
  #   it 'sets the local time' do
  #
  #   end
  # end
  # SetSystemTime
  # SetTimeZoneInformation
  # SetSystemTimeAdjustment

  describe 'SystemTimeToFileTime' do
    it 'converts system time to file time' do
      file_time = Kernel32::FILETIME.new
      system_time = Kernel32::SYSTEMTIME.new
      Kernel32.GetSystemTime(system_time)
      expect(Kernel32.SystemTimeToFileTime(system_time, file_time)).to be true
    end

    it 'works as a method in SYSTEMFILE class' do
      expect(Kernel32::SYSTEMTIME.new.current_local_time.to_file_time).to be_a Kernel32::FILETIME
    end
  end

  describe 'SystemTimeToTzSpecificLocalTime' do
    it "Converts a time in Coordinated Universal Time (UTC) to a specified time zone's corresponding local time" do
      local_time = Kernel32::SYSTEMTIME.new
      system_time = Kernel32::SYSTEMTIME.new.current_system_time
      LOGGER.debug(system_time.to_s)
      expect(Kernel32.SystemTimeToTzSpecificLocalTime(nil, system_time, local_time)).to be true
      LOGGER.debug(local_time.to_s)
    end
  end

  describe 'CompareFileTime' do
    it '' do
      file_times = [Kernel32::FILETIME.new, Kernel32::FILETIME.new]
      file_times[1].dwLowDateTime = 10
      expect(Kernel32.CompareFileTime(file_times[0], file_times[1])).to eq -1
    end

    it 'works as an instance method for FILETIME' do
      file_times = [Kernel32::FILETIME.new, Kernel32::FILETIME.new]
      file_times[1].dwLowDateTime = 10
      expect(file_times[1]).to be > file_times[0]
      expect(file_times[0]).to be < file_times[1]
      expect(file_times[0] == file_times[0]).to be true
    end
  end

  # describe 'GetFileTime' do
  #   it 'Retrieves the date and time that a file or directory was created, last accessed, and last modified' do
  #     handle = Kernel32.CreateFile()
  #     Kernel32.GetFileTime()
  #   end
  # end

  describe 'LocalFileTimeToFileTime' do
    it 'converts local' do
      local_time = Kernel32::SYSTEMTIME.new.current_local_time.to_file_time
      file_time = Kernel32::FILETIME.new
      Kernel32.LocalFileTimeToFileTime(local_time, file_time)
      LOGGER.debug(local_time.inspect)
      LOGGER.debug(file_time.inspect)
    end
  end
end