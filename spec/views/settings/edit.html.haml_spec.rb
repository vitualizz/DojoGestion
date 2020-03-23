require 'rails_helper'

RSpec.describe "settings/edit", type: :view do
  before(:each) do
    @setting = assign(:setting, Setting.create!(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit setting form" do
    render

    assert_select "form[action=?][method=?]", setting_path(@setting), "post" do

      assert_select "input[name=?]", "setting[name]"

      assert_select "input[name=?]", "setting[email]"
    end
  end
end
