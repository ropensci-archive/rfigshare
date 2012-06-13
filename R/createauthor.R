Create new author

HTTP method POST
PATH  /my_data/authors
Parameters  full_name
Content-type  application/json
import requests
from oauth_hook import OAuthHook
import json


OAuthHook.consumer_key = '123456'
OAuthHook.consumer_secret = '65xyAzi1'
oauth_hook = OAuthHook(header_auth=True)

client = requests.session(hooks={'pre_request': oauth_hook})

body = {'full_name':'John Carter'}
headers = {'content-type':'application/json'}

response = client.post('http://api.figshare.com/my_data/authors',
                        data=json.dumps(body), headers=headers)
results = json.loads(response.content)
print results
