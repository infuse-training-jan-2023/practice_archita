require_relative 'testFramework'

class AutomateHeadphonezone
    attr_accessor :obj, :wait

    def initialize
        # @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        @obj = Test_Framework.new
        @obj.navigate_to_url("https://www.headphonezone.in/")
    end

    def get_page_title
        puts "Page Title is #{obj.get_page_title}"
    end

    # def login
    #     email = "zwjxssrkhtquzmmppe@tmmbt.com"
    #     password = "abcdefgh1"

    #     if driver.find_element(:css, "#lion-loyalty-panel-custom-css div:nth-of-type(5) div a").displayed?
    #         driver.find_element(:css, "#lion-loyalty-panel-custom-css div:nth-of-type(5) div a").click
    #     end
    #     sleep(1)

    #     wait.until {driver.find_element(:xpath, "/html/body/div[3]/store-header/div/div/div/ul/li[2]/a")}
    #     driver.find_element(:xpath, "/html/body/div[3]/store-header/div/div/div/ul/li[2]/a").click
    #     sleep(1)

    #     driver.find_element(:id, "customer[email]").send_keys(email)
    #     driver.find_element(:id, "customer[password]").send_keys(password)
    #     driver.find_element(:css, "button.form__submit:nth-child(5)").click
    #     sleep(5)

    #     wait.until {driver.find_element(:xpath, "//*[@id='main']/div[1]/form/input[2]")}
    #     return "Asking for Captcha"

    #     # driver.find_element(:xpath, "//*[@id='main']/div[1]/form/input[2]").click
    #     # sleep(5)

    #     # begin
    #     #     if driver.find_element(:css, ".flits-header-title > h1").displayed?
    #     #         return "Login successfull"
    #     #     end
    #     # rescue => exception
    #     #     raise "Login failed"
    #     # end
    # end

    def search(search_txt)
        # sleep(2)
        # begin
        #     popup = obj.find_element(css: "#lion-loyalty-panel-custom-css div:nth-of-type(5) div a")
        #     if obj.is_displayed(popup)
        #         obj.click_element(popup)
        #     end
        # rescue => e
        #     puts e.message
        # end
        popup = obj.find_element(css: "#lion-loyalty-panel-custom-css div:nth-of-type(5) div a")
        obj.click_element(popup)
        sleep(2)

        search_icon = obj.find_element(css: "ul.header__linklist:nth-child(2) > li:nth-child(1) > a:nth-child(1)")
        # wait.until{search_icon}
        obj.click_element(search_icon)
        sleep(2)

        search_input = obj.find_element(css: ".predictive-search__input")
        # wait.until{search_input}
        obj.send_keys(search_input, search_txt)
        sleep(2)

        found = obj.find_element(css: "#search-drawer > footer > button")        
        if obj.get_text(found) == "VIEW ALL RESULTS"
            puts "Search successfull for #{search_txt}"
            obj.click_element(found)
        else
            puts "#{search_txt} not found"
        end
        sleep(2)
    end

    def apply_filters
        brand = obj.find_element(css: "#facet-filters-form > div > div:nth-child(1) > button")
        obj.click_element(brand)
        obj.send_keys(brand, :arrow_down)
        obj.send_keys(brand, :arrow_down)
        obj.send_keys(brand, :arrow_down)
        obj.send_keys(brand, :arrow_down)
        brand_opt1 = obj.find_element(xpath: '//*[@id="filter.p.vendor-1"]')
        obj.click_element(brand_opt1)        
        brand_opt2 = obj.find_element(xpath: '//*[@id="filter.p.vendor-4"]')
        obj.click_element(brand_opt2)
        obj.click_element(brand)
        puts "Filter applied"
        # sleep(2)

        item = obj.find_element(css: "#facet-main > product-list > div > product-item:nth-child(4)")
        obj.click_element(item)
        sleep(3)
    end

    def add_to_cart
        add_to_cart_btn = obj.find_element(css: "#AddToCart > span.loader-button__text")
        obj.click_element(add_to_cart_btn)
        sleep(3)

        add_to_cart_success = obj.find_element(xpath: "//*[@id='shopify-section-header']/cart-notification/div/div/div")
        if obj.is_displayed(add_to_cart_btn)
            puts "Added to cart"
        else
            puts "Not added to cart"
        end

        add_to_cart_icon = obj.find_element(css: "#shopify-section-header > store-header > div > div > div > ul > li:nth-child(3) > a")
        obj.click_element(add_to_cart_icon)
        sleep(2)        
        
        close_btn = obj.find_element(xpath: "//*[@id='mini-cart']/header/button")
        obj.click_element(close_btn)
        sleep(3)
    end

    def go_to_help_center
        help = obj.find_element(css: "#shopify-section-header > store-header > div > div > nav > desktop-navigation > ul > li:nth-child(7) > a")
        obj.click_element(help)
        puts "Go to help center"
        sleep(2)
        help_search = obj.find_element(id: "support-search-input")
        obj.send_keys(help_search, "orders")
        obj.send_keys(help_search, :enter)
        sleep(2)
        solution = obj.find_element(xpath: "/html/body/div[1]/div[2]/section/ul[2]/li[1]/a")
        obj.click_element(solution)
        sleep(2)
    end

    def go_to_home_page
        logo = obj.find_element(css: "body > div.page > header > div > div > a > span > img")
        obj.click_element(logo)
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

obj = AutomateHeadphonezone.new
obj.automate


