Make the article public

HTTP method PUT
PATH  /my_data/articles/{article_id}/action/make_public
Parameters  
Content-type   
import requests
from oauth_hook import OAuthHook
import json


OAuthHook.consumer_key = '123456'
OAuthHook.consumer_secret = '65xyAzi1'
oauth_hook = OAuthHook(header_auth=True)

client = requests.session(hooks={'pre_request': oauth_hook})

response = client.post('http://api.figshare.com/my_data/articles/92285/action/make_public')
results = json.loads(response.content)
print results
