require_relative 'csv_reader'
reader = CsvReader.new
ARGV.each do |csv_file_name|
    STDERR.puts ">> Processing #{csv_file_name}"
    reader.read_in_csv_data(csv_file_name)
end
puts ">> Total pageviews: #{reader.total_page_views}"
