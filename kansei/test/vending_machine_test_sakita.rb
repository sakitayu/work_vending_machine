require 'minitest/autorun'
require '../lib/vending_machine_20190930'

class VendingMachineTest < Minitest::Test
  def setup
    @vm = VendingMachine.new
  end

  def test_vending_machine
    assert @vm
  end

  def test_buying
    @vm.slot_money (100)
    @vm.slot_money (100)
    @vm.slot_money (500)
    @vm.slot_money (1000)
    assert_equal 1700, @vm.current_slot_money
    assert_equal ["cola", "water", "redbull"], @vm.possible_to_buy
    @vm.buy("cola")
    @vm.buy("water")
    @vm.buy("redbull")
    @vm.buy("redbull")
    @vm.buy("redbull")
    @vm.buy("redbull")
    @vm.buy("redbull")
    @vm.buy("redbull")
    assert_equal ["cola", "water"], @vm.possible_to_buy
    assert_equal 480, @vm.current_slot_money
    @vm.return_money
    assert_equal 0, @vm.current_slot_money
    assert_equal 1220, @vm.total_sales
  end


end
