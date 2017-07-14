require "rails_helper"

describe AccountMailer, type: :mailer do
  describe "account_activation" do
    let(:mail) { AccountMailer.account_activation }
    # 
    # context 'renders the header' do
    #     it { expect(mail.subject).to match "Account activation" }
    #     it { expect(mail.to).to match account.email }
    #     it { expect(mail.from).to eq "noreply@example.com" }
    # end
    #
    # context 'renders the body' do
    #   it { expect(mail.body.encoded).to ("Hi") }
    # end
  end

  # describe "password_reset" do
  #   let(:mail) { AccountMailer.password_reset }
  #
  #   it "renders the headers" do
  #     expect(mail.subject).to eq("Password reset")
  #     expect(mail.to).to eq(["to@example.org"])
  #     expect(mail.from).to eq(["from@example.com"])
  #   end
  #
  #   it "renders the body" do
  #     expect(mail.body.encoded).to match("Hi")
  #   end
  # end

end
