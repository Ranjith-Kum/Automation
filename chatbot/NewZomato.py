import os
import subprocess
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import requests
import time

city = "Bangalore"    # Replace with the desired city name
url = f"https://www.zomato.com/{city}/restaurants"
file_path= "keywords/data.robot"
mode = 'w'  # 'w' for write mode, 'a' for append mode
headless_mode = True  # Set to True for headless mode, False for normal mode
browser = "Chrome"  # Set to "Chrome" or "Edge" based on your preference

# Add the browser options
options = Options()
options.add_argument('--headless=new')
options.add_argument('--disable-gpu')  # Required for Windows
options.add_argument('--window-size=1920,1080')  # Optional: Set window size
options.add_argument('--no-sandbox')  # Optional: Disable sandboxing
options.add_argument('--disable-dev-shm-usage')  # Optional: Disable shared memory usage
options.add_argument('--disable-blink-features=AutomationControlled')
options.add_argument('--user-agent=Chrome/135.0.7049.42')

try:
    # Initialize the webdriver
    if headless_mode == True: 
        if browser == "Chrome":
            driver = webdriver.Chrome(options=options)
        elif browser == "Edge":
            driver = webdriver.Edge(options=options)
        else:
            print("Unsupported browser. Please use 'Chrome' or 'Edge'.")
    else:
        if browser == "Chrome":
            driver = webdriver.Chrome()
            driver.maximize_window()
        elif browser == "Edge":
            driver = webdriver.Edge()
            driver.maximize_window()
        else:
            print("Unsupported browser. Please use 'Chrome' or 'Edge'.")
    driver.get(url)
except Exception as e:
    print(f"Error initializing the webdriver: {e}")
    exit(1)

try:
    # Scroll to the bottom of the page until no new content loads
    last_height = driver.execute_script("return document.body.scrollHeight")
    while True:
        # Scroll down
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
        # Wait for new content to load
        time.sleep(3)
        
        # Calculate new scroll height
        new_height = driver.execute_script("return document.body.scrollHeight")
        if new_height == last_height:
            break
        last_height = new_height

    # Get the page source after all content is loaded
    soup = BeautifulSoup(driver.page_source, 'html.parser')
    
    # Open file to write data
    with open(file_path, mode, encoding='utf-8') as f:
        # Find all elements with class 'jumbo-tracker'
        items = soup.select('.jumbo-tracker')
        if mode == 'w':
            f.write("*** Variables ***\n")
        f.write(f"\n# Total number of restaurants found in {city}: {len(items)}\n\n")
        # Iterate through items with index
        for index, item in enumerate(items, 1):
            try:
                name = ' '.join(item.select('h4')[0].text.strip().split())
                # rating = item.select('div')[0].text.strip()
                # cuisine = item.select('p')[0].text.strip()
                restaurant_url = item.select('a')[0]['href']
                
                f.write(f"${{{name}}}    https://zomato.com{restaurant_url}\n")
                # f.write(f"#Name: {name}, Rating: {rating}, Cuisine: {cuisine} \n")
            except IndexError:
                continue
    time.sleep(2)  # Sleep for 2 seconds to allow the page to load
    print("Sueccessfully extracted the data for city:", city)
    
except requests.RequestException as e:
    print(f"unable to fetch data: {e}")

# List the restaurants with table booking option
os.environ["TOP_RESTAURANT[0]"] = "Sozo Skyline" 
os.environ["TOP_RESTAURANT[1]"] = "Hard Rock Cafe" 
os.environ["TOP_RESTAURANT[2]"] = "Empire Restaurant"  
os.environ["TOP_RESTAURANT[3]"] = "PLaY Arena"  
os.environ["TOP_RESTAURANT[4]"] = "HYDERABAD CHEFS"  
os.environ["TOP_RESTAURANT[5]"] = "Arogya Ahaara → Arogya"  
os.environ["TOP_RESTAURANT[6]"] = "Domino's Pizza"  
os.environ["TOP_RESTAURANT[7]"] = "Imdad's Biryani"  
os.environ["TOP_RESTAURANT[8]"] = "McDonald's"  
os.environ["TOP_RESTAURANT[9]"] = "Toit Brewpub"  

os.environ["URLWITHCITY"] = url # Provide Zomato or Eazy Diner URL with City
os.environ["GUEST_COUNT"] = "4" # Accepted Range EG: 2 to 10
os.environ["DATE"] = "Tomorrow" # Accepted Values EG: Today, Tomorrow, Tue, 25 Mar, Fri, 28 Mar
os.environ["TIME_SLOT"] = "Dinner" # Accepted Values EG: Lunch, Dinner
os.environ["TIMING"] = "8:00 PM" # Accepted Format EG: 8:00 PM, 10:00 PM
subprocess.run(['robot', '../Automation/Testsuites/NewZomato.robot'], check=True)