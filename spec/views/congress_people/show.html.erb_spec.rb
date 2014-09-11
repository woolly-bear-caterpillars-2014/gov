require 'rails_helper'

RSpec.describe "congress_people/show", :type => :view do
  before(:each) do
    @congress_person = assign(:congress_person, CongressPerson.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
