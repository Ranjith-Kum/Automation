from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import requests
import time

city = "Bangalore"    # Replace with the desired city name
url = f"https://www.zomato.com/{city}/restaurants"
file_path= "keywords/data.robot"
mode = 'w'  # 'w' for write mode, 'a' for append mode
headers = {'User-Agent': 'Chrome/135.0.7049.42'}
response = requests.get(url, headers=headers)
response.raise_for_status()  # Raise an exception for bad status codes
try:
    
    response = requests.post("https://www.zomato.com/webroutes/search/home", headers=headers)

    response = requests.get(url, headers=headers)
    # Get the page source after all content is loaded
    soup = BeautifulSoup(response.content, 'html.parser')
    
    # Open file to write data
    with open(file_path, mode, encoding='utf-8') as f:
        # Find all elements with class 'jumbo-tracker'
        # Try different possible class names
        possible_classes = ['.jumbo-tracker', '.restaurant-card']
        items = []
        for class_name in possible_classes:
            items = soup.select(class_name)
            if items:
                break
        
        # If no items found, try to find any container with restaurant data
        if not items:
            # Look for elements that likely contain restaurant information
            items = soup.find_all('div', attrs={
            'class': lambda x: x and any(keyword in x.lower() 
            for keyword in ['restaurant', 'jumbo', 'card', 'listing'])
            })
            print("List of Items:", items)
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
                # f.write(f"Restaurant #{index}\n")
                # f.write(f"#Name: {name}, Rating: {rating}, Cuisine: {cuisine} \n")
                # f.write(f"Rating: {rating}\n")
                # f.write(f"Cuisine: {cuisine}\n")
            except IndexError:
                continue
    time.sleep(2)  # Sleep for 2 seconds to allow the page to load
    print("Sueccessfully extracted the data for city:", city)
    
except requests.RequestException as e:
    print(f"unable to fetch data: {e}")


