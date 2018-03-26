require 'rails_helper'
RSpec.describe Text, :type => :model do
  it { should validate_presence_of(:headline) }
  it { should validate_presence_of(:no) }
  it { should validate_presence_of(:content) }
  it { should belong_to(:article) }
  it { should validate_numericality_of(:like).is_greater_than(-1) }

end
