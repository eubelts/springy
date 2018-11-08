require 'spec_helper'

describe 'Boosts', :integration do

  specify 'filter' do
   check_boost subject.boost.filter(term: {url_slug: found['url_slug']}, weight: 10)
 end

end
