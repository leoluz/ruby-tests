require 'csv'
require_relative 'google_analytics'

class CsvReader 
    def initialize
        @google_analytics = []
    end

    def read_in_csv_data(csv_file_name)
        CSV.foreach(csv_file_name, headers: true) do |row|
            @google_analytics << GoogleAnalytics.new(row["Page"],
                                                     row["Pageviews"],
                                                     row["UniquePageviews"])
        end
    end

    def total_page_views
        sum = 0
        @google_analytics.each { |analize| sum += analize.pageviews.to_i }
        sum
    end
end
