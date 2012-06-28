# createarticle.R
# author: Carl Boettiger
# date: 28 June 2012


OAuthHook.consumer_key = '123456'
OAuthHook.consumer_secret = '65xyAzi1'
oauth_hook = OAuthHook(header_auth=True)

client = requests.session(hooks={'pre_request': oauth_hook})

body = {'title':'Test dataset', 'description':'Test description','defined_type':'dataset'}
headers = {'content-type':'application/json'}

response = client.post('http://api.figshare.com/my_data/articles',
                        data=json.dumps(body), headers=headers)

results = json.loads(response.content)


#'createarticle Create a new article in figshare
#'@param cred Your figshare OAUth credentials
#'@param name Name of your new article
#'@param curl Optional. If using in a loop, call getCurlHandle() first and pass
#'  the returned value in here (avoids unnecessary footprint)
#' @param ... optional additional curl options. Useful for debugging purposes.
#'@return JSON object containing your document ID if successful.
#'@export
#'@examples \dontrun{
#' createArticle(cred, 'folder_name')
#'}
createArticle <- function(cred = NULL, name = NULL, ..., curl = getCurlHandle()) {
if (!is(cred, "Credentials"))
        stop("Invalid or missing credentials. 
              ?figshare_auth for more information.",
             call. = FALSE)
    if (length(name) > 1) 
        return(lapply(name, function(x) createFolder(cred, x, curl = curl)))

    folder_obj <- toJSON(list(name = name), collapse = "")  
    ans <- OAuthRequest(cred, "http://api.mendeley.com/oapi/library/folders/",
        list(folder = folder_obj), "POST")  
    cat("New article successfully created \n")
    new("MendeleyFolderID", fromJSON(ans))
}
# API: http://api.figshare.com/docs/intro.html 

