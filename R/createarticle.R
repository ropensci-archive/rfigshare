
OAuthHook.consumer_key = '123456'
OAuthHook.consumer_secret = '65xyAzi1'
oauth_hook = OAuthHook(header_auth=True)

client = requests.session(hooks={'pre_request': oauth_hook})

body = {'title':'Test dataset', 'description':'Test description','defined_type':'dataset'}
headers = {'content-type':'application/json'}

response = client.post('http://api.figshare.com/my_data/articles',
                        data=json.dumps(body), headers=headers)

results = json.loads(response.content)
