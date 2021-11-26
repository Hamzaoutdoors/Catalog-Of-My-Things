require 'json'
require_relative 'game'

module GameStorage
  def save_game
    @json_game = []
    @games.each do |game|
      @json_game.push('last_played_at' => game.last_played_at, 'multiplayer' => game.multiplayer,
                      'publish_date' => game.publish_date)
    end
    File.write('game.json', JSON.pretty_generate(@json_game))
  end

  def parse_game
    unless File.exist?('game.json')
      File.open('game.json', 'w') do |f|
        f.write JSON.pretty_generate([])
      end
    end
    JSON.parse(File.read('game.json')).map do |game|
      @games << Game.new(game['last_played_at'], game['multiplayer'], game['publish_date'])
    end
  end
end
