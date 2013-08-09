class Book
  include Ripple::Document
  property :publish_date, Time, index: true
  property :author, String, index: true
  property :title, String
end
