require 'spec_helper'

describe 'Highlights' do
  let(:found) { fixture(:sakurai) }
  let(:not_found) { fixture(:mizuguchi) }
  let(:extra) { fixture(:suda) }
  let(:name) { found['name'].split.first }

  subject do
    Springy.query(index: SPEC_INDEX, type: FIXTURE_TYPE)
      .match(name: name)
      .highlight(fields: {name: {}})
  end

  it 'returns results with highlights' do
    expect(subject.results.first['highlight']).to be_a Hash
  end
end
