class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, 'must be email format.' unless kawaii_email_address(value).valid?
  end

  def kawaii_email_address(email)
    KawaiiEmailAddress::Validator.new
  end
end

# # accept `kawaii` local part with docomo or ezweb.
# KawaiiEmailAddress::Validator.new('....-_-....@docomo.ne.jp').valid? # => true
#
# # reject with other domains.
# KawaiiEmailAddress::Validator.new('u3u...chu@example.com').valid?    # => false
