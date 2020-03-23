require 'rails_helper'

RSpec.describe "settings/index", type: :view do
  before(:each) do
    assign(:settings, [
      Setting.create!(
        :name => "Name",
        :email => "Email"
      ),
      Setting.create!(
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of settings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
