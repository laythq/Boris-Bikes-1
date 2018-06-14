require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe DockingStation do
  docking_station = DockingStation.new
  bike = Bike.new

  it { is_expected.to respond_to(:dock) }
  it 'Expects a docked bike to be docked' do
    docking_station.dock(bike)
    expect(docking_station.bikes).to include bike
  end

  describe 'Release Bike' do
    it { is_expected.to respond_to(:release_bike) }
    it { expect(bike.working?).to eq(true) }
    it 'Releases a bike' do
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end
    it 'Returns an error when no bikes are available' do
      # Why subject here
      expect { subject.release_bike }.to raise_error('No bikes available!')
    end
    it 'Returns an error when bikes are full' do
      # But docking_station here
      docking_station.DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock bike }.to raise_error('Bike dock is full!')
    end
  end

  describe 'Initialize' do
    it "Expects an initialize value equal to the default value" do
      expect(docking_station.DEFAULT_CAPACITY).to eq 20
    end
    it 'Expects an initialize value to be set as DEFAULT_CAPACITY' do
      dock = DockingStation.new(50)
      expect(dock.DEFAULT_CAPACITY).to eq 50
    end
  end
end
