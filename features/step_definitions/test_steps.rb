Given(/^Открываю в браузере BANKEX$/) do
    @driver.get('https://sso-uat.bankexlab.com')
    @driver.manage().window().maximize()
end

Then(/^Открываю в браузере окно восстановления пароля$/) do
    @driver.get('https://sso-uat.bankexlab.com/password-reset/' + "#{$token}")
    @driver.manage().window().maximize()
end

When(/^Нажимаю "(.*)"$/) do |elm|
    el = @driver.find_element(xpath: "//*[contains(text(), '#{elm}')]")
    el if el && el.displayed?
    el.click
end

And(/^Ввожу "(.*)": "(.*)"$/) do |elm, elm2|
    el = @driver.find_element(xpath: "//input[@placeholder = '#{elm}']")
    el if el && el.displayed?
    el.send_keys elm2
end

And(/^Нажимаю подтверждение$/) do
    el = @driver.find_element(xpath: "//button[@type = 'submit']")
    el if el && el.displayed?
    el.click
end

And(/^Принимаю соглашение на первом этапе$/) do
    @driver.switch_to.default_content()
    @driver.action.send_keys(:page_down).perform
    sleep 3
    el = @driver.find_element(css: "#isAgreement-generic-0")
    el if el && el.displayed?
    el.click
    # el2 = @driver.find_element(xpath: "//input[@id = 'euAgreement']")
    # el2 if el2 && el2.displayed?
    # el2.click
end

And(/^Принимаю соглашение на втором этапе$/) do
    @driver.action.send_keys(:page_down).perform
    @driver.action.send_keys(:page_down).perform
    el = @driver.find_element(css: "#isAgreement-EU-0")
    el if el && el.displayed?
    el.click
    el2 = @driver.find_element(css: "#isAgreement-EU-1")
    el2 if el2 && el2.displayed?
    el2.click
    el3 = @driver.find_element(css: "#isAgreement-EU-2")
    el3 if el3 && el3.displayed?
    el3.click
    el4 = @driver.find_element(css: "#isAgreement-EU-3")
    el4 if el4 && el4.displayed?
    el4.click
end

# And(/^Прохожу Captcha$/) do
#     elem = @driver.find_element(css: "#g-recaptcha > div > div > iframe")
#     @driver.switch_to.frame(elem)
#     el = @driver.find_element(xpath: "//div[@class = 'recaptcha-checkbox-checkmark']")
#     el if el && el.displayed?
#     el.click
#     sleep 100
# end

And(/^Нажимаю OK$/) do
    # @driver.switch_to.default_content()
    # el = @driver.find_element(xpath: "//button/span[text() = 'OK']")
    # el if el && el.displayed?
    # el.click
    driver.switch_to.alert.accept()
    sleep 10
end


And(/^Прохожу Captcha$/) do
    sleep 100
end