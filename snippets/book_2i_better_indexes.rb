class Book
  include Ripple::Document
  property :publish_date, Time
  property :author, String
  property :title, String

  ASCII_UNIT_SEPARATOR = "\x1F"

  index :author_publish_date, String do
    [author, publish_date.utc.iso8601].join ASCII_UNIT_SEPARATOR
  end

  def self.timeline_for_author(author)
    start = [author, '0000-01-01T00:00:00Z'].join ASCII_UNIT_SEPARATOR
    ending = [author, Time.now.utc.iso8601].join ASCII_UNIT_SEPARATOR
    find_by :author_publish_date, author, start..ending
  end
end
