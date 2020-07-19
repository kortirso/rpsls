# frozen_string_literal: true

RSpec.describe Hands::CompareService do
  subject(:service) { described_class }

  context 'for valid parameters' do
    context 'for 3 figures compare' do
      let(:compare_params) do
        {
          hand_1: :rock,
          hand_2: :paper
        }
      end

      it 'success' do
        result = service.call(compare_params)

        expect(result.success?).to eq true
      end

      it 'and returns valid result' do
        result = service.call(compare_params)

        expect(result.result).to eq(-1)
      end
    end

    context 'for 5 figures compare' do
      let(:compare_params) do
        {
          hand_1:            :rock,
          hand_2:            :lizard,
          available_figures: 5
        }
      end

      it 'success' do
        result = service.call(compare_params)

        expect(result.success?).to eq true
      end

      it 'and returns valid result' do
        result = service.call(compare_params)

        expect(result.result).to eq 1
      end
    end
  end

  context 'for invalid parameters' do
    context 'for 3 figures compare' do
      let(:compare_params) do
        {
          hand_1: :rock1,
          hand_2: :paper
        }
      end

      it 'failed' do
        result = service.call(compare_params)

        expect(result.failure?).to eq true
      end

      it 'and returns errors' do
        result = service.call(compare_params)

        expect(result.errors.size.positive?).to eq true
      end
    end

    context 'for 3 figures compare, using unavailable figures' do
      let(:compare_params) do
        {
          hand_1: :rock1,
          hand_2: :lizard
        }
      end

      it 'failed' do
        result = service.call(compare_params)

        expect(result.failure?).to eq true
      end

      it 'and returns errors' do
        result = service.call(compare_params)

        expect(result.errors.size.positive?).to eq true
      end
    end

    context 'for 5 figures compare' do
      let(:compare_params) do
        {
          hand_1:            :something,
          hand_2:            :lizard,
          available_figures: 5
        }
      end

      it 'failed' do
        result = service.call(compare_params)

        expect(result.failure?).to eq true
      end

      it 'and returns errors' do
        result = service.call(compare_params)

        expect(result.errors.size.positive?).to eq true
      end
    end
  end
end
