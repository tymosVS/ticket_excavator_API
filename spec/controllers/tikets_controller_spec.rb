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

  context 'index' do
    let(:tiket){ create(:tiket) }

    it 'renders the :index template' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end

    it 'assigns the category' do
      get :index
      expect(assigns(:tikets)).to include(tiket)
    end
  end

  context 'show' do
    let(:tiket){ create(:tiket) }

    it 'renders the :index template' do
      get :show, params: { id: tiket.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end

    it 'assigns the category' do
      get :show, params: { id: tiket.id }
      expect(assigns(:tiket)).to eq(tiket)
    end
  end
end
