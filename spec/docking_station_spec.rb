require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe DockingStation do
  docking_station = DockingStation.new
  bike = Bike.new

  it { is_expected.to respond_to(:dock) }
  it 'expects a docked bike to be docked' do
    docking_station.dock(bike)
    expect(docking_station.bikes).to include bike
  end

  describe 'initialize' do
    it { expect(docking_station.capacity).to eq 20 }
    it 'expects an initialize value to be set as DEFAULT_CAPACITY' do
      dock = DockingStation.new(50)
      expect(dock.capacity).to eq 50
    end
  end

  describe 'return_bike' do
    context 'if user returns a bike' do
      it { is_expected.to respond_to(:return_bike) }
      it { expect(bike.condition).to eq 'working' }
      it { expect(Bike.new('broken').condition).to eq 'broken' }
      it 'only releases a bike if it is working' do
        docking_station.dock(Bike.new('broken'))
        expect(docking_station.release_bike).to eq 'working'
      end
    end
  end
end
