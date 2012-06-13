Upload file to article

HTTP method PUT
PATH  /my_data/articles/{article_id}/files
Parameters  filedata
Content-type  multipart/form-data
import requests
from oauth_hook import OAuthHook
import json


OAuthHook.consumer_key = '123456'
OAuthHook.consumer_secret = '65xyAzi1'
oauth_hook = OAuthHook(header_auth=True)

client = requests.session(hooks={'pre_request': oauth_hook})

files = {'filedata':('test_dataset.xls', open('test_dataset.xls', 'rb'))}

response = client.put('http://api.figshare.com/my_data/articles/92285/files',
                      files=files)
results = json.loads(response.content)
print results
