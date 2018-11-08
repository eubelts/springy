require 'spec_helper'

describe Springy do
  subject { described_class }

  it 'has a version number' do
    expect(Springy::VERSION).not_to be nil
  end

  it 'counts from the index' do
    expect(subject.count_index SPEC_INDEX).to eq(3)
  end
end
