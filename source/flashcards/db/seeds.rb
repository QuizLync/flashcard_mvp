# Get input data
require 'csv'
TXT_FILE = 'db/state_capitals_deck.txt'
# require_relative '/state_capitals'

@new_deck = Deck.create(name: "State Capitals")

File.open(TXT_FILE).read.split("\n").each do |line|
  state, capital = line.split(", ")
  # @new_deck <<
  @new_card = Card.create(question: state, answer: capital)
  @new_deck.cards << @new_card
  @new_deck.save
end

# p @new_deck.cards << @new_card

