require 'selenium-webdriver'

class Exercise_12
    attr_accessor :driver, :site, :wait

    def initialize(path_to_driver, url)
        @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        Selenium::WebDriver::Chrome.driver_path = path_to_driver
        @driver = Selenium::WebDriver.for :chrome
        @site_url = url
        @driver.manage.window.maximize
        @driver.get(@site_url)
    end
    
    def login()
        email = "madhusamudra77@gmail.com"
        password = "stackoverflow11"

        wait.until { driver.find_element(:css, "nav ol li:nth-of-type(3) a") }
        driver.find_element(:css, "nav ol li:nth-of-type(3) a").click
        sleep(2)
        wait.until { driver.find_element(:id, "formContainer") }
        driver.find_element(:id, "email").send_keys(email)
        driver.find_element(:id, "password").send_keys(password)
        driver.find_element(:id, "submit-button").click
        sleep(2)
    end

    def search()
        if driver.find_element(:class, "js-accept-cookies").displayed?
            driver.find_element(:class, "js-accept-cookies").click
        end
        sleep(3)

        wait.until { driver.find_element(:name, "q") }
        search_bar = driver.find_element(:name, "q")
        search_bar.send_keys("ruby")
        sleep(2)
        search_bar.send_keys(:enter)
        driver.navigate.to "https://stackoverflow.com/questions/tagged/ruby"
        sleep(2)

        # wait.until { driver.find_element(:id, "recaptcha-anchor") }
        # driver.find_element(:id, "recaptcha-anchor").click
    end

    def filter()
        driver.find_elements(:css, ".flex--item").each do |x| 
            if x.text == "Filter"
                x.click
            end
        end
        sleep(1)
        driver.find_element(:css, "[name=sortId][value=MostVotes]").click
        sleep(1)
        driver.find_elements(:css, ".flex--item button").each do |x| 
            if x.text == "Cancel"
                x.click
            end
        end
        sleep(2)
    end

    def check_question()
        wait.until { driver.find_element(:css, "#question-summary-75202386  .s-post-summary--content h3 a") }
        driver.find_element(:css, "#question-summary-75202386  .s-post-summary--content h3 a").click
        sleep(2)
        driver.execute_script("window.scrollTo(0, 900)")
        wait.until { driver.find_element(:id, "answer-sort-dropdown-select-menu") }
        Selenium::WebDriver::Support::Select.new(driver.find_element(:id, "answer-sort-dropdown-select-menu")).select_by(:value, "trending")
        sleep(3)
        wait.until { driver.find_element(:id, "answer-75202684") }
        driver.find_element(:css, "#answer-75202684 .votecell .js-voting-container .js-vote-up-btn").click
        driver.find_element(:id, "saves-btn-75202684").click
        sleep(2)
    end

    def go_to_users()
        wait.until { driver.find_element(:css, "nav ol li:nth-of-type(2) a") }
        driver.find_element(:css, "nav ol li:nth-of-type(2) a").click
        sleep(2)
    end

    def go_to_settings()
        wait.until { driver.find_element(:css, ".js-user-header") }
        driver.find_element(:css, ".js-user-header a[href='/users/preferences/21061391']").click
        sleep(2)
        if driver.find_element(:id, 'enableForcedDark').selected? 
            driver.find_element(:id, "enableForcedLight").click 
        else
            driver.find_element(:id, 'enableForcedDark').click
        end
        sleep(2)
    end

    def automate()
        search()
        login()
        filter()
        check_question()
        go_to_users()
        go_to_settings()
    end    
end

path_to_driver = "C:\\Users\\Archita\\Documents\\Work_Infuse\\Training\\selenium\\chromedriver_win32\\chromedriver.exe"
site = "https://stackoverflow.com/"
ex12 = Exercise_12.new(path_to_driver, site)
ex12.automate()