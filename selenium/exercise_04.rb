require 'selenium-webdriver'

class Exercise_04
    attr_accessor :driver, :site, :wait

    def initialize(path_to_driver, site_url)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site = site_url
        @driver.get(@site)
    end
    
    def click_btn_css(name, value)
        wait.until {  driver.find_element(:css, "[name=#{name}][value=#{value}]") }
        driver.find_element(:css, "[name=#{name}][value=#{value}]").click
        sleep(1)
    end    
    
    def click_btn_id(id)
        wait.until {  driver.find_element(:id, id) }
        driver.find_element(:id, id).click
        sleep(1)
    end
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://demo.automationtesting.in/Register.html"
ex4 = Exercise_04.new(path_to_driver, site)
ex4.click_btn_css("radiooptions", "Male")
ex4.click_btn_css("radiooptions", "FeMale")
ex4.click_btn_id("checkbox1")
ex4.click_btn_id("checkbox2")
ex4.click_btn_id("checkbox3")