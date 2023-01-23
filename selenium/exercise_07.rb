require 'selenium-webdriver'

class Exercise_07
    attr_accessor :driver, :site, :wait

    def initialize(path_to_driver, url)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site_url = url
        @driver.get(@site_url)
    end
    
    def get_ith_dropdown_element(i)
        wait.until { driver.find_element(:name, "dropdown") }
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
        Selenium::WebDriver::Support::Select.new(driver.find_element(:name, "dropdown")).select_by(:index, i-1)
        sleep(2)
        options = driver.find_element(:name, 'dropdown').find_elements(:tag_name, 'option')
        puts options[i].attribute("value")
    end    
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://testpages.herokuapp.com/styled/basic-html-form-test.html"
ex7 = Exercise_07.new(path_to_driver, site)
ex7.get_ith_dropdown_element(1)