require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup 
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should not be empty" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @category_1 = Category.new(name: "sports")
    assert_not @category_1.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 25
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "ar"
    assert_not @category.valid?
  end

end
