require 'rails_helper'

RSpec.describe "articles_legislations/new", :type => :view do
  before(:each) do
    assign(:articles_legislation, ArticlesLegislation.new())
  end

  it "renders new articles_legislation form" do
    render

    assert_select "form[action=?][method=?]", articles_legislations_path, "post" do
    end
  end
end
