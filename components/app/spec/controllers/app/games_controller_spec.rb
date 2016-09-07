RSpec.describe App::GamesController, :type => :controller do
  routes { App::Engine.routes }

  before do
    @team1 = create_team
    @team2 = create_team
  end

  let(:valid_attributes) { new_game(first_team_id: @team1.id, second_team_id: @team2.id).as_json }
  let(:invalid_attributes) { new_game(first_team_id: @team1.id, second_team_id: @team2.id).tap { |g| g.location = nil }.as_json }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all games as @games" do
      game = create_game
      get :index, params: {}, session: valid_session
      expect(assigns(:games)).to eq([game])
    end
  end

  describe "GET show" do
    it "assigns the requested game as @game" do
      game = create_game
      get :show, params: { id: game.to_param }, session: valid_session
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "GET new" do
    it "assigns a new game as @game" do
      get :new, params: {} , session: valid_session
      expect(assigns(:game)).to be_a_new(App::Game)
    end
  end

  describe "GET edit" do
    it "assigns the requested game as @game" do
      game = create_game
      get :edit, params: { id: game.to_param }, session: valid_session
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new App::Game" do
        expect {
          post :create, params: { :game => valid_attributes }, session: valid_session
        }.to change(App::Game, :count).by(1)
      end

      it "assigns a newly created game as @game" do
        post :create, params: { :game => valid_attributes }, session: valid_session
        expect(assigns(:game)).to be_a(App::Game)
        expect(assigns(:game)).to be_persisted
      end

      it "redirects to the created game" do
        post :create, params: { :game => valid_attributes }, session: valid_session
        expect(response).to redirect_to(App::Game.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved game as @game" do
        post :create, params: { :game => invalid_attributes }, session: valid_session
        expect(assigns(:game)).to be_a_new(App::Game)
      end

      it "re-renders the 'new' template" do
        post :create, params: { :game => invalid_attributes }, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested game" do
        game = create_game
        new_time = 1.day.ago
        put :update, params: { id: game.to_param, :game => {date: new_time} }, session: valid_session
        game.reload
        expect(assigns(:game).date).to be_within(1).of(new_time)
      end

      it "assigns the requested game as @game" do
        game = create_game
        put :update, params: { id: game.to_param, :game => valid_attributes }, session: valid_session
        expect(assigns(:game)).to eq(game)
      end

      it "redirects to the game" do
        game = create_game
        put :update, params: { id: game.to_param, :game => valid_attributes }, session: valid_session
        expect(response).to redirect_to(game)
      end
    end

    describe "with invalid params" do
      it "assigns the game as @game" do
        game = create_game
        put :update, params: { id: game.to_param, :game => invalid_attributes }, session: valid_session
        expect(assigns(:game)).to eq(game)
      end

      it "re-renders the 'edit' template" do
        game = create_game
        put :update, params: { id: game.to_param, :game => invalid_attributes }, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested game" do
      game = create_game
      expect {
        delete :destroy, params: { id: game.to_param }, session: valid_session
      }.to change(App::Game, :count).by(-1)
    end

    it "redirects to the games list" do
      game = create_game
      delete :destroy, params: { id: game.to_param }, session: valid_session
      expect(response).to redirect_to(games_url)
    end
  end
end
