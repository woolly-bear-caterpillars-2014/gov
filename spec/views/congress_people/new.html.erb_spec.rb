require 'rails_helper'

RSpec.describe "congress_people/new", :type => :view do
  before(:each) do
    assign(:congress_person, CongressPerson.new())
  end

  it "renders new congress_person form" do
    render

    assert_select "form[action=?][method=?]", congress_people_path, "post" do
    end
  end
end
