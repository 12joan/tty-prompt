# frozen_string_literal: true

require_relative "../lib/tty-prompt"

prompt = TTY::Prompt.new

drinks = %w[vodka beer wine whisky bourbon water milk apple-juice orange-juice tea coffee]
answer = prompt.ordered_multi_select("Choose your favourite drinks in order of preference", drinks)

puts answer.inspect
