require './lib/docking_station.rb'

RSpec.describe DockingStation do
  it { should respond_to(:release_bike) }
  it { expect(Bike.new.working?).to eq true}
end

RSpec.describe Bike do
  it { should respond_to(:working?) }
end
