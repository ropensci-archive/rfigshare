Add tags to article

HTTP method PUT
PATH  /my_data/articles/{article_id}/tags
Parameters  tag_name
Content-type  application/json
import requests
from oauth_hook import OAuthHook
import json


OAuthHook.consumer_key = '123456'
OAuthHook.consumer_secret = '65xyAzi1'
oauth_hook = OAuthHook(header_auth=True)

client = requests.session(hooks={'pre_request': oauth_hook})

body = {'tag_name':'cells'}
headers = {'content-type':'application/json'}

response = client.put('http://api.figshare.com/my_data/articles/92285/tags',
                        data=json.dumps(body), headers=headers)
results = json.loads(response.content)
print results
