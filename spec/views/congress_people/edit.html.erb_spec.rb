require 'rails_helper'

RSpec.describe "congress_people/edit", :type => :view do
  before(:each) do
    @congress_person = assign(:congress_person, CongressPerson.create!())
  end

  it "renders the edit congress_person form" do
    render

    assert_select "form[action=?][method=?]", congress_person_path(@congress_person), "post" do
    end
  end
end
