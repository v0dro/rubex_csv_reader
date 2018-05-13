require 'rubex_csv.so'

class RubexCSV
  attr_reader :profit
  # 5,00,000 records in the file
  def read threads
    records = @lines
    t = []
    (0...500000).step(records/threads) do |rec|
      t << Thread.new { read_and_profit(rec, records/threads) }
    end
    t.each { |a| a.join }
    @profit = @part_profit.inject(:+) / @part_profit.size
  end
end
