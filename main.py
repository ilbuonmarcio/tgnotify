import requests
import sys
import os
from dotenv import load_dotenv
load_dotenv()

message = "".join(sys.stdin)

TOKEN = os.getenv('BOT_TOKEN')
chat_id = os.getenv('CHAT_ID')

url = f"https://api.telegram.org/bot{TOKEN}/sendMessage?chat_id={chat_id}&text={message}"
requests.get(url)