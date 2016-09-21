require 'ProcFolder'
require 'ProcList'

class FakeFS
  def self.get_proc_name pid
    return '(hello)'
  end

  def self.get_current_pids
    return ['1', '2', '3']
  end

  def self.get_uid pid
    return ['1000', '1000', '1000', '1000']
  end

  def self.get_state pid
    return 'S (sleeping)'
  end
end

class FakeUserMap
  def self.get_user id
    if id.is_a?(String)
      return 'user1'
    else
      return nil
    end
  end
end

RSpec.describe ProcFolder, '#Initialization' do

  context 'Display info' do
    before(:all) do
      @proc = ProcFolder::create("1", FakeFS, FakeUserMap)
    end

    it 'Should set pid' do
      expect(@proc.pid).to eq("1")
    end

    it 'Should set process name' do
      expect(@proc.name).to eq("hello")
    end

    it 'Should set user name' do
      expect(@proc.user).to eq("user1")
    end
  end

end

RSpec.describe ProcList, '#Lising' do
  before(:all) do
    @list = ProcList.new FakeFS, FakeUserMap
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
