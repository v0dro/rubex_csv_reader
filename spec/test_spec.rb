require 'rspec'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubex_csv'
require 'csv'

describe RubexCSV do
  it "reads csv files" do
    a = RubexCSV.new("/home/sameer/gitrepos/rubex_csv_reader/sales.csv")
    a.read
    avg_profit = a.avg_profit
    
    c = CSV.open("/home/sameer/gitrepos/rubex_csv_reader/sales.csv")
    data = c.read
    profit = data.transpose[-1].map { |m| m.to_i }
    avg_profit = profit.inject(:+) / profit.size
  end
end
