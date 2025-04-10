# pylint: disable=C0103, C0114, C0116
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import EdgeChromiumDriverManager




def get_chromedriver_path():
    
    chrome_path = ChromeDriverManager().install()

    return chrome_path


def get_edgedriver_path():
    
    edge_path = EdgeChromiumDriverManager().install()
 
    return edge_path


def get_firefox_path():
    
    firefox_path = GeckoDriverManager().install()
  
    return firefox_path
