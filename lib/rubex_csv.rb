require 'rubex_csv.so'
require 'benchmark/ips'

class NativeThreadReader
  attr_reader :profit

  def read threads
    records = @lines
    t = []
    (0...500000).step(records/threads) do |rec|
      t << Thread.new { read_and_profit(rec, records/threads) }
    end
    t.each { |a| a.join }
    @profit = t.map { |q| q.value }.inject(:+) / @lines
  end

  def avg_profit
    @profit
  end
end

class GreenThreadReader
  attr_reader :avg_profit
  
  def initialize file_name, lines
    @file_name = file_name
    @lines = lines
    @data = File.readlines @file_name
  end

  def read_and_profit(line, limit)
    sum = 0
    while (line < limit) do
      commas = 0
      j = 0
      current_line = @data[line]
      while commas < 13 do
        if current_line[j] == ','
          commas += 1
        end
        j += 1
      end

      sum += current_line[j..-1].to_i
      line += 1
    end

    sum
  end

  def read threads
    t = []
    (0...@lines).step(@lines/threads) do |rec| 
      t << Thread.new { read_and_profit(rec, rec + @lines/threads) }
    end
    t.each { |a| a.join }
    @avg_profit = t.map { |a| a.value }.inject(:+) / @lines
  end
end
