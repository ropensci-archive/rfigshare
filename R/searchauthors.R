Search for an author

HTTP method GET
PATH  /my_data/authors
Parameters  search_for(mandatory), page
Content-type   
import requests
from oauth_hook import OAuthHook
import json


OAuthHook.consumer_key = '123456'
OAuthHook.consumer_secret = '65xyAzi1'
oauth_hook = OAuthHook(header_auth=True)

client = requests.session(hooks={'pre_request': oauth_hook})

response = client.get('http://api.figshare.com/my_data/authors?search_for=John Silva')
results = json.loads(response.content)
print results
