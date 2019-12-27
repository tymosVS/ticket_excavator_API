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

    it 'Dont save tiket if excavator empty' do
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

    it 'Dont create ticket without RequestType' do
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

    it 'Dont create ticket without RequestType' do
      expect do
        valid_param[:ServiceArea] = { }
        post :create, params: valid_param
      end.to raise_error(NoMethodError)
    end

    it 'Dont create ticket without RequestType' do
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

    it 'Dont create ticket without RequestType' do
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

    it 'Dont create ticket without RequestType' do
      expect do
        valid_param[:ExcavationInfo] = {}
        post :create, params: valid_param
      end.to raise_error(NoMethodError)
    end

    it 'Dont create ticket without RequestType' do
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
  end
end