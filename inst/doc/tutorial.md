---
title: rfigshare - Share and explore figures, data, and publications on FigShare using R

---

![](http://farm9.staticflickr.com/8180/7950489358_ea902bdaae_o.png)



# Obtaining your API keys

There is a nice video introduction to creating applications for the API on the [figshare blog](http://figshare.com/blog/figshare_API_available_to_all/48).  The following tutorial provides a simple walkthrough of how to go about getting your figshare API keys set up so that you can use the `rfigshare` package.  


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


## Installing the R package

Now that we have the API credentials in place, actually using `rfigshare` is pretty easy.  Install the latest version of package directly from Github using: 

```r
require(devtools)
install_github("rfigshare", "ropensci")
```

# Using rfigshare


Try authenticating with your credentials:


```r
require(rfigshare)
```

```
## Loading required package: rfigshare
```

```
## 
## 
## New to rfigshare? Look up ?fs_auth() for setting up an app and
## authenticating for all other functions. Use
## suppressPackageStartupMessages() to suppress this message in future
```

```r
fs_auth()
```



Try a search for an author:


```r
fs_author_search("Boettiger")
```

```
## Warning: text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## Loading required package: rjson
```

```
## [[1]]
## [[1]]$id
## [1] "96387"
## 
## [[1]]$fname
## [1] "Carl"
## 
## [[1]]$lname
## [1] "Boettiger"
## 
## [[1]]$full_name
## [1] "Carl Boettiger"
## 
## [[1]]$job_title
## [1] ""
## 
## [[1]]$description
## [1] ""
## 
## [[1]]$facebook
## [1] ""
## 
## [[1]]$twitter
## [1] ""
## 
## [[1]]$active
## [1] 1
```


Try creating your own content:


```r
id <- fs_create("Test title", "description of test", "dataset")
```

```
## Warning: text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## Your article has been created! Your id number is 96206
```


This creates an article with the essential metadata information. We can now upload the dataset to this newly created figshare object using `fs_upload`.  For the purposes of this example, we'll just upload one of R's built-in datasets:


```r
data(mtcars)
write.csv(mtcars, "mtcars.csv")

fs_upload(id, "mtcars.csv")
```


Not that we must pass the id number of our the newly created figshare object as the first argument.  Similar functions let us add additional authors, tags, categories, and links, e.g.


```r
fs_add_tags(id, "demo")
```


The file we have created remains saved as a draft until we publish it, either publicly or privately.  Note that once a file is declared public, it cannot be made private or deleted.  Let's release this dataset privately:


```r
fs_make_private(id)
```

```
## Response [http://api.figshare.com/v1/my_data/articles/96206/action/make_private]
##   Status: 400
##   Content-type: application/json; charset=UTF-8
## {"error": "You have no categories registered for this article, thus the status cannot be changed"}
```


We can now share the dataset with collaborators by way of the private url.  

### The quick and easy way

The `rfigshare` package will let you create a new figshare article with additional authors, tags, categories, etc in a single command usnig the `fs_new_article` function.  The essential metadata `title`, `description` and `type` are required, but any other information we omit at this stage can be added later.  If we set `visibility` to private or public, the article is published on figshare immediately.  


```r
id <- fs_new_article(title="A Test of rfigshare", 
                     description="This is a test of the fs_new_aricle function and related methods", 
                     type="figure", 
                     authors=c("Karthik Ram", "Scott Chamberlain"), 
                     tags=c("ecology", "openscience"), 
                     categories="Ecology", 
                     links="http://ropensci.org", 
                     files="figure/rfigshare.png",
                     visibility="private")
```

```
## Warning: text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## Your article has been created! Your id number is 96207
```

```
## Warning: the condition has length > 1 and only the first element will be
## used
```

```
## Warning: text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## Warning: text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## found ids for all authors
```

```
## Warning: the condition has length > 1 and only the first element will be
## used
```


# Examining Data on Figshare

We can view all available metadata of a figshare object


```r
fs_details(id)
```

```
## Warning: text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## $article_id
## [1] 96207
## 
## $title
## [1] "A Test of rfigshare"
## 
## $views
## [1] 0
## 
## $downloads
## [1] 0
## 
## $shares
## [1] 0
## 
## $doi
## [1] "http://dx.doi.org/10.6084/m9.figshare.96207"
## 
## $defined_type
## [1] "figure"
## 
## $status
## [1] "Private"
## 
## $version
## [1] 1
## 
## $published_date
## [1] "17:50, Oct 01, 2012"
## 
## $description
## [1] "This is a test of the fs_new_aricle function and related methods"
## 
## $total_size
## [1] "17.78 KB"
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
## $authors[[2]]
## $authors[[2]]$first_name
## [1] "Karthik"
## 
## $authors[[2]]$last_name
## [1] "Ram"
## 
## $authors[[2]]$id
## [1] 97306
## 
## $authors[[2]]$full_name
## [1] "Karthik Ram"
## 
## 
## $authors[[3]]
## $authors[[3]]$first_name
## [1] "Scott"
## 
## $authors[[3]]$last_name
## [1] "Chamberlain"
## 
## $authors[[3]]$id
## [1] 96554
## 
## $authors[[3]]$full_name
## [1] "Scott Chamberlain"
## 
## 
## 
## $tags
## $tags[[1]]
## $tags[[1]]$id
## [1] 47864
## 
## $tags[[1]]$name
## [1] "openscience"
## 
## 
## $tags[[2]]
## $tags[[2]]$id
## [1] 11917
## 
## $tags[[2]]$name
## [1] "ecology"
## 
## 
## 
## $categories
## $categories[[1]]
## $categories[[1]]$id
## [1] 39
## 
## $categories[[1]]$name
## [1] "Ecology"
## 
## 
## 
## $files
## $files[[1]]
## $files[[1]]$size
## [1] "18 KB"
## 
## $files[[1]]$id
## [1] 100297
## 
## $files[[1]]$mime_type
## [1] "image/png"
## 
## $files[[1]]$name
## [1] "rfigshare.png"
## 
## 
## 
## $links
## $links[[1]]
## $links[[1]]$link
## [1] "http://ropensci.org"
## 
## $links[[1]]$id
## [1] 673
```



