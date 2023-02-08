require 'test/unit'
require 'selenium-webdriver'
require_relative 'test_framework'
require_relative 'driver'

class TestFrameworkMethods < Test::Unit::TestCase
    def test_create_tf_obj
        driver = Driver.new.driver_method()
        tf_obj = Test_Framework.new(driver)
        assert tf_obj.instance_of? Test_Framework
    end  

    def test_navigate_to_url_success
        driver = Driver.new.driver_method()
        tf_obj = Test_Framework.new(driver)
        assert_equal("Navigated to url successfully", tf_obj.navigate_to_url('file:///app/test.html'))
    end

    def test_navigate_to_url_fail
        driver = Driver.new.driver_method()
        tf_obj = Test_Framework.new(driver)
        assert_equal("Invalid url", tf_obj.navigate_to_url('file///app/test.html')) 
    end

    def test_page_title
        driver = Driver.new.driver_method()
        tf_obj = Test_Framework.new(driver)
        tf_obj.navigate_to_url('file:///app/test.html')
        assert_equal("Mock Page for Unit Testing", tf_obj.get_page_title)
    end

    def test_find_element_success
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        element = tf_obj.find_element(xpath: "//*[@id='container']/div[2]/div[1]")
        assert_equal("hello world", element.text)
    end

    def test_find_element_fail
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        assert_equal("Invalid identifier or value", tf_obj.find_element(xpath: "//*[@id='container']/div[2]/[1]"))
    end

    def test_find_elements_success
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        element = tf_obj.find_elements(xpath: "//*[@id='container']/div[2]/div")
        assert_equal("hello world", element[0].text)
        assert_equal("good", element[1].text)
    end

    def test_find_elements_fail
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        assert_equal("Invalid identifier or value", tf_obj.find_elements(xth: "//*[@id='container']/div[2]/div"))
    end

    def test_send_data_success
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        element1 = driver.find_element(:id, "name")
        driver.find_element(css: "#signup > button").click
        assert_equal("abcd", tf_obj.send_keys(element1, "abcd"))
    end

    def test_send_key_success
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        element = driver.find_element(css: "#signup > button")
        assert_equal("enter", tf_obj.send_keys(element, :enter))
    end

    def test_send_key_fail
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        element = driver.find_element(css: "#signup > button")
        assert_equal("Key is invalid", tf_obj.send_keys(element, :eer))
    end

    def test_click_success
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        element = driver.find_element(css: "#signup > button")
        assert_equal("Clicked successfully", tf_obj.click_element(element))
    end

    def test_get_attribute
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        element = driver.find_element(css: "#signup > button")
        assert_equal("submit", tf_obj.get_attribute(element, "type"))
    end

    def test_get_text
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        element = driver.find_element(tag_name: "h1")
        assert_equal("Mock Form", tf_obj.get_text(element))
    end

    def test_get_text_input_field
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        element = driver.find_element(tag_name: "input")
        assert_equal("111", tf_obj.get_text(element, "input"))
    end

    def test_is_displayed_success
        driver = Driver.new.driver_method()
        driver.get('file:///app/test.html')
        tf_obj = Test_Framework.new(driver)
        element = driver.find_element(tag_name: "h1")
        assert_equal(true, tf_obj.is_displayed(element))
    end
end