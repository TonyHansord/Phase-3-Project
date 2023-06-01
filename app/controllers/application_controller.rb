class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Get all collectors
  get "/collectors" do
    collectors = Collector.all
    collectors.to_json
  end

  # Get all Games
  get "/games" do
    game = Game.all
    game.to_json
  end

  # Get all games in a collectors collection
  get "/collectors/:id/games" do
    collector = Collector.find(params[:id])
    collector.games.to_json
  end

  # Add game to a collection
  post "/collectors/:id/games" do
    collector = Collector.find(params[:id])
    # if game is in database - add to collection
    if game = Game.where(title: params[:title], console_id: params[:console_id]).first
      collector.games << game
    else
      # if game is not in database - add new game and add it to collection
      collector.add_game(params[:title], params[:console_id], params[:genre_id])
    end
    collector.games.to_json
  end

  # Create a collector
  post "/collectors" do
    collector = Collector.create(
      name: params[:name],
    )
    collector.to_json
  end

  # Create a game
  post "/games" do
    game = Game.create(
      title: params[:title],
      console_id: params[:console_id],
      genre_id: params[:genre_id],
    )
    game.to_json
  end

  # Edit collector details
  patch "/collectors/:id" do
    collector = Collector.find(params[:id])
    collector.update(
      name: params[:name],
    )
    collector.to_json
  end

  # delete collector
  delete "/collectors/:id" do
    collector = Collector.find(params[:id])
    collector.destroy
    Collector.all.to_json
  end

  delete "/games/:id" do
    game = Game.find(params[:id])
    game.destroy
    Game.all.to_json
  end
end
