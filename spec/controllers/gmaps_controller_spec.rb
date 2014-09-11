require 'rails_helper'
RSpec.describe GmapsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Gmap. As you add validations to Gmap, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GmapsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all gmaps as @gmaps" do
      gmap = Gmap.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:gmaps)).to eq([gmap])
    end
  end

  describe "GET show" do
    it "assigns the requested gmap as @gmap" do
      gmap = Gmap.create! valid_attributes
      get :show, {:id => gmap.to_param}, valid_session
      expect(assigns(:gmap)).to eq(gmap)
    end
  end

  describe "GET new" do
    it "assigns a new gmap as @gmap" do
      get :new, {}, valid_session
      expect(assigns(:gmap)).to be_a_new(Gmap)
    end
  end

  describe "GET edit" do
    it "assigns the requested gmap as @gmap" do
      gmap = Gmap.create! valid_attributes
      get :edit, {:id => gmap.to_param}, valid_session
      expect(assigns(:gmap)).to eq(gmap)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Gmap" do
        expect {
          post :create, {:gmap => valid_attributes}, valid_session
        }.to change(Gmap, :count).by(1)
      end

      it "assigns a newly created gmap as @gmap" do
        post :create, {:gmap => valid_attributes}, valid_session
        expect(assigns(:gmap)).to be_a(Gmap)
        expect(assigns(:gmap)).to be_persisted
      end

      it "redirects to the created gmap" do
        post :create, {:gmap => valid_attributes}, valid_session
        expect(response).to redirect_to(Gmap.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved gmap as @gmap" do
        post :create, {:gmap => invalid_attributes}, valid_session
        expect(assigns(:gmap)).to be_a_new(Gmap)
      end

      it "re-renders the 'new' template" do
        post :create, {:gmap => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested gmap" do
        gmap = Gmap.create! valid_attributes
        put :update, {:id => gmap.to_param, :gmap => new_attributes}, valid_session
        gmap.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested gmap as @gmap" do
        gmap = Gmap.create! valid_attributes
        put :update, {:id => gmap.to_param, :gmap => valid_attributes}, valid_session
        expect(assigns(:gmap)).to eq(gmap)
      end

      it "redirects to the gmap" do
        gmap = Gmap.create! valid_attributes
        put :update, {:id => gmap.to_param, :gmap => valid_attributes}, valid_session
        expect(response).to redirect_to(gmap)
      end
    end

    describe "with invalid params" do
      it "assigns the gmap as @gmap" do
        gmap = Gmap.create! valid_attributes
        put :update, {:id => gmap.to_param, :gmap => invalid_attributes}, valid_session
        expect(assigns(:gmap)).to eq(gmap)
      end

      it "re-renders the 'edit' template" do
        gmap = Gmap.create! valid_attributes
        put :update, {:id => gmap.to_param, :gmap => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested gmap" do
      gmap = Gmap.create! valid_attributes
      expect {
        delete :destroy, {:id => gmap.to_param}, valid_session
      }.to change(Gmap, :count).by(-1)
    end

    it "redirects to the gmaps list" do
      gmap = Gmap.create! valid_attributes
      delete :destroy, {:id => gmap.to_param}, valid_session
      expect(response).to redirect_to(gmaps_url)
    end
  end

end
