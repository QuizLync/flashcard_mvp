# Get input data
require 'csv'
TXT_FILE = 'db/state_capitals_deck.txt'
CSV_FILE = 'db/ncaa_basketball_champions.txt'
RUBYCARDS_FILE = 'db/flashcard_samples.txt'

@new_deck = Deck.create(name: "State Capitals")
File.open(TXT_FILE).read.split("\n").each do |line|
  state, capital = line.split(", ")
  @new_card = Card.create(question: state, answer: capital)
  @new_deck.cards << @new_card
  @new_deck.save
end

@ruby_deck = Deck.create(name: "Ruby Definitions")
flashcard_lines = File.readlines(RUBYCARDS_FILE)
flashcard_lines.delete_if { |line| line == "\n" }
flashcard_lines.map! { |line| line.chomp }
while flashcard_lines.length > 1
  definition,word = flashcard_lines.shift(2)
  @new_card = Card.create(question: definition, answer: word)
  @ruby_deck.cards << @new_card
  @ruby_deck.save
end

@new_deck = Deck.create(name: "NCAA Basketball Champions")
File.open(CSV_FILE).read.split("\n").each do |line|
  year, team, player, year2, team2, player2 = line.split(",")
  @new_year = year.split(" ").first
  @new_card = Card.create(question: @new_year, answer: team)
  @new_deck.cards << @new_card
  @new_deck.save
end
