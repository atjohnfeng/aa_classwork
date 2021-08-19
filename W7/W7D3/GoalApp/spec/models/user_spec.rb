require 'rails_helper'

RSpec.describe User, type: :model do
  #let(:user) {User.new(username: 'goalman', password: 'abcdef')}
  it { should validate_presence_of(:username) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:password_digest) }
  subject(:user) { FactoryBot.create(:user) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:session_token) }

  describe 'password encryption' do
    it "should not save passwords to the database" do
      FactoryBot.create(:user, username: 'goalman')
      user = User.find_by(username: 'goalman')
      expect(user.password).not_to eq('password')
      expect(user.password_digest).not_to eq('password')
    end
    
    it "encrypts our password with BCrypt" do
      expect(BCrypt::Password).to receive(:create).with('abcdef')
      FactoryBot.build(:user, password: 'abcdef')
    end
  end

end
