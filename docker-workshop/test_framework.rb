require 'selenium-webdriver'
require_relative 'driver'

class Test_Framework
    attr_accessor :driver

    def initialize
        @driver = Driver.new.driver_method()
    end

    def navigate_to_url(url)
        begin
            driver.get(url)
            return "Navigated to url successfully"
        rescue 
            return "Invalid url" 
        end
            
    end

    def get_page_title
        begin
            return driver.title
        rescue 
            return "Invalid url" 
        end
    end

    def find_element(identifier)
        key, value = identifier.first

        begin
            return driver.find_element(key => value)
        rescue
            return "Invalid identifier or value" 
        end
    end

    def find_elements(identifier)
        key, value = identifier.first

        begin
            return driver.find_elements(key => value)
        rescue => e
            return "Invalid identifier or value" 
        end
    end

    def get_text(element)
        begin
            return element.text
        rescue 
            return "Element not found" 
        end
    end

    def click_element(element)
        begin
            element.click
            return "Clicked successfully"
        rescue 
            return "Element not found" 
        end
    end

    def send_keys(element, key)
        begin
            element.send_keys(key)
            return "#{key}"
        rescue 
            return "Element not found or key is invalid" 
        end
    end

    def get_attribute(element, attribute_val)
        begin
            return element.attribute(attribute_val)
        rescue 
            return "Element not found or attribute is invalid" 
        end
    end

    def is_displayed(element)
        begin
            return element.displayed?
        rescue 
            return "Element not found" 
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