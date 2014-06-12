require 'rails_helper'

describe Deck do
  subject {
    described_class.new()
  }

  it { should be_valid }
end
