Check the article details

HTTP method GET
PATH  /my_data/articles/{article_id}
Parameters  
Content-type  


OAuthHook.consumer_key = '123456'
OAuthHook.consumer_secret = '65xyAzi1'
oauth_hook = OAuthHook(header_auth=True)

client = requests.session(hooks={'pre_request': oauth_hook})

response = client.put('http://api.figshare.com/my_data/articles/92285')
results = json.loads(response.content)
print results
