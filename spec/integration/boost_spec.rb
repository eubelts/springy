require 'spec_helper'

describe 'Boosts', :integration do

  specify 'filter' do
   check_boost subject.boost.filter(term: {url_slug: found['url_slug']}, weight: 10)
  end

  specify 'query' do
    check_boost subject.boost.query(match: {_all: found['name']}, weight: 10)
  end

  specify 'where' do
    check_boost subject.boost.where(url_slug: found['url_slug'])
  end

  specify 'where with weight' do
    check_boost subject.boost.where(url_slug: found['url_slug'], weight: 100)
  end

  specify 'match with weight' do
    check_boost subject.boost.match(name: found['name'], weight: 100)
  end

  specify 'nested where with weight' do
    check_boost subject.boost.where(nested: true, games: {
      comments: {user_id: 3, source: "mobile"}
    })
  end

  specify 'match' do
    check_boost subject.boost.match(_all: found['name'])
  end

  describe 'field value' do
    specify 'with only field' do
      check_boost subject.boost.field_value(field: :salary)
    end

    # specify 'with field value options' do
    #   check_boost subject.boost.field_value(
    #     field:    :salary,
    #     factor:   1.2,
    #     modifier: :square
    #   )
    # end
    #
    # specify 'with weight' do
    #   check_boost subject.boost.field_value(
    #     field:  :salary,
    #     factor: 1.2,
    #     weight: 100
    #   )
    # end
  end
end
