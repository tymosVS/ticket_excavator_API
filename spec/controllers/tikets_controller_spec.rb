require 'rails_helper'

RSpec.describe TiketsController, type: :controller do
  context 'routing' do
    it do
      expect(get: '/').to route_to(
        controller: 'tikets',
        action: 'index',
      )
    end

    it do
      expect(get: '/1').to route_to(
        controller: 'tikets',
        action: 'show',
        id: '1'
      )
    end
  end

end
