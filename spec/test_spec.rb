require 'rspec'
require 'pry'
require 'pry-byebug'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubex_csv'
require 'csv'
require 'benchmark'

describe "native threads vs green threads" do
  it "reads csv files" do
    aa = nil
    bb = nil
    Benchmark.bm do |x|
      x.report("Native threads without GIL") do
        a = NativeThreadReader.new("/Users/sameer/gitrepos/rubex_csv_reader/sales.csv", 5_00_000)
        a.read(4)
        aa = a.avg_profit
      end

      x.report("Green threads with GIL") do
        f = GreenThreadReader.new("/Users/sameer/gitrepos/rubex_csv_reader/sales.csv", 5_00_000)
        f.read(4)
        bb = f.avg_profit.to_s
      end
    end

    puts "With GIL : #{bb}. Without GIL : #{aa}."
  end
end

#        user     system      total        real
# Native threads without GIL  0.150000   0.050000   0.200000 (  0.124440)
# Green threads with GIL  9.370000   0.110000   9.480000 (  9.529908)
# With GIL : 392476. Without GIL : 392476.74685.
# .
