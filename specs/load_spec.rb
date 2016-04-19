require 'rspec'
require_relative '../test/test_helper'

RSpec.describe 'Definitions' do

  it "should load ums" do
    expect { require 'win-ffi/kernel32/function/ums' }.to_not raise_error
  end

  files = Dir.glob("#{__dir__}/../lib/**/*.rb").shuffle

  files.each do |f|
      it "should load #{f}" do
        next if f.include?("win32_winnt")
        expect { require f }.to_not raise_error
        # expect { mod.module_eval(File.read(f)) }.to_not raise_error
      end
  end


end