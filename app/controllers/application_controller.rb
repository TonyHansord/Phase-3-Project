class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/collectors" do
    collectors = Collector.all
    collectors.to_json
  end

  get "/games" do
    game = Game.all
    game.to_json
  end

  get "/collectors/:id/games" do
    collector = Collector.find(params[:id])
    collector.games.to_json
  end

  post "/collectors/:id/games" do
    collector = Collector.find(params[:id])
    if game = Game.where(title: params[:title], console_id: params[:console_id]).first
      collector.games << game
    else
      collector.add_game(params[:title], params[:console_id], params[:genre_id])
    end
    collector.games.to_json
  end

  post "/collectors" do
    collector = Collector.create(
      name: params[:name],
    )
    collector.to_json
  end

  post "/games" do
    game = Game.create(
      title: params[:title],
      console_id: params[:console_id],
      genre_id: params[:genre_id],
    )
    game.to_json
  end

  patch "/collectors/:id" do
    collector = Collector.find(params[:id])
    collector.update(
      name: params[:name],
    )
    collector.to_json
  end
end
