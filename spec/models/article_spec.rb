require 'rails_helper'
RSpec.describe Article, :type => :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:date_up) }
  it { should have_many(:texts) }
  it { should have_many(:images) }
  it { shpuld validate_numericality-of(:like).is_grater_than(-1) }
end
