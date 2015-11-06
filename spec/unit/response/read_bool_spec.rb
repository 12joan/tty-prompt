# encoding: utf-8

require 'spec_helper'

RSpec.describe TTY::Prompt::Question, '#read_bool' do
  let(:input)  { StringIO.new }
  let(:output) { StringIO.new }
  let(:prompt) { TTY::Prompt.new(input, output) }

  it 'fails to read boolean' do
    input << 'invalid'
    input.rewind
    q = prompt.ask("Do you read books?")
    expect { q.read_bool }.to raise_error(Necromancer::ConversionTypeError)
  end

  it "handles default values" do
    input << "\n"
    input.rewind
    q = prompt.ask("Do you read books?").default(true)
    expect(q.read_bool).to eql(true)
  end

  it 'reads negative boolean' do
    input << 'No'
    input.rewind
    q = prompt.ask("Do you read books?")
    answer = q.read_bool
    expect(answer).to eql false
  end

  it 'reads positive boolean' do
    input << 'Yes'
    input.rewind
    q = prompt.ask("Do you read books?")
    answer = q.read_bool
    expect(answer).to eql true
  end

  it 'reads single positive boolean' do
    input << 'y'
    input.rewind
    q = prompt.ask("Do you read books?")
    answer = q.read_bool
    expect(answer).to eql true
  end
end