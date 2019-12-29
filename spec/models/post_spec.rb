require "rails_helper"

RSpec.describe Post, type: :model do

  context "validations tests" do
      let(:user){User.create(email:"kkkk@kkko.com",password:"abcdefg")}
      let(:post){ Post.new(body: "Content of the body", title:"Check", user_id: user.id)}

    it "ensures the title is present" do
      expect(post.valid?).to eq(false)
    end

    it "ensures the body is present" do
      expect(post.valid?).to eq(false)
    end

    it "ensures the post is active by default" do
      expect(post.status?).to eq(false)
    end

    it "should be able to save post" do
      expect(post.save).to eq(true)
    end
  end

  context "scopes tests" do
     let(:user){User.create(email:"kkkk@kkkop.com",password:"abcdefg")}

    let(:params) { { body: "Content of the body", title: "Title", status: true, user_id: user.id} }
    before(:each) do
      Post.create(params)
      Post.create(params)
      Post.create(params)
      Post.create(params.merge(status: false))
      Post.create(params.merge(status: false))
    end

    it "should return all active posts" do
      expect(Post.active.count).to eq(3)
    end

    it "should return all inactive posts" do
      expect(Post.inactive.count).to eq(2)
    end
  end

  context "with 2 or more comments" do 
     let(:user) {User.create(email:"kkkk@kkkoop.com",password:"abcdefg")}
     let(:params) { { body: "Content of the body7", title: "Title2", status: true, user_id: user.id} }
    it "orders them in reverse chronologically" do
     post=  Post.create(params)
     comment1 = post.comments.create!(:body => "first comment", user_id: user.id, post_id: post.id) 
     comment2 = post.comments.create!(:body => "second comment",user_id: user.id, post_id: post.id) 
     expect(post.reload.comments).to eq([comment1, comment2]) 
   end 
 end
end