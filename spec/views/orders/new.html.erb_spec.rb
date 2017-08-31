require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :name => "MyString",
      :address => "MyText",
      :email => "MyString",
      :payment_type => 1
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[name]"

      assert_select "textarea[name=?]", "order[address]"

      assert_select "input[name=?]", "order[email]"

      assert_select "input[name=?]", "order[payment_type]"
    end
  end
end
