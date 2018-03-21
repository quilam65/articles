require 'rails_helper'
RSpec.describe Image, :type => :model do
  it { should validate_presence_of(:headline) }
  it { should validate_presence_of(:no) }
  it { should validate_presence_of(:image) }
  it { should belong_to(:article) }
  it { shpuld validate_numericality-of(:like).is_grater_than(-1) }

end
