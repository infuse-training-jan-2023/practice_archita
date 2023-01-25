require 'test/unit'
require_relative 'testFramework'

class TestBook < Test::Unit::TestCase
    def test_create_obj
        obj = Test_Framework.new
        assert obj.instance_of? Test_Framework
    end  

    def test_navigate_to_url_success
        obj = Test_Framework.new
        # assert_equal("Navigated to url successfully", obj.navigate_to_url('C:\Users\Archita\Documents\Work_Infuse\Training\docker_selenium\test.html'))
        assert_equal("Navigated to url successfully", obj.navigate_to_url('file:///app/test.html'))
    end

    def test_page_title
        obj = Test_Framework.new
        # obj.navigate_to_url('C:\Users\Archita\Documents\Work_Infuse\Training\docker_selenium\test.html')
        obj.navigate_to_url('file:///app/test.html')
        assert_equal("Mock Page for Unit Testing", obj.get_page_title)
    end

    def test_find_element
        obj = Test_Framework.new
        # obj.navigate_to_url('C:\Users\Archita\Documents\Work_Infuse\Training\docker_selenium\test.html')
        obj.navigate_to_url('file:///app/test.html')
        element = obj.find_element(xpath: "//*[@id='container']/div[2]/div[1]")
        assert_equal("hello world", obj.get_text(element))
    end

    def test_find_elements
        obj = Test_Framework.new
        # obj.navigate_to_url('C:\Users\Archita\Documents\Work_Infuse\Training\docker_selenium\test.html')
        obj.navigate_to_url('file:///app/test.html')
        element = obj.find_elements(xpath: "//*[@id='container']/div[2]/div")
        assert_equal("hello world", obj.get_text(element[0]))
        assert_equal("good", obj.get_text(element[1]))
    end

    def test_send_data
        obj = Test_Framework.new
        # obj.navigate_to_url('C:\Users\Archita\Documents\Work_Infuse\Training\docker_selenium\test.html')
        obj.navigate_to_url('file:///app/test.html')
        element1 = obj.find_element({id: "name"})
        element2 = obj.find_element(css: "#signup > button")
        obj.click_element(element2)
        assert_equal("abcd", obj.send_keys(element1, "abcd"))
    end

    def test_send_key
        obj = Test_Framework.new
        # obj.navigate_to_url('C:\Users\Archita\Documents\Work_Infuse\Training\docker_selenium\test.html')
        obj.navigate_to_url('file:///app/test.html')
        element = obj.find_element(css: "#signup > button")
        assert_equal("enter", obj.send_keys(element, :enter))
    end

    def test_click
        obj = Test_Framework.new
        # obj.navigate_to_url('C:\Users\Archita\Documents\Work_Infuse\Training\docker_selenium\test.html')
        obj.navigate_to_url('file:///app/test.html')
        element = obj.find_element(css: "#signup > button")
        assert_equal("Clicked successfully", obj.click_element(element))
    end

    def test_get_attribute
        obj = Test_Framework.new
        # obj.navigate_to_url('C:\Users\Archita\Documents\Work_Infuse\Training\docker_selenium\test.html')
        obj.navigate_to_url('file:///app/test.html')
        element = obj.find_element(css: "#signup > button")
        assert_equal("submit", obj.get_attribute(element, "type"))
    end

    def test_get_text
        obj = Test_Framework.new
        # obj.navigate_to_url('C:\Users\Archita\Documents\Work_Infuse\Training\docker_selenium\test.html')
        obj.navigate_to_url('file:///app/test.html')
        element = obj.find_element(tag_name: "h1")
        assert_equal("Mock Form", obj.get_text(element))
    end

    def test_is_displayed
        obj = Test_Framework.new
        # obj.navigate_to_url('C:\Users\Archita\Documents\Work_Infuse\Training\docker_selenium\test.html')
        obj.navigate_to_url('file:///app/test.html')
        element = obj.find_element(tag_name: "h1")
        assert_equal(true, obj.is_displayed(element))
    end
end