require 'selenium-webdriver'

class Exercise_10
    attr_accessor :driver, :site, :wait

    def initialize(path_to_driver, url)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site_url = url
        @driver.get(@site_url)
    end
    
    def get_column(n)
        # wait.until { driver.find_element(:id, "main") }
        # header = driver.find_element(:css, "thead tr th:nth-of-type(#{n}) a").text
        # puts "Column: #{header}"
        # column = driver.find_elements(:css, "tbody tr td:nth-of-type(#{n})")
        # column.each { | col | puts col.text }

        trs = driver.find_elements(:tag_name, "tr")
        trs.each do |tr|
            puts tr.text.split(" ")[n] 
        end
    end    
end

path_to_driver = "C:\\Users\\User\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://computer-database.gatling.io/computers"
ex10 = Exercise_10.new(path_to_driver, site)
ex10.get_column(2)