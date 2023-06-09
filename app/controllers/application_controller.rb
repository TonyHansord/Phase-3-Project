class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"
  # Get all collectors
  get "/collectors" do
    collectors = Collector.all
    collectors.to_json
  end

  # Get all Games
  get "/games" do
    games = Game.all
    games.to_json
  end

  get "/consoles" do
    consoles = Console.all
    consoles.to_json
  end

  get "/games/:id" do
    game = Game.find(params[:id])
    game.to_json
  end

  # Get all games in a collectors collection
  get "/collectors/:id/games" do
    collector = Collector.find(params[:id])
    collector.games.to_json
  end

  get "/collectors/:id/consoles" do
    collector = Collector.find(params[:id])
    collector.consoles.uniq.to_json
  end

  # Add game to a collection
  post "/collectors/:id/games" do
    puts params
    collector = Collector.find(params[:id])
    # if game is in database - add to collection
    if game = Game.where(title: params[:title], console_id: params[:console_id]).first
      collector.games << game
    else
      # if game is not in database - add new game and add it to collection
      collector.add_game(params[:title], params[:console_id], params[:genre_id], params[:year_released])
    end
    collector.games.to_json
  end

  # Create a collector
  post "/collectors" do
    puts params
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
      year_released: params[:year_released],
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

  # Update a game
  patch "/games/:id" do
    game = Game.find(params[:id])
    if params.has_key?(:title)
      game.update(title: params[:title])
    end
    if params.has_key?(:console_id)
      game.update(console_id: params[:console_id])
    end
    if params.has_key?(:genre_id)
      game.update(genre_id: params[:genre_id])
    end
    if params.has_key?(:year_released)
      game.update(year_released: params[:year_released])
    end
    game.to_json
  end

  # delete collector
  delete "/collectors/:id" do
    collector = Collector.find(params[:id])
    collector.destroy
    Collector.all.to_json
  end

  # Remove Game From collection
  delete "/collectors/:id/games/:game_id" do
    collector = Collector.find(params[:id])
    game = Game.find(params[:game_id])
    collector.remove_from_collection(game)
    collector.games.to_json
  end

  #delete a game from all collections and database
  delete "/games/:id" do
    game = Game.find(params[:id])
    game.collectors.each do |collector|
      collector.remove_from_collection(game)
    end

    game.destroy
    Game.all.to_json
  end
end
