# -*- coding: utf-8 -*-
require "spec_helper"

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
end
