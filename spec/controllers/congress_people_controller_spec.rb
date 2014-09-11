require 'rails_helper'
RSpec.describe CongressPeopleController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # CongressPerson. As you add validations to CongressPerson, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CongressPeopleController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all congress_people as @congress_people" do
      congress_person = CongressPerson.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:congress_people)).to eq([congress_person])
    end
  end

  describe "GET show" do
    it "assigns the requested congress_person as @congress_person" do
      congress_person = CongressPerson.create! valid_attributes
      get :show, {:id => congress_person.to_param}, valid_session
      expect(assigns(:congress_person)).to eq(congress_person)
    end
  end

  describe "GET new" do
    it "assigns a new congress_person as @congress_person" do
      get :new, {}, valid_session
      expect(assigns(:congress_person)).to be_a_new(CongressPerson)
    end
  end

  describe "GET edit" do
    it "assigns the requested congress_person as @congress_person" do
      congress_person = CongressPerson.create! valid_attributes
      get :edit, {:id => congress_person.to_param}, valid_session
      expect(assigns(:congress_person)).to eq(congress_person)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CongressPerson" do
        expect {
          post :create, {:congress_person => valid_attributes}, valid_session
        }.to change(CongressPerson, :count).by(1)
      end

      it "assigns a newly created congress_person as @congress_person" do
        post :create, {:congress_person => valid_attributes}, valid_session
        expect(assigns(:congress_person)).to be_a(CongressPerson)
        expect(assigns(:congress_person)).to be_persisted
      end

      it "redirects to the created congress_person" do
     y   post :create, {:congress_person => valid_attributes}, valid_session
        expect(response).to redirect_to(CongressPerson.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved congress_person as @congress_person" do
        post :create, {:congress_person => invalid_attributes}, valid_session
        expect(assigns(:congress_person)).to be_a_new(CongressPerson)
      end

      it "re-renders the 'new' template" do
        post :create, {:congress_person => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested congress_person" do
        congress_person = CongressPerson.create! valid_attributes
        put :update, {:id => congress_person.to_param, :congress_person => new_attributes}, valid_session
        congress_person.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested congress_person as @congress_person" do
        congress_person = CongressPerson.create! valid_attributes
        put :update, {:id => congress_person.to_param, :congress_person => valid_attributes}, valid_session
        expect(assigns(:congress_person)).to eq(congress_person)
      end

      it "redirects to the congress_person" do
        congress_person = CongressPerson.create! valid_attributes
        put :update, {:id => congress_person.to_param, :congress_person => valid_attributes}, valid_session
        expect(response).to redirect_to(congress_person)
      end
    end

    describe "with invalid params" do
      it "assigns the congress_person as @congress_person" do
        congress_person = CongressPerson.create! valid_attributes
        put :update, {:id => congress_person.to_param, :congress_person => invalid_attributes}, valid_session
        expect(assigns(:congress_person)).to eq(congress_person)
      end

      it "re-renders the 'edit' template" do
        congress_person = CongressPerson.create! valid_attributes
        put :update, {:id => congress_person.to_param, :congress_person => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested congress_person" do
      congress_person = CongressPerson.create! valid_attributes
      expect {
        delete :destroy, {:id => congress_person.to_param}, valid_session
      }.to change(CongressPerson, :count).by(-1)
    end

    it "redirects to the congress_people list" do
      congress_person = CongressPerson.create! valid_attributes
      delete :destroy, {:id => congress_person.to_param}, valid_session
      expect(response).to redirect_to(congress_people_url)
    end
  end

end
