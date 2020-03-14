require_relative 'spec_helper'

RSpec.describe 'Definitions' do

  files = Dir.glob("#{__dir__}/../lib/**/*.rb").shuffle

  files.each do |f|
      it "should load #{f}" do
        next if f.include?("win32_winnt")
        expect { require f }.to_not raise_error
        # expect { mod.module_eval(File.read(f)) }.to_not raise_error
      end
  end
end