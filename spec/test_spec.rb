# coding: utf-8
require 'rspec'
require 'pry'
require 'pry-byebug'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubex_csv'
require 'csv'
require 'benchmark'
require "benchmark/ips"

describe "native threads vs green threads" do
  it "reads csv files" do
    aa = nil
    bb = nil
    a = nil
    
    a = NativeThreadReader.new("/Users/sameer/gitrepos/rubex_csv_reader/sales.csv", 5_00_000)
    f = GreenThreadReader.new("/Users/sameer/gitrepos/rubex_csv_reader/sales.csv", 5_00_000)
    Benchmark.ips do |x|
      x.report("execute without gil") do
        a.read(4)
      end

      x.report("execute with gil") do
        f.read(4)
      end
      x.compare!
    end
  end
end

# Warming up --------------------------------------
#  execute without gil     3.000  i/100ms
#     execute with gil     1.000  i/100ms
# Calculating -------------------------------------
#  execute without gil     39.617  (± 2.5%) i/s -    198.000  in   5.004711s
#     execute with gil      0.105  (± 0.0%) i/s -      1.000  in   9.532940s

# Comparison:
#  execute without gil:       39.6 i/s
#     execute with gil:        0.1 i/s - 377.67x  slower
