require 'SystemProc'

RSpec.describe SystemProc, '#Initialization' do  
  context 'Factory' do 
    it 'Should be true' do
      proc = SystemProc::create("3305")
      expect(proc.pid).to eq "3305"
    end
  end
end
