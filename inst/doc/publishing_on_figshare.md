

# Publishing On Figshare from R

Before you can use `rfigshare` effectively, you will need to set up your authentication credentials by obtaining a set of API keys from [FigShare.org](http://fishshare.org).  See our [Getting Started with rfigshare](https://github.com/ropensci/rfigshare/blob/master/inst/doc/getting_started.md) tutorial for a step by step guide.  


Now that you have created your credentials, we are ready to start posting content to FigShare using R.  

### Step 1: Create a new article


```r
require(rfigshare)
```



An article on FigShare can be a figure, poster, dataset, paper, or other media, and can contain an arbitrary number of files or attachements.  Each article has a unique ID number which we will use to interact with it.  All articles have the essential scientific metadata including a title, at least one author, and a description or abstract.  Categories can be selected from a fixed list, while articles can be assigned any tags.  This can be done step by step using dedicated functions, or simultaneously using the special function `fs_new_article`.  For example, the command


```r
id <- fs_new_article(title = "A Test of rfigshare", description = "This is a test of the fs_new_aricle function and related methods", 
    type = "figure", authors = c("Karthik Ram", "Scott Chamberlain"), tags = c("ecology", 
        "openscience"), categories = "Ecology", links = "http://ropensci.org", 
    files = "figure/rfigshare.png")
```

```
Your article has been created! Your id number is 95802
```

```
found ids for all authors
```


Creates a new article with the metadata given and returns the article id number, so we can make future modifications quickly.  

## Step 2: Examine and modify article

We can check out the details of our new article to confirm the successful creation:


```r
fs_details(id)
```

```
$article_id
[1] 95802

$title
[1] "A Test of rfigshare"

$views
[1] 0

$downloads
[1] 0

$shares
[1] 0

$doi
[1] "http://dx.doi.org/10.6084/m9.figshare.95802"

$defined_type
[1] "figure"

$status
[1] "Drafts"

$version
[1] 1

$published_date
[1] "23:18, Sep 10, 2012"

$description
[1] "This is a test of the fs_new_aricle function and related methods"

$total_size
[1] "17.78 KB"

$owner
$owner$id
[1] 96387

$owner$full_name
[1] "Carl Boettiger"


$authors
$authors[[1]]
$authors[[1]]$first_name
[1] "Carl"

$authors[[1]]$last_name
[1] "Boettiger"

$authors[[1]]$id
[1] 96387

$authors[[1]]$full_name
[1] "Carl Boettiger"


$authors[[2]]
$authors[[2]]$first_name
[1] "Karthik"

$authors[[2]]$last_name
[1] "Ram"

$authors[[2]]$id
[1] 97306

$authors[[2]]$full_name
[1] "Karthik Ram"


$authors[[3]]
$authors[[3]]$first_name
[1] "Scott"

$authors[[3]]$last_name
[1] "Chamberlain"

$authors[[3]]$id
[1] 96554

$authors[[3]]$full_name
[1] "Scott Chamberlain"



$tags
$tags[[1]]
$tags[[1]]$id
[1] 47864

$tags[[1]]$name
[1] "openscience"


$tags[[2]]
$tags[[2]]$id
[1] 11917

$tags[[2]]$name
[1] "ecology"



$categories
$categories[[1]]
$categories[[1]]$id
[1] 39

$categories[[1]]$name
[1] "Ecology"



$files
$files[[1]]
$files[[1]]$size
[1] "18 KB"

$files[[1]]$id
[1] 98324

$files[[1]]$mime_type
[1] "image/png"

$files[[1]]$name
[1] "rfigshare.png"



$links
$links[[1]]
$links[[1]]$link
[1] "http://ropensci.org"

$links[[1]]$id
[1] 673

```

Note that the submitter is automatically added as an author, though it will not hurt to specify them in the author list if you want anyway.  Note also the extra metadata we get, such as filesize and article views. (And hopefully we'll format that output to a pretty-printing version soon). 

If there is something we need to change, we can edit our article accordingly.  The `fs_update` function to modifies the title, description, and type, while `fs_add_tags`, `fs_add_categories`, `fs_add_authors` etc, can add missing data.  If we upload a new figure, it will overwrite this one.


```r
fs_update(id, title = "An awesome test of rfigshare")
```


# Step 3: Sharing or deleting your article

Once we are ready to share this, we can release the article privately or publicly.  We actually could have done this during our `fs_new_article` step by setting `visibility="private"`.  


```r
fs_make_private(id)
```

```
Response [http://api.figshare.com/v1/my_data/articles/95802/action/make_private]
  Status: 200
  Content-type: application/json; charset=UTF-8
{"success": "Article status changed to Private"} 
```


If we need to remove this example file we can delete it


```r
fs_delete(id)
```


Note that articles declared "public" cannot be deleted, and changes will appear as new versions of the same article.  `fs_details` can help you view particular versions of public articles.  
