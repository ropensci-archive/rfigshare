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
## text_content() deprecated. Use parsed_content(x, as = 'parsed')
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
## text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## Your article has been created! Your id number is 97159
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
## Response [http://api.figshare.com/v1/my_data/articles/97159/action/make_private]
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
## text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## Your article has been created! Your id number is 97160
```

```
## Warning: the condition has length > 1 and only the first element will be
## used
```

```
## text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## text_content() deprecated. Use parsed_content(x, as = 'parsed')
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
## text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
## $article_id
## [1] 97160
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
## [1] "http://dx.doi.org/10.6084/m9.figshare.97160"
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
## [1] "20:26, Nov 02, 2012"
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
## [1] 142856
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


You can see all of the files you have:


```r
fs_browse(mine = TRUE)
```

```
## Response [http://api.figshare.com/v1/my_data/articles]
##   Status: 200
##   Content-type: application/json; charset=UTF-8
## {"count": 10, "items": [{"article_id": 97159, "title": "Test title", "views": 0, "downloads": 0, "shares": 0, "doi": "http://dx.doi.org/10.6084/m9.figshare.97159", "defined_type": "dataset", "status": "Drafts", "version": 1, "published_date": "20:26, Nov 02, 2012", "description": "description of test", "total_size": "1.70 KB", "owner": {"id": 96387, "full_name": "Carl Boettiger"}, "authors": [{"first_name": "Carl", "last_name": "Boettiger", "id": 96387, "full_name": "Carl Boettiger"}], "tags": [{"id": 15681, "name": "demo"}], "categories": [], "files": [{"size": "2 KB", "id": 142855, "mime_type": "text/plain", "name": "mtcars.csv"}], "links": []}, {"article_id": 97160, "title": "A Test of rfigshare", "views": 0, "downloads": 0, "shares": 0, "doi": "http://dx.doi.org/10.6084/m9.figshare.97160", "defined_type": "figure", "status": "Private", "version": 1, "published_date": "20:26, Nov 02, 2012", "description": "This is a test of the fs_new_aricle function and related methods", "total_size": "17.78 KB", "owner": {"id": 96387, "full_name": "Carl Boettiger"}, "authors": [{"first_name": "Carl", "last_name": "Boettiger", "id": 96387, "full_name": "Carl Boettiger"}, {"first_name": "Karthik", "last_name": "Ram", "id": 97306, "full_name": "Karthik Ram"}, {"first_name": "Scott", "last_name": "Chamberlain", "id": 96554, "full_name": "Scott Chamberlain"}], "tags": [{"id": 47864, "name": "openscience"}, {"id": 11917, "name": "ecology"}], "categories": [{"id": 39, "name": "Ecology"}], "files": [{"size": "18 KB", "id": 142856, "mime_type": "image/png", "name": "rfigshare.png"}], "links": [{"link": "http://ropensci.org", "id": 673}]}, {"article_id": 97158, "title": "A Test of rfigshare", "views": 0, "downloads": 0, "shares": 0, "doi": "http://dx.doi.org/10.6084/m9.figshare.97158", "defined_type": "figure", "status": "Drafts", "version": 1, "published_date": "19:55, Nov 02, 2012", "description": "This is a test of the fs_new_aricle function and related methods", "total_size": false, "owner": {"id": 96387, "full_name": "Carl Boettiger"}, "authors": [{"first_name": "Carl", "last_name": "Boettiger", "id": 96387, "full_name": "Carl Boettiger"}, {"first_name": "Karthik", "last_name": "Ram", "id": 97306, "full_name": "Karthik Ram"}, {"first_name": "Scott", "last_name": "Chamberlain", "id": 96554, "full_name": "Scott Chamberlain"}], "tags": [{"id": 47864, "name": "openscience"}, {"id": 11917, "name": "ecology"}], "categories": [{"id": 39, "name": "Ecology"}], "files": [], "links": [{"link": "http://ropensci.org", "id": 673}]}, {"article_id": 97157, "title": "Test title", "views": 0, "downloads": 0, "shares": 0, "doi": "http://dx.doi.org/10.6084/m9.figshare.97157", "defined_type": "dataset", "status": "Drafts", "version": 1, "published_date": "19:55, Nov 02, 2012", "description": "description of test", "total_size": false, "owner": {"id": 96387, "full_name": "Carl Boettiger"}, "authors": [{"first_name": "Carl", "last_name": "Boettiger", "id": 96387, "full_name": "Carl Boettiger"}], "tags": [{"id": 15681, "name": "demo"}], "categories": [], "files": [], "links": []}, {"article_id": 96921, "title": "Lab Notebook, 2012", "views": 0, "downloads": 0, "shares": 0, "doi": "http://dx.doi.org/10.6084/m9.figshare.96921", "defined_type": "fileset", "status": "Drafts", "version": 1, "published_date": "22:34, Oct 29, 2012", "description": "Archive 2012", "total_size": false, "owner": {"id": 96387, "full_name": "Carl Boettiger"}, "authors": [{"first_name": "Carl", "last_name": "Boettiger", "id": 96387, "full_name": "Carl Boettiger"}], "tags": [], "categories": [{"id": 24, "name": "Evolutionary biology"}, {"id": 39, "name": "Ecology"}], "files": [], "links": [{"link": "http://www.carlboettiger.info/2012", "id": 1149}]}, {"article_id": 96916, "title": "Lab Notebook, 2010", "views": 90, "downloads": 0, "shares": 4, "doi": "http://dx.doi.org/10.6084/m9.figshare.96916", "defined_type": "fileset", "status": "Public", "version": 1, "published_date": "22:39, Oct 29, 2012", "description": "<p>Permanent archive of Carl Boettiger's open lab notebook entries for the year 2010 (<a href=\"http://www.carlboettiger.info/archives.html\">http://www.carlboettiger.info/archives.html</a>).&nbsp;Entries are archived in plain text UTF-8. Written in pandoc-flavored Markdown.&nbsp;Meets the goals of the Data Management Plan:&nbsp;<a href=\"http://www.carlboettiger.info/2012/10/09/data-management-plan.html\">http://www.carlboettiger.info/2012/10/09/data-management-plan.html</a></p>", "total_size": "253.80 KB", "owner": {"id": 96387, "full_name": "Carl Boettiger"}, "authors": [{"first_name": "Carl", "last_name": "Boettiger", "id": 96387, "full_name": "Carl Boettiger"}], "tags": [{"id": 48404, "name": "Ecology"}, {"id": 11917, "name": "ecology"}, {"id": 46723, "name": " open science"}, {"id": 47395, "name": " evolution"}], "categories": [{"id": 24, "name": "Evolutionary biology"}, {"id": 39, "name": "Ecology"}], "files": [{"size": "260 KB", "id": 101975, "mime_type": "application/x-gzip", "name": "2010.tar.gz"}], "links": []}, {"article_id": 96919, "title": "Lab Notebook, 2011", "views": 75, "downloads": 0, "shares": 0, "doi": "http://dx.doi.org/10.6084/m9.figshare.96919", "defined_type": "fileset", "status": "Public", "version": 1, "published_date": "22:44, Oct 29, 2012", "description": "<p>Permanent archive of Carl Boettiger's open lab notebook entries for the year 2011 (<a href=\"http://www.carlboettiger.info/archives.html\">http://www.carlboettiger.info/archives.html</a>).&nbsp;Entries are archived in plain text UTF-8. Written in pandoc-flavored Markdown.&nbsp;Meets the goals of the Data Management Plan:&nbsp;<a href=\"http://www.carlboettiger.info/2012/10/09/data-management-plan.html\">http://www.carlboettiger.info/2012/10/09/data-management-plan.html</a></p>", "total_size": "334.22 KB", "owner": {"id": 96387, "full_name": "Carl Boettiger"}, "authors": [{"first_name": "Carl", "last_name": "Boettiger", "id": 96387, "full_name": "Carl Boettiger"}], "tags": [{"id": 48404, "name": "Ecology"}, {"id": 11917, "name": "ecology"}, {"id": 46723, "name": " open science"}, {"id": 47395, "name": " evolution"}], "categories": [{"id": 24, "name": "Evolutionary biology"}, {"id": 39, "name": "Ecology"}], "files": [{"size": "342 KB", "id": 101976, "mime_type": "application/x-gzip", "name": "2011.tar.gz"}], "links": [{"link": "http://www.carlboettiger.info/2011", "id": 1148}]}, {"article_id": 96367, "title": "Oscillate_noise.png", "views": 0, "downloads": 0, "shares": 0, "doi": "http://dx.doi.org/10.6084/m9.figshare.96367", "defined_type": "figure", "status": "Drafts", "version": 1, "published_date": "16:33, Oct 10, 2012", "description": null, "total_size": "77.72 KB", "owner": {"id": 96387, "full_name": "Carl Boettiger"}, "authors": [{"first_name": "Carl", "last_name": "Boettiger", "id": 96387, "full_name": "Carl Boettiger"}], "tags": [], "categories": [], "files": [{"size": "80 KB", "id": 100570, "mime_type": "image/png", "name": "Oscillate_noise.png"}], "links": []}, {"article_id": 95839, "title": "R code for the function fs_create ", "views": 69, "downloads": 0, "shares": 0, "doi": "http://dx.doi.org/10.6084/m9.figshare.95839", "defined_type": "dataset", "status": "Public", "version": 1, "published_date": "19:48, Sep 13, 2012", "description": "<p>An R implementation of the figshare API function to create a new article. &nbsp;Look Ma, I can share nice code on figshare!</p>\n<p>&nbsp;</p>\n<p>This function is part of the <a href=\"https://github.com/ropensci/rfigshare\">rfigshare</a> package by the <a href=\"http://ropensci.org\">rOpenSci</a> project. &nbsp;</p>", "total_size": "2.04 KB", "owner": {"id": 96387, "full_name": "Carl Boettiger"}, "authors": [{"first_name": "Carl", "last_name": "Boettiger", "id": 96387, "full_name": "Carl Boettiger"}], "tags": [{"id": 47906, "name": " code"}, {"id": 47624, "name": "R"}, {"id": 42046, "name": "r"}], "categories": [{"id": 77, "name": "Applied Computer Science"}], "files": [{"size": "2 KB", "id": 98377, "mime_type": "text/plain", "name": "fs_create.R"}], "links": []}, {"article_id": 138, "title": "Labrid adaptive peaks", "views": 69, "downloads": 0, "shares": 0, "doi": "http://dx.doi.org/10.6084/m9.figshare.138", "defined_type": "figure", "status": "Public", "version": 1, "published_date": "13:45, Dec 30, 2011", "description": "Described in the notebook: http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Comparative_Phylogenetics/2010/03/12", "total_size": "29.71 KB", "owner": {"id": 96387, "full_name": "Carl Boettiger"}, "authors": [{"first_name": "Carl", "last_name": "Boettiger", "id": 96387, "full_name": "Carl Boettiger"}], "tags": [{"id": 277, "name": "comparative methods"}, {"id": 276, "name": "phylogenetics"}, {"id": 275, "name": "fins"}, {"id": 274, "name": "labrids"}], "categories": [{"id": 24, "name": "Evolutionary biology"}, {"id": 39, "name": "Ecology"}], "files": [{"size": "30 KB", "id": 137, "mime_type": "image/png", "name": "Labrid_fins.png"}], "links": []}]}
```




