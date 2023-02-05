require 'test/unit'
require 'selenium-webdriver'
require_relative 'test_framework'
require_relative 'driver'

class TestFrameworkMethods < Test::Unit::TestCase
    def test_create_tf_obj
        tf_obj = Test_Framework.new
        assert tf_obj.instance_of? Test_Framework
    end  

    def test_navigate_to_url_success
        tf_obj = Test_Framework.new
        # assert_equal("Navigated to url successfully", tf_obj.navigate_to_url('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html'))
        assert_equal("Navigated to url successfully", tf_obj.navigate_to_url('file:///app/test.html'))
    end

    def test_navigate_to_url_fail
        tf_obj = Test_Framework.new
        # assert_equal("Invalid url", tf_obj.navigate_to_url('CUsers\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')) 
        assert_equal("Invalid url", tf_obj.navigate_to_url('file///app/test.html')) 
    end

    def test_page_title
        tf_obj = Test_Framework.new
        # tf_obj.navigate_to_url('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        tf_obj.navigate_to_url('file:///app/test.html')
        assert_equal("Mock Page for Unit Testing", tf_obj.get_page_title)
    end

    def test_find_element_success
        tf_obj = Test_Framework.new
        # tf_obj.navigate_to_url('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        tf_obj.navigate_to_url('file:///app/test.html')
        element = tf_obj.find_element(xpath: "//*[@id='container']/div[2]/div[1]")
        assert_equal("hello world", element.text)
    end

    def test_find_element_fail
        tf_obj = Test_Framework.new
        # tf_obj.navigate_to_url('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        tf_obj.navigate_to_url('file:///app/test.html')
        assert_equal("Invalid identifier or value", tf_obj.find_element(xpath: "//*[@id='container']/div[2]/[1]"))
    end

    def test_find_elements_success
        tf_obj = Test_Framework.new
        # tf_obj.navigate_to_url('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        tf_obj.navigate_to_url('file:///app/test.html')
        element = tf_obj.find_elements(xpath: "//*[@id='container']/div[2]/div")
        assert_equal("hello world", element[0].text)
        assert_equal("good", element[1].text)
    end

    def test_find_elements_fail
        tf_obj = Test_Framework.new
        # tf_obj.navigate_to_url('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        tf_obj.navigate_to_url('file:///app/test.html')
        assert_equal("Invalid identifier or value", tf_obj.find_elements(xth: "//*[@id='container']/div[2]/div"))
    end

    def test_send_data_success
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        element1 = driver.find_element(:id, "name")
        driver.find_element(css: "#signup > button").click
        assert_equal("abcd", tf_obj.send_keys(element1, "abcd"))
    end

    def test_send_data_fail
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        driver.find_element(css: "#signup > button").click
        begin
            assert_equal("Element not found or key is invalid", tf_obj.send_keys(driver.find_element(:i, "name"), "abcd"))
        rescue => exception
            puts exception.message
        end
    end

    def test_send_key_success
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        element = driver.find_element(css: "#signup > button")
        assert_equal("enter", tf_obj.send_keys(element, :enter))
    end

    def test_send_key_fail
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        element = driver.find_element(css: "#signup > button")
        assert_equal("Element not found or key is invalid", tf_obj.send_keys(element, :eer))
    end

    def test_click_success
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        element = driver.find_element(css: "#signup > button")
        assert_equal("Clicked successfully", tf_obj.click_element(element))
    end

    def test_click_fail
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        begin
            assert_equal("Element not found", tf_obj.click_element(driver.find_element(css: "#sign > button")))
        rescue => exception
            puts exception.message
        end
    end

    def test_get_attribute_success
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        element = driver.find_element(css: "#signup > button")
        assert_equal("submit", tf_obj.get_attribute(element, "type"))
    end

    def test_get_attribute_fail
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        element = driver.find_element(css: "#signup > button")
        begin
            assert_equal("Element not found or attribute is invalid", tf_obj.get_attribute(element, "te"))
        rescue => exception
            puts exception.message
        end
    end

    def test_get_text_success
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        element = driver.find_element(tag_name: "h1")
        assert_equal("Mock Form", tf_obj.get_text(element))
    end

    def test_get_text_fail
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        begin
            assert_equal("Element not found", tf_obj.get_text(driver.find_element(tag_name: "h")))
        rescue => exception
            puts exception.message
        end
    end

    def test_is_displayed_success
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        element = driver.find_element(tag_name: "h1")
        assert_equal(true, tf_obj.is_displayed(element))
    end

    def test_is_displayed_fail
        tf_obj = Test_Framework.new
        driver = Driver.new.driver_method()
        # driver.get('C:\Users\User\Documents\Work_Infuse\Training\practice_archita\docker-workshop\test.html')
        driver.get('file:///app/test.html')
        begin
            assert_equal("Element not found", tf_obj.is_displayed(driver.find_element(tag_nam: "h1")))
        rescue => exception
            puts exception.message
        end
    end
end