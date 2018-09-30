require 'minitest/autorun'
require './lib/gate'
require './lib/ticket'

class GateTest < Minitest::Test
  def setup
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end


  def test_gate
    ticket = Ticket.new(150)
    @umeda.gate_enter(ticket)
    assert @juso.gate_exit(ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_not_enough
    ticket = Ticket.new(150)
    @umeda.gate_enter(ticket)
    refute @mikuni.gate_exit(ticket)
  end

  def test_umeda_to_mikuni_when_fare_is_enough
    ticket = Ticket.new(190)
    @umeda.gate_enter(ticket)
    assert @mikuni.gate_exit(ticket)
  end

  def test_juso_to_mikuni
    ticket = Ticket.new(150)
    @juso.gate_enter(ticket)
    assert @mikuni.gate_exit(ticket)
  end
end
