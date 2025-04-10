from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
import time
import re
import pandas as pd

def setup_driver():
    """Set up and return a Chrome webdriver with appropriate options."""
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode (no GUI)
    chrome_options.add_argument("--disable-gpu")
    chrome_options.add_argument("--window-size=1920,1080")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service, options=chrome_options)
    return driver

def generate_xpath(element):
    """Generate different XPath variations for an element."""
    xpaths = []
    
    # Get element attributes
    element_id = element.get_attribute('id')
    element_class = element.get_attribute('class')
    element_text = element.text
    element_tag = element.tag_name
    
    # 1. By ID (most reliable if available)
    if element_id:
        xpaths.append({
            'xpath': f"//{element_tag}[@id='{element_id}']",
            'type': 'ID-based',
            'reliability': 'High'
        })
    
    # 2. By class
    if element_class:
        xpaths.append({
            'xpath': f"//{element_tag}[@class='{element_class}']",
            'type': 'Class-based',
            'reliability': 'Medium'
        })
        
        # Class contains (for multiple classes)
        if ' ' in element_class:
            for cls in element_class.split():
                xpaths.append({
                    'xpath': f"//{element_tag}[contains(@class, '{cls}')]",
                    'type': 'Partial class',
                    'reliability': 'Medium-Low'
                })
    
    # 3. By text content
    if element_text and element_text.strip():
        xpaths.append({
            'xpath': f"//{element_tag}[text()='{element_text}']",
            'type': 'Text-based exact',
            'reliability': 'Medium'
        })
        xpaths.append({
            'xpath': f"//{element_tag}[contains(text(), '{element_text.split()[0] if ' ' in element_text else element_text}')]",
            'type': 'Text-based partial',
            'reliability': 'Medium-Low'
        })
    
    # 4. By attributes (for common ones)
    for attr in ['name', 'placeholder', 'title', 'aria-label', 'href', 'src']:
        attr_value = element.get_attribute(attr)
        if attr_value:
            xpaths.append({
                'xpath': f"//{element_tag}[@{attr}='{attr_value}']",
                'type': f'Attribute-based ({attr})',
                'reliability': 'Medium'
            })
    
    return xpaths

def get_elements_info(url, search_term):
    """
    Scrape a webpage and find elements matching the search term,
    returning their name/text and XPath information.
    """
    driver = setup_driver()
    results = []
    
    try:
        # Open website
        driver.get(url)
        time.sleep(2)  # Allow page to load fully
        
        # Find elements that match search term in text or attributes
        all_elements = driver.find_elements(By.XPATH, "//*")
        matching_elements = []
        
        for element in all_elements:
            try:
                # Check element text
                if search_term.lower() in element.text.lower():
                    matching_elements.append(element)
                    continue
                
                # Check common attributes
                for attr in ['id', 'class', 'name', 'placeholder', 'title', 'aria-label']:
                    attr_value = element.get_attribute(attr)
                    if attr_value and search_term.lower() in attr_value.lower():
                        matching_elements.append(element)
                        break
            except:
                continue
        
        # Process matching elements
        for element in matching_elements:
            try:
                element_text = element.text.strip() if element.text else "[No visible text]"
                element_tag = element.tag_name
                element_xpaths = generate_xpath(element)
                
                element_info = {
                    'Element': f"{element_tag}: {element_text[:50] + ('...' if len(element_text) > 50 else '')}",
                    'Tag': element_tag,
                    'Text': element_text,
                    'XPaths': element_xpaths
                }
                results.append(element_info)
            except:
                continue
                
    except Exception as e:
        print(f"Error: {e}")
    finally:
        driver.quit()
        
    return results

def display_results(results):
    """Display the scraped elements information in a readable format."""
    if not results:
        print("No matching elements found.")
        return
    
    # Create a DataFrame for better display
    df_rows = []
    
    for i, result in enumerate(results, 1):
        element = result['Element']
        
        # Add each XPath variation as a separate row
        for xpath_info in result['XPaths']:
            df_rows.append({
                'Element #': i,
                'Element': element,
                'XPath': xpath_info['xpath'],
                'XPath Type': xpath_info['type'],
                'Reliability': xpath_info['reliability']
            })
    
    df = pd.DataFrame(df_rows)
    print(f"Found {len(results)} matching elements with {len(df_rows)} XPath variations")
    return df

def main():
    print("Web Element Scraper and XPath Generator")
    print("---------------------------------------")
    
    url = input("Enter the website URL to scrape: ")
    search_term = input("Enter the text/term to search for: ")
    
    print(f"\nScraping {url} for elements containing '{search_term}'...")
    results = get_elements_info(url, search_term)
    
    df = display_results(results)
    if isinstance(df, pd.DataFrame) and not df.empty:
        # Save results to CSV
        filename = f"xpath_results_{search_term.replace(' ', '_')}.csv"
        df.to_csv(filename, index=False)
        print(f"\nResults saved to {filename}")
        
        # Display first few results
        print("\nSample results:")
        print(df.head(10).to_string())

if __name__ == "__main__":
    main()