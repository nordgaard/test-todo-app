require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete' do
    it 'should switch complete to false if it began as true' do 
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end
    it 'should switch complete to true if it began as false' do
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe '#toggle_favorites' do
    it 'should switch favorties if it began as true' do 
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
    it 'should switch favorties if it began as false' do 
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe '#overdue?' do
    it 'should show you if something is overdue' do 
      task = Task.new(deadline: 1.day.ago)
      task.overdue?
      expect(task.overdue?).to eq(true)
    end
  end

  describe '#increment_priority!' do
    it 'should increase the priority for those < 10' do
      task = Task.new(priority: 9)
      task.increment_priority!
      expect(task.priority).to eq(10)
    end
    it 'should decrease the priority for those > 1' do
      task = Task.new(priority: 2)
      task.decrement_priority!
      expect(task.priority).to eq(1)
    end
  end

  describe '#snooze_hour!' do
    it 'should increase the deadline by 1 hour' do
      deadline = DateTime.new(2016,10,31)
      task = Task.new(deadline: deadline)
      task.snooze_hour!
      expect(task.deadline).to eq(deadline + 1.hour)
    end
  end
end
