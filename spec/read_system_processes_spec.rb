require 'SystemProc'
require 'ProcList'

class FakeFS
  def self.get_stat_data_for_pid pid
    return [pid, '(hello)']
  end

  def self.get_current_pids
    return ['1', '2', '3']
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

RSpec.describe ProcList, '#Lising' do
  before(:all) do 
    @list = ProcList.new FakeFS
  end

  context 'Acceptance' do
    it "Should loop in all processes" do 
      loop_count = 0
      @list.for_each_proc { |p|
        expect(p.name).not_to be_nil
        loop_count = loop_count + 1
      }

      expect(loop_count).to eq(3)
    end
  end
  
  context 'Unit' do
    it "Should have 3 processes" do
      expect(@list.count).to eq(3)
    end

    it "Should return process with pid 1" do 
      first_proc = @list.get_pid "1"
      expect(first_proc.pid).to eq("1")
      expect(first_proc.name).to eq("hello")
    end
    
  end
end

