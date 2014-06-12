require 'rails_helper'

describe CardDeck do
  subject {
    described_class.new()
  }

  it { should_not have_valid(:card).when(nil) }
  it { should_not have_valid(:deck).when(nil) }
end
