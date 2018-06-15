require_relative '../lib/docking_station.rb'
require_relative '../lib/bike.rb'

describe DockingStation do
  docking_station = DockingStation.new
  bike = Bike.new

  describe 'Initialize' do
    it { expect(docking_station.capacity).to eq 20 }
    it 'expects an initialize value to be set as DEFAULT_CAPACITY' do
      dock = DockingStation.new(50)
      expect(dock.capacity).to eq 50
    end
  end

  it { is_expected.to respond_to(:dock) }
  it 'expects a docked bike to be docked' do
    docking_station.dock(bike)
    expect(docking_station.bikes).to include bike
  end

  it 'Releases a bike' do
    docking_station.dock(bike)
    expect(docking_station.release_bike).to be_an_instance_of(Bike)
  end

  describe 'Release Bike' do
    it { is_expected.to respond_to(:release_bike) }
    it { expect(bike.working?).to eq(true) }
    it 'Removes released bike from Bikes array' do
      docking_station.dock(bike)
      docking_station.release_bike
      expect(docking_station.bikes).not_to include bike
    end
    it 'Prevents Docking Station from releasing broken bikes' do
      docking_station.dock(bike)
      expect(docking_station.release_bike.condition).to eq 'working'
    end
    it 'Returns an error when no bikes are available' do
      docking_station.bikes = []
      expect { subject.release_bike }.to raise_error('No bikes available!')
    end
  end

  describe 'Dock Bike' do
    context 'if user returns a bike' do
      it { expect(bike.condition).to eq 'working' }
      it { expect(Bike.new('broken').condition).to eq 'broken' }
      it 'Returns an error if bike is broken' do
        expect(docking_station.dock(Bike.new('broken'))).to eq 'This bike is broken!'
      end
      it 'Returns an error when bikes are full' do
        full_capacity = docking_station.capacity + 1
        expect { full_capacity.times { subject.dock(Bike.new) } }.to raise_error('Bike dock is full!')
      end
    end
  end
end
