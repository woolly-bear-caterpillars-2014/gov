require 'rails_helper'

RSpec.describe "articles_legislations/edit", :type => :view do
  before(:each) do
    @articles_legislation = assign(:articles_legislation, ArticlesLegislation.create!())
  end

  it "renders the edit articles_legislation form" do
    render

    assert_select "form[action=?][method=?]", articles_legislation_path(@articles_legislation), "post" do
    end
  end
end
