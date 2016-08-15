require 'spec_helper'

describe Comments do

  let(:user) { Factory.create(:user) }
  let(:micropost) { Factory.create(:micropost, user_id: user) }
  before do
    @comment = Comments.new(content: "Lorem ipsum", user_id: user.id, micropost_id: micropost.id)
  end

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:micropost_id) }

  it { should be_valid }

  describe "when micropost_id is not present" do
    before { @comment.micropost_id = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end
end