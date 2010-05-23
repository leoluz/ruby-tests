class GoogleAnalytics

    attr_accessor :page, :pageviews, :unique_pageviews

    def initialize(page, pageviews, unique_pageviews)
        @page = page
        @pageviews = pageviews
        @unique_pageviews = unique_pageviews
    end
end
