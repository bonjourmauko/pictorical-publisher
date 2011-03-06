require "spec_helper"

describe Notifications do
  describe "new" do
    let(:mail) { Notifications.new }

    it "renders the headers" do
      mail.subject.should eq("New")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "new_book" do
    let(:mail) { Notifications.new_book }

    it "renders the headers" do
      mail.subject.should eq("New book")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "change_book" do
    let(:mail) { Notifications.change_book }

    it "renders the headers" do
      mail.subject.should eq("Change book")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "review_book" do
    let(:mail) { Notifications.review_book }

    it "renders the headers" do
      mail.subject.should eq("Review book")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
