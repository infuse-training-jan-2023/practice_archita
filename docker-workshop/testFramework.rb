require 'selenium-webdriver'

class Test_Framework
    attr_accessor :driver

    def initialize
        # Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
        # @driver = Selenium::WebDriver.for :chrome
        # @driver.manage.window.maximize
        Selenium::WebDriver::Chrome.driver_path = "/opt/chromedriver-109.0.5414.74/chromedriver"
        options = Selenium::WebDriver::Chrome::Options.new
        options.add_argument("--headless")
        options.add_argument("--no-sandbox")
        options.add_argument("--window-size=1920,1080")
        options.add_argument("--disable-gpu")
        options.add_argument("--disable-dev-shm-usage")
        @driver = Selenium::WebDriver.for :chrome, options: options
    end

    def navigate_to_url(url)
        # uri = URI.parse(url)
        # if (uri.is_a? (URI::HTTPS) or uri.is_a? (URI::HTTP))
        #     puts("Openning #{url} in browser")
        #     driver.get(url)
        # else
        #     puts("#{url} is an invalid url")
        # end
        begin
            driver.get(url)
            return "Navigated to url successfully"
        rescue => e
            raise e
        end
            
    end

    def get_page_title
        begin
            return driver.title
        rescue => e
            raise e
        end
    end

    def find_element(identifier)
        key, value = identifier.first

        begin
            return driver.find_element(key => value)
        rescue => e
            raise e
        end
    end

    def find_elements(identifier)
        key, value = identifier.first

        begin
            return driver.find_elements(key => value)
        rescue => e
            raise e
        end
    end

    def get_text(element)
        begin
            return element.text
        rescue => e
            raise e
        end
    end

    def click_element(element)
        begin
            element.click
            return "Clicked successfully"
        rescue => e
            raise e
        end
    end

    def send_keys(element, key)
        begin
            element.send_keys(key)
            return "#{key}"
        rescue => e
            raise e
        end
    end

    def get_attribute(element, attribute_val)
        begin
            return element.attribute(attribute_val)
        rescue => e
            raise e
        end
    end

    def is_displayed(element)
        begin
            return element.displayed?
        rescue => e
            raise e
        end
    end
end

# tf = Test_Framework.new
# tf.navigate_to_url("https://www.goodreads.com/")
# sleep(3)
# element = tf.select_element({css: "#newAccountBox > h2"})
# element = tf.find_elements({xpath: "//*[@id='signInUsingContent']/a"})
# puts element
# puts element.text
# tf.get_text(element)
# sleep(3)