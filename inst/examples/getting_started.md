# Getting Started with rfigshare

![](http://farm9.staticflickr.com/8180/7950489358_ea902bdaae_o.png)


## Obtaining your API keys

Note that there is a nice video introduction to creating applications for the API on the [figshare blog](http://figshare.com/blog/figshare_API_available_to_all/48).  The following tutorial provides a simple walkthrough of how to go about getting your figshare API keys set up so that you can use the `rfigshare` package.  


Create a user account on [FigShare](http://figshare.com) and log in.  From your homepage, select "Applications" from the drop-down menu,

![](http://farm9.staticflickr.com/8171/7950489558_5172515057_o.png)

Create a new application:

![](http://farm9.staticflickr.com/8038/7950490158_7feaf680bd_o.png)


Enter in the following information: 

![](http://farm9.staticflickr.com/8305/7950490562_02846cea92_o.png)

Then navigate over to the permissions tab.  To get the most out of `rfigshare` you'll want to enable all permissions:

![](http://farm9.staticflickr.com/8448/7950491064_c3820e62bd_o.png)

Save the new settings, and then open the application again (View/Edit menu) and click on the "Access Codes" tab.

![](http://farm9.staticflickr.com/8308/7950491470_621da9c5d1_o.png)

Record each if the keys into R as follows.  You might want to put this bit of R code into your `.Rprofile` to avoid entering it each time in the future:

```r
options(FigshareKey = "qMDabXXXXXXXXXXXXXXXXX")
options(FigsharePrivateKey = "zQXXXXXXXXXXXXXXXXXXXX")
options(FigshareToken = "SrpxabQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
options(FigsharePrivateToken = "yqXXXXXXXXXXXXXXXXXXXX")
```

That's it! You are now ready to start using figshare.  Recall you can install the package directly from Github using: 

```r
require(devtools)
install_github("rfigshare", "ropensci")
```

Try authenticating with your credentials:


```r
require(rfigshare)
```

```
## Loading required package: rfigshare
```

```r
fs_auth()
```



Try a search for an author, or get the details on a paper:


```r
fs_author_search("Boettiger")
```

```
## Response [http://api.figshare.com/v1/my_data/authors?search_for=Boettiger]
##   Status: 200
##   Content-type: application/json; charset=UTF-8
## {"pages": 0, "results": 1, "start": 0, "per_page": 10, "items": [{"id": "96387", "fname": "Carl", "lname": "Boettiger", "full_name": "Carl Boettiger", "job_title": "", "description": "", "facebook": "", "twitter": "", "active": 1}]} 
```

```r
fs_details("138")
```

```
## Warning: text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## Loading required package: rjson
```

```
## $article_id
## [1] 138
## 
## $title
## [1] "Labrid adaptive peaks"
## 
## $views
## [1] 56
## 
## $downloads
## [1] 0
## 
## $shares
## [1] 0
## 
## $doi
## [1] "http://dx.doi.org/10.6084/m9.figshare.138"
## 
## $defined_type
## [1] "figure"
## 
## $status
## [1] "Public"
## 
## $version
## [1] 1
## 
## $published_date
## [1] "13:45, Dec 30, 2011"
## 
## $description
## [1] "Described in the notebook: http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Comparative_Phylogenetics/2010/03/12"
## 
## $total_size
## [1] "29.71 KB"
## 
## $owner
## $owner$id
## [1] 96387
## 
## $owner$full_name
## [1] "Carl Boettiger"
## 
## 
## $authors
## $authors[[1]]
## $authors[[1]]$first_name
## [1] "Carl"
## 
## $authors[[1]]$last_name
## [1] "Boettiger"
## 
## $authors[[1]]$id
## [1] 96387
## 
## $authors[[1]]$full_name
## [1] "Carl Boettiger"
## 
## 
## 
## $tags
## $tags[[1]]
## $tags[[1]]$id
## [1] 277
## 
## $tags[[1]]$name
## [1] "comparative methods"
## 
## 
## $tags[[2]]
## $tags[[2]]$id
## [1] 276
## 
## $tags[[2]]$name
## [1] "phylogenetics"
## 
## 
## $tags[[3]]
## $tags[[3]]$id
## [1] 275
## 
## $tags[[3]]$name
## [1] "fins"
## 
## 
## $tags[[4]]
## $tags[[4]]$id
## [1] 274
## 
## $tags[[4]]$name
## [1] "labrids"
## 
## 
## 
## $categories
## $categories[[1]]
## $categories[[1]]$id
## [1] 24
## 
## $categories[[1]]$name
## [1] "Evolutionary biology"
## 
## 
## $categories[[2]]
## $categories[[2]]$id
## [1] 39
## 
## $categories[[2]]$name
## [1] "Ecology"
## 
## 
## 
## $files
## $files[[1]]
## $files[[1]]$size
## [1] "30 KB"
## 
## $files[[1]]$id
## [1] 137
## 
## $files[[1]]$mime_type
## [1] "image/png"
## 
## $files[[1]]$name
## [1] "Labrid_fins.png"
## 
## 
## 
## $links
## list()
## 
```


Try creating your own content:


```r
fs_create("Test title", "description of test", "dataset")
```

```
## Warning: text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## Your article has been created! Your id number is 95717
```

```
## [1] 95717
```


This creates an article with the essential metadata information.  In the next tutorial, [Publishing on FigShare from R](https://github.com/ropensci/rfigshare/blob/master/inst/doc/publishing_on_figshare.md) we will describe how to add files, tags, categories, authors, and links to your draft, and then publish it either privately or publicly.   





