# Get input data
require 'csv'

new_deck = Deck.create(name: "State Capitals")

File.open('state_capitals.csv').read.split("\n").each do |line|
  state, capital = line.split(", ")
  new_card = Card.create[question: state, answer: capital]
  new_deck << new_card
end

p new_deck