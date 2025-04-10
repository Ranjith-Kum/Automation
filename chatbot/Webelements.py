from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.edge.options import Options
import json
import os
import time

browser= "Edge" # Set to "Chrome" for Chrome browser, "Edge" for Edge browser
headless_mode = True # Set to True for headless mode, False for normal mode

Login_Required = True # Set to True if login is required, otherwise set to False
file_path = 'locators.robot' # Specify the path to save the locator variables

Login_URL = "https://mag-qa.iconectiv.com/mag-gui/web/#/login" # Only Specify if login is required
User_Name = "tz_rkumar+mpctadmin@iconectiv.com" # Specify the username for login
Password = "gui@12345" # Specify the password for login

UserName_ID = "supportInputEmail" # Specify the ID of the username field
Password_ID = "ngPasswordInput" # Specify the ID of the password field
LoginButton_ID = "ngLogInbtn" # Specify the ID of the login button
Logout_ID = "logout" # Specify the ID of the logout button
LogoutConfirmation_XPATH = "//button[normalize-space()='Ok']" # Specify the XPATH of the logout confirmation button

# List of URLs to process, If login is not required, you can specify the URLs directly
URL_List = [
        "https://mag-qa.iconectiv.com/mag-gui/web/#/worklist",
        "https://mag-qa.iconectiv.com/mag-gui/web/#/timers",
        "https://mag-qa.iconectiv.com/mag-gui/web/#/timersviolation",
        "https://mag-qa.iconectiv.com/mag-gui/web/#/switching-report",
        "https://mag-qa.iconectiv.com/mag-gui/web/#/sla-report",
        "https://mag-qa.iconectiv.com/mag-gui/web/#/profile"
    ] # Add more URLs as needed

TAG_List = ["input", "button", "select", "textarea", "a"] # Add more tags as needed
Attribute_List = ["id", "class", "formcontrolname"]  # List of attributes in order of preference
mode = "w" # Set to "a" for appending new data to existing file data and "w" for overriding existing file data with new data

# Add the browser options
options = Options()
options.add_argument('--headless')
options.add_argument('--disable-gpu')  # Required for Windows
options.add_argument('--window-size=1920,1080')  # Optional: Set window size
options.add_argument('--no-sandbox')  # Optional: Disable sandboxing
options.add_argument('--disable-dev-shm-usage')  # Optional: Disable shared memory usage

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

