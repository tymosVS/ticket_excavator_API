require 'rails_helper'

RSpec.describe RequestHandllerController, type: :controller do
  context 'routing' do
    it do
      expect(post: '/').to route_to(
        controller: 'request_handller',
        action: 'create',
      )
    end
  end

  context 'create' do
    let(:valid_param) { 
      {
        RequestNumber: '123-123',
        SequenceNumber: '123',
        RequestType: 'normal',
        DateTimes: {
          ResponseDueDateTime: '2011/07/02 23:09:38'
        },
        ServiceArea: {
          PrimaryServiceAreaCode: {
            SACode: 'ZT'
          },
          AdditionalServiceAreaCodes: {
            SACode: [
              'ZZL01',
              'ZZL02',
              'ZZL03'
            ]
          }
        },
        ExcavationInfo: {
          DigsiteInfo: {
            WellKnownText: 'params'
          }
        },
        Excavator: {
          CompanyName: 'John Doe CONSTRUCTION',
          Address: '555 Some RD',
          City: 'SOME PARK',
          State: 'ZZ',
          Zip: '55555',
          CrewOnsite: 'true'
        }
      }
    }

    [Tiket, Excavator].each do |model|
      it do
        expect do
          post :create, params: valid_param
        end.to change(model, :count).by(1)
      end
    end

    it do
      expect do
        valid_param[:Excavator] = {}
        post :create, params: valid_param
      end.to raise_error(NoMethodError)
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:RequestNumber] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:RequestType] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    it 'empty DateTimes raise error' do
      expect do
        valid_param[:DateTimes] = {}
        post :create, params: valid_param
      end.to raise_error(NoMethodError)
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:DateTimes] = { ResponseDueDateTime: '' }
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    it 'empty ServiceArea raise error' do
      expect do
        valid_param[:ServiceArea] = { }
        post :create, params: valid_param
      end.to raise_error(NoMethodError)
    end

    it 'empty PrimaryServiceAreaCode raise error' do
      expect do
        valid_param[:ServiceArea][:PrimaryServiceAreaCode] = {}
        post :create, params: valid_param
      end.to raise_error(NoMethodError)
    end
    
    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:ServiceArea][:PrimaryServiceAreaCode][:SACode] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    it 'empty AdditionalServiceAreaCodes raise error' do
      expect do
        valid_param[:ServiceArea][:AdditionalServiceAreaCodes] = {}
        post :create, params: valid_param
      end.to raise_error(NoMethodError)
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:ServiceArea][:AdditionalServiceAreaCodes][:SACode] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    it 'empty ExcavationInfo raise error' do
      expect do
        valid_param[:ExcavationInfo] = {}
        post :create, params: valid_param
      end.to raise_error(NoMethodError)
    end

    it 'empty DigsiteInfo raise error' do
      expect do
        valid_param[:ExcavationInfo][:DigsiteInfo] = {}
        post :create, params: valid_param
      end.to raise_error(NoMethodError)
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:ExcavationInfo][:DigsiteInfo][:WellKnownText] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:Excavator][:CompanyName] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:Excavator][:Address] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:Excavator][:City] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:Excavator][:State] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:Excavator][:Zip] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    [Tiket, Excavator].each do |model|
      it do
        expect do
          valid_param[:Excavator][:CrewOnsite] = ''
          post :create, params: valid_param
        end.to change(model, :count).by(0)
      end
    end

    it 'Contain tiket instance variable' do
      post :create, params: valid_param
      expect(@controller.instance_variable_get(:@tiket).class).to eq(Tiket)
    end

    it 'Contain excavator instance variable' do
      post :create, params: valid_param
      expect(@controller.instance_variable_get(:@excavator).class).to eq(Excavator)
    end

    it 'Contain tiket instance variable if dont valid tiket' do
      valid_param[:RequestType] = ''
      post :create, params: valid_param
      expect(@controller.instance_variable_get(:@tiket).class).to eq(Tiket)
    end

    it 'not contain excavator instance variable if dont valid tiket' do
      valid_param[:RequestType] = ''
      post :create, params: valid_param
      expect(@controller.instance_variable_get(:@excavator).class).to_not eq(Excavator)
    end
  end
end
