require 'rspec'
require 'pry'
require 'pry-byebug'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubex_csv'
require 'csv'

describe RubexCSV do
  it "reads csv files" do
    a = RubexCSV.new("/home/sameer/gitrepos/rubex_csv_reader/sales.csv", 5_00_000)
    puts a.hell
    a.read(4)
    
    avg_profit = a.avg_profit
    
    c = CSV.open("/home/sameer/gitrepos/rubex_csv_reader/sales.csv")
    data = c.read
    profit = data.transpose[-1].map { |m| m.to_i }
    avg_profit = profit.inject(:+) / profit.size
  end
end
