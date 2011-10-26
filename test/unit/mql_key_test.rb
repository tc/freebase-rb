# encoding: UTF-8

require 'test_helper'

class MqlKeyTest < Test::Unit::TestCase

  def teardown
  end

  def test_indexed_fields
    assert_equal("Hello", Freebase::MqlKey.encode("Hello"))
    assert_equal("F$002FA-18_Hornet", Freebase::MqlKey.encode("F/A-18_Hornet"))
    assert_equal("Illegal$002D", Freebase::MqlKey.encode("Illegal-"))
    assert_equal("$002DIllegal", Freebase::MqlKey.encode("-Illegal"))
    assert_equal("$005FIllegal", Freebase::MqlKey.encode("_Illegal"))
    assert_equal("Legal_", Freebase::MqlKey.encode("Legal_"))
    assert_equal("L-egal", Freebase::MqlKey.encode("L-egal"))
    assert_equal("F$002FA$002F1$002F8$002FH$002Fo$002Fr$002Fn$002Fe$002Ft", Freebase::MqlKey.encode("F/A/1/8/H/o/r/n/e/t"))
    assert_equal("$01E2", Freebase::MqlKey.encode("Ǣ"))
  end

end
