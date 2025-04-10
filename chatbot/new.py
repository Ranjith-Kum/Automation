import os
import subprocess

os.environ["TOP_LOCATION[0]"] = "Bengaluru" # Value should be from the list of zomato locations
os.environ["TOP_RESTAURANT[0]"] = "Hard Rock Cafe" # Value should be from the list of zomato restaurants with Table booking option
os.environ["TOP_LOCATION[1]"] = "Bengaluru" # Value should be from the list of zomato locations
os.environ["TOP_RESTAURANT[1]"] = "Arogya Ahaara" # Value should be from the list of zomato restaurants with Table booking option
os.environ["TOP_LOCATION[2]"] = "Bengaluru" # Value should be from the list of zomato locations
os.environ["TOP_RESTAURANT[2]"] = "Empire Restaurant" # Value should be from the list of zomato restaurants with Table booking option
os.environ["TOP_LOCATION[3]"] = "Bengaluru" # Value should be from the list of zomato locations
os.environ["TOP_RESTAURANT[3]"] = "PLaY Arena" # Value should be from the list of zomato restaurants with Table booking option
os.environ["TOP_LOCATION[4]"] = "Bengaluru" # Value should be from the list of zomato locations
os.environ["TOP_RESTAURANT[4]"] = "HYDERABAD CHEFS" # Value should be from the list of zomato restaurants with Table booking option
os.environ["TOP_LOCATION[5]"] = "Bengaluru" # Value should be from the list of zomato locations
os.environ["TOP_RESTAURANT[5]"] = "Arogya Ahaara → Arogya" # Value should be from the list of zomato restaurants with Table booking option
os.environ["TOP_LOCATION[6]"] = "Bengaluru" # Value should be from the list of zomato locations
os.environ["TOP_RESTAURANT[6]"] = "Domino's Pizza" # Value should be from the list of zomato restaurants with Table booking option
os.environ["TOP_LOCATION[7]"] = "Bengaluru" # Value should be from the list of zomato locations
os.environ["TOP_RESTAURANT[7]"] = "Imdad's Biryani" # Value should be from the list of zomato restaurants with Table booking option
os.environ["TOP_LOCATION[8]"] = "Bengaluru" # Value should be from the list of zomato locations
os.environ["TOP_RESTAURANT[8]"] = "McDonald's" # Value should be from the list of zomato restaurants with Table booking option
os.environ["TOP_LOCATION[9]"] = "Bengaluru" # Value should be from the list of zomato locations
os.environ["TOP_RESTAURANT[9]"] = "Toit Brewpub" # Value should be from the list of zomato restaurants with Table booking option

os.environ["APP"] = "Zomato" # Accepted Values EG: Zomato, Eazy Diner
os.environ["URLWITHCITY"] = "https://www.zomato.com/bangalore/restaurants" # Provide Zomato or Eazy Diner URL with City
os.environ["GUEST_COUNT"] = "4" # Accepted Range EG: 2 to 10
os.environ["DATE"] = "Tomorrow" # Accepted Values EG: Today, Tomorrow, Tue, 25 Mar, Fri, 28 Mar
os.environ["TIME_SLOT"] = "Dinner" # Accepted Values EG: Lunch, Dinner
os.environ["TIMING"] = "8:00 PM" # Accepted Format EG: 8:00 PM, 10:00 PM
subprocess.run(['robot', '../Automation/Testsuites/Zomato_Booking.robot'], check=True)