require 'SystemProc'

class FakeFS
  def self.get_stat_data_for_pid pid
    return ['1', '(hello)']
  end
end

RSpec.describe SystemProc, '#Initialization' do  

  context 'Acceptance' do
    it 'Should set pid and process name' do 
      proc = SystemProc::create("1", FakeFS)
      expect(proc.pid).to eq("1")
      expect(proc.name).to eq("hello")
    end
  end

end
