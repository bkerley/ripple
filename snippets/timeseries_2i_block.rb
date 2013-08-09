class Timeseries
  include Ripple::Document
  property :date, Date
  property :column, String

  # Binary index
  index :column_date, String do
    "#{column}-#{date}"
  end

  # Integer index
  index :date, Integer do
    date.to_i
  end
end
