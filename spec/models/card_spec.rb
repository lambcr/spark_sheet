require 'rails_helper'

describe Card do
  subject {
    described_class.new()
  }

  it { should have_valid(:question).when('What is your favorite color?') }
  it { should_not have_valid(:question).when(nil, '') }

end
