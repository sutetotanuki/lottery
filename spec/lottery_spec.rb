# -*- coding: utf-8 -*-
require "spec_helper"
require "benchmark"

describe Lottery do
  before do
    @lottery = Lottery.new(3)
    @lottery.add('John', 1) # 確率  1/20
    @lottery.add('Tom',  2) #       2/20
    @lottery.add('Bill', 5) #       5/20
    @lottery.add('Woz',  2) #       2/20
    @lottery.add('Ken', 10) #      10/20    
  end
  
  it "elects winners" do
    @lottery.winners.should have(3).items
  end

  it "重みが効いてる事。でもちゃんとはかれる方法がわからない。。" do
    elected_table = {
      'John' => 0,
      'Tom'  => 0,
      'Bill' => 0,
      'Woz'  => 0,
      'Ken'  => 0,
    }
    
    10000.times do
      winners = @lottery.winners
      winners.each do |winner|
        elected_table[winner] += 1
      end
    end
 
    elected_table.invert[elected_table.values.max].should eq "Ken"
  end

  describe "performance" do
    context "has too large table" do
      before do
        500000.times do |i|
          @lottery.add("Test_#{i}", i % 9 + 1)
        end
      end
      
      it "takes time" do
        puts Benchmark.measure {
          @lottery.winners
        }
      end
    end
  end
end
