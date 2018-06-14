require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe Bike do
  bike = Bike.new
  it { is_expected.to respond_to(:working?) }

  describe 'Broken' do
    it { is_expected.to respond_to(:broken?) }
    it { expect(bike.broken?).to eq(true) }
  end
end
