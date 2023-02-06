require_relative 'test_framework'
require_relative 'driver'

class AutomateHeadphonezone
    attr_accessor :tf_obj, :driver

    def initialize
        # driver = Driver.new.driver_method()
        @tf_obj = Test_Framework.new(Driver.new.driver_method())
        @tf_obj.navigate_to_url("https://www.headphonezone.in/")
    end

    def get_page_title
        puts "Page Title is #{tf_obj.get_page_title}"
    end

    def search(search_txt)
        popup = tf_obj.find_element(css: "#lion-loyalty-panel-custom-css div:nth-of-type(5) div a")
        tf_obj.click_element(popup)
        sleep(2)

        search_icon = tf_obj.find_element(css: "ul.header__linklist:nth-child(2) > li:nth-child(1) > a:nth-child(1)")
        tf_obj.click_element(search_icon)
        sleep(2)

        search_input = tf_obj.find_element(css: ".predictive-search__input")
        tf_obj.send_keys(search_input, search_txt)
        sleep(2)

        found = tf_obj.find_element(css: "#search-drawer > footer > button")        
        if tf_obj.get_text(found) == "VIEW ALL RESULTS"
            puts "Search successfull for #{search_txt}"
            tf_obj.click_element(found)
        else
            puts "#{search_txt} not found"
        end
        sleep(2)
    end

    def apply_filters
        brand = tf_obj.find_element(css: "#facet-filters-form > div > div:nth-child(1) > button")
        tf_obj.click_element(brand)
        tf_obj.send_keys(brand, :arrow_down)
        tf_obj.send_keys(brand, :arrow_down)
        tf_obj.send_keys(brand, :arrow_down)
        tf_obj.send_keys(brand, :arrow_down)
        brand_opt1 = tf_obj.find_element(xpath: '//*[@id="filter.p.vendor-1"]')
        tf_obj.click_element(brand_opt1)        
        brand_opt2 = tf_obj.find_element(xpath: '//*[@id="filter.p.vendor-4"]')
        tf_obj.click_element(brand_opt2)
        tf_obj.click_element(brand)
        puts "Filter applied"

        item = tf_obj.find_element(css: "#facet-main > product-list > div > product-item:nth-child(4)")
        tf_obj.click_element(item)
        sleep(3)
    end

    def add_to_cart
        add_to_cart_btn = tf_obj.find_element(css: "#AddToCart > span.loader-button__text")
        tf_obj.click_element(add_to_cart_btn)
        sleep(3)

        add_to_cart_success = tf_obj.find_element(xpath: "//*[@id='shopify-section-header']/cart-notification/div/div/div")
        if tf_obj.is_displayed(add_to_cart_btn)
            puts "Added to cart"
        else
            puts "Not added to cart"
        end

        add_to_cart_icon = tf_obj.find_element(css: "#shopify-section-header > store-header > div > div > div > ul > li:nth-child(3) > a")
        tf_obj.click_element(add_to_cart_icon)
        sleep(2)        
        
        close_btn = tf_obj.find_element(xpath: "//*[@id='mini-cart']/header/button")
        tf_obj.click_element(close_btn)
        sleep(3)
    end

    def go_to_help_center
        help = tf_obj.find_element(css: "#shopify-section-header > store-header > div > div > nav > desktop-navigation > ul > li:nth-child(7) > a")
        tf_obj.click_element(help)
        puts "Go to help center"
        sleep(2)
        help_search = tf_obj.find_element(id: "support-search-input")
        tf_obj.send_keys(help_search, "orders")
        tf_obj.send_keys(help_search, :enter)
        sleep(2)
        solution = tf_obj.find_element(xpath: "/html/body/div[1]/div[2]/section/ul[2]/li[1]/a")
        tf_obj.click_element(solution)
        sleep(2)
    end

    def go_to_home_page
        logo = tf_obj.find_element(css: "body > div.page > header > div > div > a > span > img")
        tf_obj.click_element(logo)
        puts "Go to home page"
        sleep(2)
    end

    def automate
        get_page_title
        search("mics")
        apply_filters
        add_to_cart
        go_to_help_center
        go_to_home_page
    end
end

tf_obj = AutomateHeadphonezone.new
tf_obj.automate


