# require "rails_helper"
# include EmailSpec::Helpers
# include EmailSpec::Matchers
# include Rails.application.routes.url_helpers
#
# describe AccountMailer, type: :mailer do
#   # describe "Signup Email" do
#   #   let!(:account) { create(:account) }
#   #   let!(:email) { account.email }
#   #   before do
#   #     post
#   #   end
#   #   it "should be set to be delivered to the email passed in" do
#   #     expect(@email).to deliver_to("jojo@yahoo.com")
#   #   end
#   #
#   #   it "should contain the user's message in the mail body" do
#   #     expect(@email).to have_body_text(/Jojo Binks/)
#   #   end
#   #
#   #   it "should contain a link to the confirmation link" do
#   #     expect(@email).to have_body_text(/#{confirm_account_url}/)
#   #   end
#   #
#   #   it "should have the correct subject" do
#   #     expect(@email).to have_subject(/Account confirmation/)
#   #   end
#   # end
#
#   # describe "password_reset" do
#   #   let(:mail) { AccountMailer.password_reset }
#   #
#   #   it "renders the headers" do
#   #     expect(mail.subject).to eq("Password reset")
#   #     expect(mail.to).to eq(["to@example.org"])
#   #     expect(mail.from).to eq(["from@example.com"])
#   #   end
#   #
#   #   it "renders the body" do
#   #     expect(mail.body.encoded).to match("Hi")
#   #   end
#   # end
# end
