from selenium import webdriver
from selenium.webdriver.firefox.options import Options as FFOptions


ff_options = FFOptions()
ff_options.add_argument("--disable-gpu")
ff_options.add_argument("--no-sandbox")
ff_options.add_argument("--headless")
driver = webdriver.Firefox(options=ff_options)

# # Set up Firefox options
# options = Options()
# options.headless = True  # Run in headless mode
# options.add_argument("--no-sandbox")
# options.add_argument("--disable-dev-shm-usage")

# # Initialize the WebDriver with the specified options
# driver = webdriver.Firefox(options=options)

# Example usage
driver.get("http://demostore.supersqa.com")
print(f"Current page Title = {driver.title}")

# Quit the browser
driver.quit()
