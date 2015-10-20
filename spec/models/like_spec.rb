require 'spec_helper'


describe Like do

  let(:user) { FactoryGirl.create(:user) }
  before { @micropost = user.microposts.build(content: "Lorem ipsum") }
  before { @like = @micropost.likes.build(user_id: user.id)}

   subject { @like }

    it { should respond_to(:micropost) }
    it { should respond_to(:micropost_id) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }



  describe "when user_id is not present" do
    before { @like.user_id = nil }
    it { should_not be_valid }
  end


  describe "when micropost_id is not present" do
    before { @like.micropost_id = nil }
    it { should_not  be_valid }
  end

end
