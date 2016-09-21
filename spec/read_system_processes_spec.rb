require 'ProcessData'
require 'ProcessFactory'

class FakeFS
  def self.get_current_pids
    return ['1', '2', '3']
  end

  def self.get_process_data pid
    return {
      "name:"=>["hello"],
      "state:"=>["S (sleeping)"],
      "pid:"=>["1"],
      "uid:"=>["1000", "1000", "1000", "1000"]
    }
  end

  def self.get_users
    return {
      "1000" => "user1"
    }
  end
end

RSpec.describe ProcessFactory, '#Lising' do
  before(:all) do
    @list = ProcessFactory.new FakeFS
  end

  context 'Create processes' do
    it "Should loop in all Pids" do
      loop_count = 0
      @list.each_process { |p|
        expect(p.name).not_to be_nil
        expect(p.pid).not_to be_nil
        expect(p.user).not_to be_nil
        loop_count = loop_count + 1
      }
      expect(loop_count).to eq(3)
    end
  end
end
