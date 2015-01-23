require 'rails_helper'


describe Vote do
  describe "validations" do

    before do
      @post = Post.create(title: 'post title', body: 'post body')
      3.times { @post.votes.create(value: 1) }
      1.times { @post.votes.create(value: 2) }
      2.times { @post.votes.create(value: -1) }
      1.times { @post.votes.create(value: -2) }
    end

    describe "valid up votes" do
      it "returns the sum of all valid up votes" do
        expect( @posts.up_points ).to eq(3))     
      end
    end

    describe "valid down votes" do
      it "returns the sum of all valid down votes" do
        expect( @posts.down_points ).to eq(-2))
      end
    end

    describe "valid votes" do
      it "returns the sum of all valid votes" do
        expect( @posts.points ).to eq(1))
      end
    end
  end
end