if Login_Required == True:
    try:
        # First get locators for login page
        driver.get(Login_URL)
        time.sleep(5)
        print(f"Processing page: {driver.title}")

        login_page_elements = {}  
        found_elements = set()  # Track elements already found
        
        for tag in TAG_List:
            login_elements = driver.find_elements(By.TAG_NAME, tag)
            for element in login_elements:
                for attr in Attribute_List:
                    element_attr = element.get_attribute(attr)
                    if element_attr and element_attr not in found_elements:
                        xpath = f"//{tag}[@{attr}='{element_attr}']"
                        login_page_elements[f"business_{element_attr}"] = xpath  # Add prefix when storing
                        found_elements.add(element_attr)
                        break  # Skip remaining attributes for this element

        # Read existing elements from file if it exists
        existing_elements = set()
        if os.path.exists(file_path):
            with open(file_path, 'r') as f:
                for line in f:
                    if line.startswith('${'):
                        element_id = line[2:line.find('}')]
                        # Remove prefix if it exists for comparison
                        if element_id.startswith('business_'):
                            element_id = element_id[9:]
                        existing_elements.add(element_id)

        # Filter out elements that already exist
        new_elements = {
            element_id: xpath 
            for element_id, xpath in login_page_elements.items() 
            if element_id.replace('business_', '') not in existing_elements
        }

        # Only write to file if there are new elements
        if new_elements:
            with open(file_path, (mode)) as f:
                if not existing_elements:  # Write header only if file was empty
                    f.write("*** Variables ***\n")
                f.write(f"\n# Page: {driver.title}\n")
                for element_id, xpath in new_elements.items():
                    f.write(f"${{{element_id}}}    {xpath}\n")
                print(f"Login page locators saved ({len(new_elements)} new elements)")
        else:
            print(f"No new {driver.title} page locators to save")
    except Exception as e:
        print(f"Error saving {driver.title} locators: {e}")

    try:
        # Perform login
        username_field = driver.find_element(By.ID, (UserName_ID))
        password_field = driver.find_element(By.ID, (Password_ID))
        login_button = driver.find_element(By.ID, (LoginButton_ID))
        username_field.send_keys(User_Name)
        password_field.send_keys(Password)
        login_button.click()
        time.sleep(5)

    except Exception as e:
        print(f"Error during login: {e}")

    # Get locators for other pages
    try:
        for url in URL_List:
            driver.get(url)
            time.sleep(10)
            print(f"Processing page: {driver.title}")

            page_elements = {}
            found_elements = set()  # Track elements already found
            for tag in TAG_List:
                login_elements = driver.find_elements(By.TAG_NAME, tag)
                for element in login_elements:
                    for attr in Attribute_List:
                        element_attr = element.get_attribute(attr)
                        if element_attr and element_attr not in found_elements:
                            xpath = f"//{tag}[@{attr}='{element_attr}']"
                            page_elements[f"business_{element_attr}"] = xpath  # Add prefix when storing
                            found_elements.add(element_attr)
                            break  # Skip remaining attributes for this element

            # Read existing elements from file if it exists
            existing_elements = set()
            if os.path.exists(file_path):
                with open(file_path, 'r') as f:
                    for line in f:
                        if line.startswith('${'):
                            element_id = line[2:line.find('}')]
                            # Remove prefix if it exists for comparison
                            if element_id.startswith('business_'):
                                element_id = element_id[9:]
                            existing_elements.add(element_id)

            # Filter out elements that already exist
            new_elements = {
                element_id: xpath 
                for element_id, xpath in page_elements.items() 
                if element_id.replace('business_', '') not in existing_elements
            }

            # Only write to file if there are new elements
            if new_elements:
                with open(file_path, "a") as f:
                    f.write(f"\n# Page: {driver.title}\n")
                    for element_id, xpath in new_elements.items():
                        f.write(f"${{{element_id}}}    {xpath}\n")
                    print(f"{driver.title} locators saved ({len(new_elements)} new elements)")
            else:
                print(f"No new {driver.title} page locators to save")
        try:
            #Perform logout
            login_out_button = driver.find_element(By.ID, (Logout_ID))
            login_out_button.click()
            time.sleep(2)
            login_out_confirmation_button = driver.find_element(By.XPATH, (LogoutConfirmation_XPATH))
            login_out_confirmation_button.click()
            time.sleep(5)
            print("Logged out successfully")
        except Exception as e:
            print(f"An error occurred while logging out: {e}")

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        driver.quit()

else:
    try:
        for url in URL_List:
            driver.get(url)
            time.sleep(10)
            print(f"Processing page: {driver.title}")

            page_elements = {}
            found_elements = set()  # Track elements already found
            for tag in TAG_List:
                login_elements = driver.find_elements(By.TAG_NAME, tag)
                for element in login_elements:
                    for attr in Attribute_List:
                        element_attr = element.get_attribute(attr)
                        if element_attr and element_attr not in found_elements:
                            xpath = f"//{tag}[@{attr}='{element_attr}']"
                            page_elements[element_attr] = xpath
                            found_elements.add(element_attr)
                            break  # Skip remaining attributes for this element
            
            # Read existing elements from file if it exists
            existing_elements = set()
            if os.path.exists(file_path):
                with open(file_path, 'r') as f:
                    for line in f:
                        if line.startswith('${'):
                            element_id = line[2:line.find('}')]
                            existing_elements.add(element_id)

            # Filter out elements that already exist
            new_elements = {
                element_id: xpath 
                for element_id, xpath in page_elements.items() 
                if element_id not in existing_elements
            }

            # Only write to file if there are new elements
            if new_elements:
                with open(file_path, (mode)) as f:
                    if not existing_elements:  # Write header only if file was empty
                        f.write("*** Variables ***\n")
                    f.write(f"\n# Page: {driver.title}\n")
                    for element_id, xpath in new_elements.items():
                        f.write(f"${{{element_id}}}    {xpath}\n")
                print(f"{driver.title} page locators saved ({len(new_elements)} new elements)")
            else:
                print(f"No new {driver.title} page locators to save")

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        driver.quit()