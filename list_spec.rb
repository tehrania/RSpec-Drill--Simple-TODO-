require "rspec"

require_relative "list"
require_relative "task"

describe List do

  let(:title) { "house chores" }
  let(:list) { List.new(title) }

  describe "#initialize" do
    context "with valid input" do
      it "creates new List" do
        expect(list.title).to eq title
      end
      it "tasks is empty" do
        expect(list.tasks).to eq []
      end
    end
    context "with invalid input" do
      it "throws an argument error" do
        expect{ List.new }.to raise_error(ArgumentError)
      end
    end
  end

  let(:task) { Task.new("vacum") }
  describe "#add_task" do
    before(:each) do
      list.add_task(task)
    end
    it "will add task to list" do
      expect(list.tasks.length).to eq 1
      expect(list.tasks).to include(task)
    end
  end

  describe "#complete_task" do
    before(:each) do
      list.add_task(task)
    end
    it "will complete a task" do
      list.complete_task(0)
      expect(task.complete).to be_true
    end
  end

  describe "#completed_tasks" do
    before(:each) do
      list.add_task(task)
    end
    it "lists completed tasks" do
      list.complete_task(0)
      expect(list.completed_tasks).to include (task)

    end
  end

  describe "#incomplete_tasks" do
      before(:each) do
        list.add_task(task)
      end
    it "lists incomplete tasks" do
      expect(list.incomplete_tasks).to include(task)
    end
  end

  describe "#delete_task"do
  before(:each) do
        list.add_task(task)
      end
      it "deletes tasks" do
        list.delete_task(0)
        expect(list.tasks).to_not include(task)
      end
    end

end