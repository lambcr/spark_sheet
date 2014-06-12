require 'rails_helper'

describe CardsController, type: :controller do

  describe "#index" do
    let!(:cards) { FactoryGirl.create_list(:card, 5) }
    before { get :index }

    it "succeeds" do
      expect(response).to be_success
    end
    it "returns all cards" do
      expect(assigns(:cards)).to eq(cards)
    end
  end

  describe "#show" do
    let(:card) { FactoryGirl.create(:card) }
    before { get :show, id: card.id }

    context "with an existing card" do
      it "succeeds" do
        expect(response).to be_success
      end
      it "returns the requested card" do
        expect(assigns(:card)).to eq(card)
      end
    end

    context "with an invalid card id" do
      let(:card) { double('card', id: 42) }

      it "fails" do
        expect(response.status).to eq(404)
      end
    end
  end

  describe "#new" do
    before { get :new }

    it "succeeds" do
      expect(response).to be_success
    end
    it "returns a new card" do
      expect(assigns(:card)).to be_a_new(Card)
    end
  end

  describe "#edit" do
    let(:card) { FactoryGirl.create(:card) }

    before do
      get :edit, id: card.to_param
    end

    it "succeeds" do
      expect(response).to be_success
    end
    it "assigns the requested card" do
      expect(assigns(:card)).to eq(card)
    end
  end

  describe "#create" do
    let(:valid_attributes) {
      {
        question: 'What is your favorite color?',
        answer:   'Green'
      }
    }

    describe "with valid params" do
      it "creates a new Card" do
        expect {
          post :create, card: valid_attributes
        }.to change(Card, :count).by(1)
      end

      it "assigns a newly created card as @card" do
        post :create, card: valid_attributes
        expect(assigns(:card)).to be_a(Card)
        expect(assigns(:card)).to be_persisted
      end

      it "redirects to the created card" do
        post :create, card: valid_attributes
        expect(response).to redirect_to(Card.last)
      end
    end

    describe "with invalid params" do
      let(:invalid_attributes) {
        {
          question: 'What is that?',
        }
      }
      before { post :create, card: invalid_attributes }

      it "assigns a newly created but unsaved card as @card" do
        expect(assigns(:card)).to be_a_new(Card)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "#update" do
    let!(:card) { FactoryGirl.create(:card) }

    describe "with valid params" do
      let(:new_attributes) {
        {question: 'New Question'}
      }
      before do
        put :update, {id: card.to_param, card: new_attributes}
      end

      it "updates the requested card" do
        card.reload
        expect(card.question).to eq('New Question')
      end

      it "assigns the requested card as @card" do
        expect(assigns(:card)).to eq(card)
      end

      it "redirects to the card" do
        expect(response).to redirect_to(card)
      end
    end

    describe "with invalid params" do
      before do
        put :update, {id: card.to_param, card: {question: ''}}
      end

      it "assigns the card as @card" do
        expect(assigns(:card)).to eq(card)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let!(:card) { FactoryGirl.create(:card) }

    it "destroys the requested card" do
      expect {
        delete :destroy, {id: card.to_param}
      }.to change(Card, :count).by(-1)
    end

    it "redirects to the cards list" do
      delete :destroy, {id: card.to_param}
      expect(response).to redirect_to(cards_url)
    end
  end

end
