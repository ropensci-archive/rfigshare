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
fs_auth()
```



Try a search for an author:


```r
fs_author_search("Boettiger")
```

```
text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
[[1]]
[[1]]$id
[1] "96387"

[[1]]$fname
[1] "Carl"

[[1]]$lname
[1] "Boettiger"

[[1]]$full_name
[1] "Carl Boettiger"

[[1]]$job_title
[1] ""

[[1]]$description
[1] ""

[[1]]$facebook
[1] ""

[[1]]$twitter
[1] ""

[[1]]$active
[1] 1

```


Try creating your own content:


```r
id <- fs_create("Test title", "description of test", "dataset")
```

```
text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
Your article has been created! Your id number is 105137
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



Minimal metadata includes title, description, type, and at least one tag and one category.  We can add categories using either the category id or the name of the category, but it must be one of the preset categories available.  We can ask the API for a list of all the categories:


```r
fs_category_list()
```


<!-- html table generated in R 2.15.2 by xtable 1.7-0 package -->
<!-- Wed Dec 19 22:02:19 2012 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> id </TH> <TH> name </TH>  </TR>
  <TR> <TD align="right"> 1 </TD> <TD> 89 </TD> <TD> Aerospace Engineering </TD> </TR>
  <TR> <TD align="right"> 2 </TD> <TD> 88 </TD> <TD> Agricultural Engineering </TD> </TR>
  <TR> <TD align="right"> 3 </TD> <TD> 102 </TD> <TD> Algebra </TD> </TR>
  <TR> <TD align="right"> 4 </TD> <TD> 10 </TD> <TD> Anatomy </TD> </TR>
  <TR> <TD align="right"> 5 </TD> <TD> 25 </TD> <TD> Anthropology </TD> </TR>
  <TR> <TD align="right"> 6 </TD> <TD> 77 </TD> <TD> Applied Computer Science </TD> </TR>
  <TR> <TD align="right"> 7 </TD> <TD> 107 </TD> <TD> Applied Physics </TD> </TR>
  <TR> <TD align="right"> 8 </TD> <TD> 127 </TD> <TD> Archaeology </TD> </TR>
  <TR> <TD align="right"> 9 </TD> <TD> 94 </TD> <TD> Art </TD> </TR>
  <TR> <TD align="right"> 10 </TD> <TD> 58 </TD> <TD> Astrophysics </TD> </TR>
  <TR> <TD align="right"> 11 </TD> <TD> 78 </TD> <TD> Atmospheric Sciences </TD> </TR>
  <TR> <TD align="right"> 12 </TD> <TD> 108 </TD> <TD> Atomic Physics </TD> </TR>
  <TR> <TD align="right"> 13 </TD> <TD> 11 </TD> <TD> Behavioral neuroscience </TD> </TR>
  <TR> <TD align="right"> 14 </TD> <TD> 4 </TD> <TD> Biochemistry </TD> </TR>
  <TR> <TD align="right"> 15 </TD> <TD> 125 </TD> <TD> Bioinformatics </TD> </TR>
  <TR> <TD align="right"> 16 </TD> <TD> 42 </TD> <TD> Biological engineering </TD> </TR>
  <TR> <TD align="right"> 17 </TD> <TD> 1 </TD> <TD> Biophysics </TD> </TR>
  <TR> <TD align="right"> 18 </TD> <TD> 21 </TD> <TD> Biotechnology </TD> </TR>
  <TR> <TD align="right"> 19 </TD> <TD> 65 </TD> <TD> Botany </TD> </TR>
  <TR> <TD align="right"> 20 </TD> <TD> 64 </TD> <TD> Cancer </TD> </TR>
  <TR> <TD align="right"> 21 </TD> <TD> 12 </TD> <TD> Cell biology </TD> </TR>
  <TR> <TD align="right"> 22 </TD> <TD> 109 </TD> <TD> Computational Physics </TD> </TR>
  <TR> <TD align="right"> 23 </TD> <TD> 20 </TD> <TD> Computer Engineering </TD> </TR>
  <TR> <TD align="right"> 24 </TD> <TD> 110 </TD> <TD> Condensed Matter Physics </TD> </TR>
  <TR> <TD align="right"> 25 </TD> <TD> 57 </TD> <TD> Cosmology </TD> </TR>
  <TR> <TD align="right"> 26 </TD> <TD> 66 </TD> <TD> Crystallography </TD> </TR>
  <TR> <TD align="right"> 27 </TD> <TD> 95 </TD> <TD> Design </TD> </TR>
  <TR> <TD align="right"> 28 </TD> <TD> 61 </TD> <TD> Developmental Biology </TD> </TR>
  <TR> <TD align="right"> 29 </TD> <TD> 39 </TD> <TD> Ecology </TD> </TR>
  <TR> <TD align="right"> 30 </TD> <TD> 27 </TD> <TD> Economics </TD> </TR>
  <TR> <TD align="right"> 31 </TD> <TD> 129 </TD> <TD> Education </TD> </TR>
  <TR> <TD align="right"> 32 </TD> <TD> 117 </TD> <TD> Entropy </TD> </TR>
  <TR> <TD align="right"> 33 </TD> <TD> 31 </TD> <TD> Environmental chemistry </TD> </TR>
  <TR> <TD align="right"> 34 </TD> <TD> 34 </TD> <TD> Environmental science </TD> </TR>
  <TR> <TD align="right"> 35 </TD> <TD> 24 </TD> <TD> Evolutionary biology </TD> </TR>
  <TR> <TD align="right"> 36 </TD> <TD> 56 </TD> <TD> Galactic Astronomy </TD> </TR>
  <TR> <TD align="right"> 37 </TD> <TD> 118 </TD> <TD> General Relativity </TD> </TR>
  <TR> <TD align="right"> 38 </TD> <TD> 90 </TD> <TD> Genetic Engineering </TD> </TR>
  <TR> <TD align="right"> 39 </TD> <TD> 13 </TD> <TD> Genetics </TD> </TR>
  <TR> <TD align="right"> 40 </TD> <TD> 32 </TD> <TD> Geochemistry </TD> </TR>
  <TR> <TD align="right"> 41 </TD> <TD> 17 </TD> <TD> Geography </TD> </TR>
  <TR> <TD align="right"> 42 </TD> <TD> 29 </TD> <TD> Geology </TD> </TR>
  <TR> <TD align="right"> 43 </TD> <TD> 103 </TD> <TD> Geometry </TD> </TR>
  <TR> <TD align="right"> 44 </TD> <TD> 79 </TD> <TD> Geophysics </TD> </TR>
  <TR> <TD align="right"> 45 </TD> <TD> 128 </TD> <TD> Hematology </TD> </TR>
  <TR> <TD align="right"> 46 </TD> <TD> 126 </TD> <TD> History </TD> </TR>
  <TR> <TD align="right"> 47 </TD> <TD> 80 </TD> <TD> Hydrology </TD> </TR>
  <TR> <TD align="right"> 48 </TD> <TD> 46 </TD> <TD> Immunology </TD> </TR>
  <TR> <TD align="right"> 49 </TD> <TD> 69 </TD> <TD> Inorganic Chemistry </TD> </TR>
  <TR> <TD align="right"> 50 </TD> <TD> 97 </TD> <TD> Law </TD> </TR>
  <TR> <TD align="right"> 51 </TD> <TD> 35 </TD> <TD> Limnology </TD> </TR>
  <TR> <TD align="right"> 52 </TD> <TD> 98 </TD> <TD> Literature </TD> </TR>
  <TR> <TD align="right"> 53 </TD> <TD> 119 </TD> <TD> M-Theory </TD> </TR>
  <TR> <TD align="right"> 54 </TD> <TD> 62 </TD> <TD> Marine Biology </TD> </TR>
  <TR> <TD align="right"> 55 </TD> <TD> 91 </TD> <TD> Mechanical Engineering </TD> </TR>
  <TR> <TD align="right"> 56 </TD> <TD> 111 </TD> <TD> Mechanics </TD> </TR>
  <TR> <TD align="right"> 57 </TD> <TD> 7 </TD> <TD> Medicine </TD> </TR>
  <TR> <TD align="right"> 58 </TD> <TD> 122 </TD> <TD> Mental Health </TD> </TR>
  <TR> <TD align="right"> 59 </TD> <TD> 8 </TD> <TD> Microbiology </TD> </TR>
  <TR> <TD align="right"> 60 </TD> <TD> 82 </TD> <TD> Mineralogy </TD> </TR>
  <TR> <TD align="right"> 61 </TD> <TD> 14 </TD> <TD> Molecular biology </TD> </TR>
  <TR> <TD align="right"> 62 </TD> <TD> 70 </TD> <TD> Molecular Physics </TD> </TR>
  <TR> <TD align="right"> 63 </TD> <TD> 15 </TD> <TD> Neuroscience </TD> </TR>
  <TR> <TD align="right"> 64 </TD> <TD> 71 </TD> <TD> Nuclear Chemistry </TD> </TR>
  <TR> <TD align="right"> 65 </TD> <TD> 92 </TD> <TD> Nuclear Engineering </TD> </TR>
  <TR> <TD align="right"> 66 </TD> <TD> 36 </TD> <TD> Oceanography </TD> </TR>
  <TR> <TD align="right"> 67 </TD> <TD> 37 </TD> <TD> Organic chemistry </TD> </TR>
  <TR> <TD align="right"> 68 </TD> <TD> 84 </TD> <TD> Paleoclimatology </TD> </TR>
  <TR> <TD align="right"> 69 </TD> <TD> 28 </TD> <TD> Paleontology </TD> </TR>
  <TR> <TD align="right"> 70 </TD> <TD> 85 </TD> <TD> Palynology </TD> </TR>
  <TR> <TD align="right"> 71 </TD> <TD> 63 </TD> <TD> Parasitology </TD> </TR>
  <TR> <TD align="right"> 72 </TD> <TD> 112 </TD> <TD> Particle Physics </TD> </TR>
  <TR> <TD align="right"> 73 </TD> <TD> 99 </TD> <TD> Performing Arts </TD> </TR>
  <TR> <TD align="right"> 74 </TD> <TD> 19 </TD> <TD> Pharmacology </TD> </TR>
  <TR> <TD align="right"> 75 </TD> <TD> 100 </TD> <TD> Philosophy </TD> </TR>
  <TR> <TD align="right"> 76 </TD> <TD> 86 </TD> <TD> Physical Geography </TD> </TR>
  <TR> <TD align="right"> 77 </TD> <TD> 16 </TD> <TD> Physiology </TD> </TR>
  <TR> <TD align="right"> 78 </TD> <TD> 54 </TD> <TD> Planetary Geology </TD> </TR>
  <TR> <TD align="right"> 79 </TD> <TD> 59 </TD> <TD> Planetary Science </TD> </TR>
  <TR> <TD align="right"> 80 </TD> <TD> 113 </TD> <TD> Plasma Physics </TD> </TR>
  <TR> <TD align="right"> 81 </TD> <TD> 104 </TD> <TD> Probability </TD> </TR>
  <TR> <TD align="right"> 82 </TD> <TD> 114 </TD> <TD> Quantum Mechanics </TD> </TR>
  <TR> <TD align="right"> 83 </TD> <TD> 73 </TD> <TD> Radiochemistry </TD> </TR>
  <TR> <TD align="right"> 84 </TD> <TD> 106 </TD> <TD> Science Policy </TD> </TR>
  <TR> <TD align="right"> 85 </TD> <TD> 45 </TD> <TD> Sociology </TD> </TR>
  <TR> <TD align="right"> 86 </TD> <TD> 23 </TD> <TD> Software Engineering </TD> </TR>
  <TR> <TD align="right"> 87 </TD> <TD> 87 </TD> <TD> Soil Science </TD> </TR>
  <TR> <TD align="right"> 88 </TD> <TD> 115 </TD> <TD> Solid Mechanics </TD> </TR>
  <TR> <TD align="right"> 89 </TD> <TD> 120 </TD> <TD> Special Relativity </TD> </TR>
  <TR> <TD align="right"> 90 </TD> <TD> 105 </TD> <TD> Statistics </TD> </TR>
  <TR> <TD align="right"> 91 </TD> <TD> 55 </TD> <TD> Stellar Astronomy </TD> </TR>
  <TR> <TD align="right"> 92 </TD> <TD> 47 </TD> <TD> Stereochemistry </TD> </TR>
  <TR> <TD align="right"> 93 </TD> <TD> 75 </TD> <TD> Supramolecular Chemistry </TD> </TR>
  <TR> <TD align="right"> 94 </TD> <TD> 76 </TD> <TD> Theoretical Computer Science </TD> </TR>
  <TR> <TD align="right"> 95 </TD> <TD> 116 </TD> <TD> Thermodynamics </TD> </TR>
  <TR> <TD align="right"> 96 </TD> <TD> 44 </TD> <TD> Toxicology </TD> </TR>
   </TABLE>


And we can add the category or categories we like,


```r
fs_add_categories(id, c("Education", "Software Engineering"))
```



The file we have created remains saved as a draft until we publish it, either publicly or privately.  Note that once a file is declared public, it cannot be made private or deleted.  Let's release this dataset privately:


```r
fs_make_private(id)
```

```
Response [http://api.figshare.com/v1/my_data/articles/105137/action/make_private]
  Status: 200
  Content-type: application/json; charset=UTF-8
{"success": "Article status changed to Private"} 
```


We can now share the dataset with collaborators by way of the private url.  

### The quick and easy way

The `rfigshare` package will let you create a new figshare article with additional authors, tags, categories, etc in a single command usnig the `fs_new_article` function.  The essential metadata `title`, `description` and `type` are required, but any other information we omit at this stage can be added later.  If we set `visibility` to private or public, the article is published on figshare immediately.  


```r
id <- fs_new_article(title="A Test of rfigshare", 
                     description="This is a test", 
                     type="figure", 
                     authors=c("Karthik Ram", "Scott Chamberlain"), 
                     tags=c("ecology", "openscience"), 
                     categories="Ecology", 
                     links="http://ropensci.org", 
                     files="figure/rfigshare.png",
                     visibility="private")
```

```
text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
Your article has been created! Your id number is 105138
```

```
text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
found ids for all authors
```


# Examining Data on Figshare

We can view all available metadata of a figshare object.  If the object is not public (e.g. draft or private), we have to add the `mine=TRUE` option


```r
fs_details(id, mine=TRUE)
```

```
text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
Article ID : 105138
Article type : figure
DOI : 
Title : A Test of rfigshare
Description : This is a test
Shares : 
Views : 
Downloads : 
Owner : 
Authors : Carl Boettiger, Karthik Ram, Scott Chamberlain
Tags : openscience, ecology
Categories : Ecology
File names : rfigshare.png
Links : http://ropensci.org
```


You can see all of the files you have:


```r
fs_browse(mine=TRUE)
```

```
text_content() deprecated. Use parsed_content(x, as = 'parsed')
```

```
[[1]]
[[1]]$article_id
[1] 105138

[[1]]$title
[1] "A Test of rfigshare"

[[1]]$defined_type
[1] "figure"

[[1]]$status
[1] "Private"

[[1]]$version
[1] 1

[[1]]$published_date
[1] "05:18, Dec 20, 2012"

[[1]]$description
[1] "This is a test"

[[1]]$description_nohtml
[1] "This is a test"

[[1]]$total_size
[1] "17.78 KB"

[[1]]$authors
[[1]]$authors[[1]]
[[1]]$authors[[1]]$first_name
[1] "Carl"

[[1]]$authors[[1]]$last_name
[1] "Boettiger"

[[1]]$authors[[1]]$id
[1] 96387

[[1]]$authors[[1]]$full_name
[1] "Carl Boettiger"


[[1]]$authors[[2]]
[[1]]$authors[[2]]$first_name
[1] "Karthik"

[[1]]$authors[[2]]$last_name
[1] "Ram"

[[1]]$authors[[2]]$id
[1] 97306

[[1]]$authors[[2]]$full_name
[1] "Karthik Ram"


[[1]]$authors[[3]]
[[1]]$authors[[3]]$first_name
[1] "Scott"

[[1]]$authors[[3]]$last_name
[1] "Chamberlain"

[[1]]$authors[[3]]$id
[1] 96554

[[1]]$authors[[3]]$full_name
[1] "Scott Chamberlain"



[[1]]$tags
[[1]]$tags[[1]]
[[1]]$tags[[1]]$id
[1] 47864

[[1]]$tags[[1]]$name
[1] "openscience"


[[1]]$tags[[2]]
[[1]]$tags[[2]]$id
[1] 11917

[[1]]$tags[[2]]$name
[1] "ecology"



[[1]]$categories
[[1]]$categories[[1]]
[[1]]$categories[[1]]$id
[1] 39

[[1]]$categories[[1]]$name
[1] "Ecology"



[[1]]$files
[[1]]$files[[1]]
[[1]]$files[[1]]$size
[1] "18 KB"

[[1]]$files[[1]]$id
[1] 233421

[[1]]$files[[1]]$mime_type
[1] "image/png"

[[1]]$files[[1]]$name
[1] "rfigshare.png"



[[1]]$links
[[1]]$links[[1]]
[[1]]$links[[1]]$link
[1] "http://ropensci.org"

[[1]]$links[[1]]$id
[1] 673




[[2]]
[[2]]$article_id
[1] 105137

[[2]]$title
[1] "Test title"

[[2]]$defined_type
[1] "dataset"

[[2]]$status
[1] "Private"

[[2]]$version
[1] 1

[[2]]$published_date
[1] "05:18, Dec 20, 2012"

[[2]]$description
[1] "description of test"

[[2]]$description_nohtml
[1] "description of test"

[[2]]$total_size
[1] "1.70 KB"

[[2]]$authors
[[2]]$authors[[1]]
[[2]]$authors[[1]]$first_name
[1] "Carl"

[[2]]$authors[[1]]$last_name
[1] "Boettiger"

[[2]]$authors[[1]]$id
[1] 96387

[[2]]$authors[[1]]$full_name
[1] "Carl Boettiger"



[[2]]$tags
[[2]]$tags[[1]]
[[2]]$tags[[1]]$id
[1] 15681

[[2]]$tags[[1]]$name
[1] "demo"



[[2]]$categories
[[2]]$categories[[1]]
[[2]]$categories[[1]]$id
[1] 23

[[2]]$categories[[1]]$name
[1] "Software Engineering"


[[2]]$categories[[2]]
[[2]]$categories[[2]]$id
[1] 129

[[2]]$categories[[2]]$name
[1] "Education"



[[2]]$files
[[2]]$files[[1]]
[[2]]$files[[1]]$size
[1] "2 KB"

[[2]]$files[[1]]$id
[1] 233420

[[2]]$files[[1]]$mime_type
[1] "text/plain"

[[2]]$files[[1]]$name
[1] "mtcars.csv"



[[2]]$links
list()


[[3]]
[[3]]$article_id
[1] 97653

[[3]]$title
[1] "RFigshare Tutorial"

[[3]]$defined_type
[1] "paper"

[[3]]$status
[1] "Public"

[[3]]$version
[1] 2

[[3]]$published_date
[1] "17:16, Nov 16, 2012"

[[3]]$description
[1] "<p>A tuturial on how to setup and post material to figshare from R</p>"

[[3]]$description_nohtml
[1] "A tuturial on how to setup and post material to figshare from R"

[[3]]$total_size
[1] "16.21 KB"

[[3]]$authors
[[3]]$authors[[1]]
[[3]]$authors[[1]]$first_name
[1] "Edmund"

[[3]]$authors[[1]]$last_name
[1] "Hart"

[[3]]$authors[[1]]$id
[1] 98137

[[3]]$authors[[1]]$full_name
[1] "Edmund Hart"


[[3]]$authors[[2]]
[[3]]$authors[[2]]$first_name
[1] "Carl"

[[3]]$authors[[2]]$last_name
[1] "Boettiger"

[[3]]$authors[[2]]$id
[1] 96387

[[3]]$authors[[2]]$full_name
[1] "Carl Boettiger"



[[3]]$tags
[[3]]$tags[[1]]
[[3]]$tags[[1]]$id
[1] 47864

[[3]]$tags[[1]]$name
[1] "openscience"


[[3]]$tags[[2]]
[[3]]$tags[[2]]$id
[1] 11917

[[3]]$tags[[2]]$name
[1] "ecology"



[[3]]$categories
[[3]]$categories[[1]]
[[3]]$categories[[1]]$id
[1] 39

[[3]]$categories[[1]]$name
[1] "Ecology"



[[3]]$files
[[3]]$files[[1]]
[[3]]$files[[1]]$download_url
[1] "http://files.figshare.com/223958/tutorial.md"

[[3]]$files[[1]]$size
[1] "17 KB"

[[3]]$files[[1]]$id
[1] 223958

[[3]]$files[[1]]$mime_type
[1] "text/plain"

[[3]]$files[[1]]$name
[1] "tutorial.md"



[[3]]$links
[[3]]$links[[1]]
[[3]]$links[[1]]$link
[1] "http://ropensci.org"

[[3]]$links[[1]]$id
[1] 673




[[4]]
[[4]]$article_id
[1] 97500

[[4]]$title
[1] "Exit Seminar to Center for Population Biology: Regime Shifts in Ecology and Evolution"

[[4]]$defined_type
[1] "presentation"

[[4]]$status
[1] "Public"

[[4]]$version
[1] 2

[[4]]$published_date
[1] "21:04, Nov 14, 2012"

[[4]]$description
[1] "<p>Slides from my exit seminar satisfying the completion requirements for a PhD in Population Biology at UC Davis, November 13, 2012.</p>"

[[4]]$description_nohtml
[1] "Slides from my exit seminar satisfying the completion requirements for a PhD in Population Biology at UC Davis, November 13, 2012."

[[4]]$total_size
[1] "23.37 MB"

[[4]]$authors
[[4]]$authors[[1]]
[[4]]$authors[[1]]$first_name
[1] "Carl"

[[4]]$authors[[1]]$last_name
[1] "Boettiger"

[[4]]$authors[[1]]$id
[1] 96387

[[4]]$authors[[1]]$full_name
[1] "Carl Boettiger"



[[4]]$tags
[[4]]$tags[[1]]
[[4]]$tags[[1]]$id
[1] 49296

[[4]]$tags[[1]]$name
[1] " comparative methods"


[[4]]$tags[[2]]
[[4]]$tags[[2]]$id
[1] 49295

[[4]]$tags[[2]]$name
[1] "seminar"


[[4]]$tags[[3]]
[[4]]$tags[[3]]$id
[1] 49294

[[4]]$tags[[3]]$name
[1] " presentation"


[[4]]$tags[[4]]
[[4]]$tags[[4]]$id
[1] 49293

[[4]]$tags[[4]]$name
[1] " labrids"


[[4]]$tags[[5]]
[[4]]$tags[[5]]$id
[1] 49036

[[4]]$tags[[5]]$name
[1] " warning singals"


[[4]]$tags[[6]]
[[4]]$tags[[6]]$id
[1] 47771

[[4]]$tags[[6]]$name
[1] " phylogenetics"



[[4]]$categories
[[4]]$categories[[1]]
[[4]]$categories[[1]]$id
[1] 24

[[4]]$categories[[1]]$name
[1] "Evolutionary biology"


[[4]]$categories[[2]]
[[4]]$categories[[2]]$id
[1] 39

[[4]]$categories[[2]]$name
[1] "Ecology"



[[4]]$files
[[4]]$files[[1]]
[[4]]$files[[1]]$download_url
[1] "http://files.figshare.com/177712/boettiger.pdf"

[[4]]$files[[1]]$size
[1] "23.37 MB"

[[4]]$files[[1]]$id
[1] 177712

[[4]]$files[[1]]$mime_type
[1] "application/pdf"

[[4]]$files[[1]]$name
[1] "boettiger.pdf"



[[4]]$links
list()


[[5]]
[[5]]$article_id
[1] 97279

[[5]]$title
[1] "Presentation at the Computational Science Graduate Fellowship Conference (2012): Regime shifts in Ecology & Evolution"

[[5]]$defined_type
[1] "presentation"

[[5]]$status
[1] "Public"

[[5]]$version
[1] 2

[[5]]$published_date
[1] "00:19, Nov 09, 2012"

[[5]]$description
[1] "<p>Slides from my talk at CSGF 2012 in Washington DC. &nbsp;</p>\n<p>A video recording of the talk is available here:&nbsp;<a href=\"http://www.youtube.com/watch?v=xwIIVdyKe4o\">http://www.youtube.com/watch?v=xwIIVdyKe4o</a></p>"

[[5]]$description_nohtml
[1] "Slides from my talk at CSGF 2012 in Washington DC.A video recording of the talk is available here:http://www.youtube.com/watch?v=xwIIVdyKe4o"

[[5]]$total_size
[1] "13.39 MB"

[[5]]$authors
[[5]]$authors[[1]]
[[5]]$authors[[1]]$first_name
[1] "Carl"

[[5]]$authors[[1]]$last_name
[1] "Boettiger"

[[5]]$authors[[1]]$id
[1] 96387

[[5]]$authors[[1]]$full_name
[1] "Carl Boettiger"



[[5]]$tags
[[5]]$tags[[1]]
[[5]]$tags[[1]]$id
[1] 49084

[[5]]$tags[[1]]$name
[1] " hpc"


[[5]]$tags[[2]]
[[5]]$tags[[2]]$id
[1] 49035

[[5]]$tags[[2]]$name
[1] "regime shifts"


[[5]]$tags[[3]]
[[5]]$tags[[3]]$id
[1] 276

[[5]]$tags[[3]]$name
[1] "phylogenetics"


[[5]]$tags[[4]]
[[5]]$tags[[4]]$id
[1] 277

[[5]]$tags[[4]]$name
[1] "comparative methods"



[[5]]$categories
[[5]]$categories[[1]]
[[5]]$categories[[1]]$id
[1] 106

[[5]]$categories[[1]]$name
[1] "Science Policy"


[[5]]$categories[[2]]
[[5]]$categories[[2]]$id
[1] 24

[[5]]$categories[[2]]$name
[1] "Evolutionary biology"


[[5]]$categories[[3]]
[[5]]$categories[[3]]$id
[1] 34

[[5]]$categories[[3]]$name
[1] "Environmental science"


[[5]]$categories[[4]]
[[5]]$categories[[4]]$id
[1] 39

[[5]]$categories[[4]]$name
[1] "Ecology"


[[5]]$categories[[5]]
[[5]]$categories[[5]]$id
[1] 125

[[5]]$categories[[5]]$name
[1] "Bioinformatics"


[[5]]$categories[[6]]
[[5]]$categories[[6]]$id
[1] 77

[[5]]$categories[[6]]$name
[1] "Applied Computer Science"



[[5]]$files
[[5]]$files[[1]]
[[5]]$files[[1]]$download_url
[1] "http://files.figshare.com/143048/boettiger.pdf"

[[5]]$files[[1]]$size
[1] "13.39 MB"

[[5]]$files[[1]]$id
[1] 143048

[[5]]$files[[1]]$mime_type
[1] "application/pdf"

[[5]]$files[[1]]$name
[1] "boettiger.pdf"



[[5]]$links
[[5]]$links[[1]]
[[5]]$links[[1]]$link
[1] "http://www.youtube.com/watch?v=xwIIVdyKe4o"

[[5]]$links[[1]]$id
[1] 1255




[[6]]
[[6]]$article_id
[1] 97218

[[6]]$title
[1] "Regime shifts in ecology and evolution (PhD Dissertation)"

[[6]]$defined_type
[1] "paper"

[[6]]$status
[1] "Public"

[[6]]$version
[1] 1

[[6]]$published_date
[1] "18:34, Nov 06, 2012"

[[6]]$description
[1] "<p>The most pressing issues of our time are all characterized by sudden regime shifts: the collapse of&nbsp;marine fisheries or stock-markets, the overthrow of governments, shifts in global climate. Regime&nbsp;shifts, or sudden transitions in dynamical behavior of a system, underly many important phenomena in ecological and evolutionary problems. How do they arise? How can we identify when a&nbsp;shift has occurred? Can we forecast these shifts? Here I address each of these central questions in&nbsp;the context of a particular system. First, I show how stochasticity in eco-evolutionary dynamics&nbsp;can give rise two different domains, or regimes, governing the behavior of evolutionary trajectories (Boettiger et al., 2010). In the next chapter, I turn to the question of identifying evolutionary&nbsp;shifts from data using phylogenetic trees and morphological trait data of extant species (Boettiger&nbsp;et al., 2012). In the last chapter, I adapt the approach of the previous section which allowed me&nbsp;to quantify the information available in a given data set that could detect a shift into an approach&nbsp;for detecting regime shifts in ecological time series data before the occur (Boettiger and Hastings,&nbsp;2012).</p>\n<div>&nbsp;</div>"

[[6]]$description_nohtml
[1] "The most pressing issues of our time are all characterized by sudden regime shifts: the collapse of marine fisheries or stock-markets, the overthrow of governments, shifts in global climate. Regime shifts, or sudden transitions in dynamical behavior of a system, underly many important phenomena in ecological and evolutionary problems. How do they arise? How can we identify when a shift has occurred? Can we forecast these shifts? Here I address each of these central questions in the context of a particular system. First, I show how stochasticity in eco-evolutionary dynamics can give rise two different domains, or regimes, governing the behavior of evolutionary trajectories (Boettiger et al., 2010). In the next chapter, I turn to the question of identifying evolutionary shifts from data using phylogenetic trees and morphological trait data of extant species (Boettiger et al., 2012). In the last chapter, I adapt the approach of the previous section which allowed me to quantify the information available in a given data set that could detect a shift into an approach for detecting regime shifts in ecological time series data before the occur (Boettiger and Hastings, 2012)."

[[6]]$total_size
[1] "1.91 MB"

[[6]]$authors
[[6]]$authors[[1]]
[[6]]$authors[[1]]$first_name
[1] "Carl"

[[6]]$authors[[1]]$last_name
[1] "Boettiger"

[[6]]$authors[[1]]$id
[1] 96387

[[6]]$authors[[1]]$full_name
[1] "Carl Boettiger"



[[6]]$tags
[[6]]$tags[[1]]
[[6]]$tags[[1]]$id
[1] 49036

[[6]]$tags[[1]]$name
[1] " warning singals"


[[6]]$tags[[2]]
[[6]]$tags[[2]]$id
[1] 49035

[[6]]$tags[[2]]$name
[1] "regime shifts"



[[6]]$categories
[[6]]$categories[[1]]
[[6]]$categories[[1]]$id
[1] 24

[[6]]$categories[[1]]$name
[1] "Evolutionary biology"


[[6]]$categories[[2]]
[[6]]$categories[[2]]$id
[1] 39

[[6]]$categories[[2]]$name
[1] "Ecology"



[[6]]$files
[[6]]$files[[1]]
[[6]]$files[[1]]$download_url
[1] "http://files.figshare.com/142977/dissertation.pdf"

[[6]]$files[[1]]$size
[1] "1.91 MB"

[[6]]$files[[1]]$id
[1] 142977

[[6]]$files[[1]]$mime_type
[1] "application/pdf"

[[6]]$files[[1]]$name
[1] "dissertation.pdf"



[[6]]$links
[[6]]$links[[1]]
[[6]]$links[[1]]$link
[1] "http://carlboettiger.info"

[[6]]$links[[1]]$id
[1] 1235




[[7]]
[[7]]$article_id
[1] 96919

[[7]]$title
[1] "Lab Notebook, 2011"

[[7]]$defined_type
[1] "fileset"

[[7]]$status
[1] "Public"

[[7]]$version
[1] 1

[[7]]$published_date
[1] "22:44, Oct 29, 2012"

[[7]]$description
[1] "<p>Permanent archive of Carl Boettiger's open lab notebook entries for the year 2011 (<a href=\"http://www.carlboettiger.info/archives.html\">http://www.carlboettiger.info/archives.html</a>).&nbsp;Entries are archived in plain text UTF-8. Written in pandoc-flavored Markdown.&nbsp;Meets the goals of the Data Management Plan:&nbsp;<a href=\"http://www.carlboettiger.info/2012/10/09/data-management-plan.html\">http://www.carlboettiger.info/2012/10/09/data-management-plan.html</a></p>"

[[7]]$description_nohtml
[1] "Permanent archive of Carl Boettiger's open lab notebook entries for the year 2011 (http://www.carlboettiger.info/archives.htmlhttp://www.carlboettiger.info/2012/10/09/data-management-plan.html"

[[7]]$total_size
[1] "334.22 KB"

[[7]]$authors
[[7]]$authors[[1]]
[[7]]$authors[[1]]$first_name
[1] "Carl"

[[7]]$authors[[1]]$last_name
[1] "Boettiger"

[[7]]$authors[[1]]$id
[1] 96387

[[7]]$authors[[1]]$full_name
[1] "Carl Boettiger"



[[7]]$tags
[[7]]$tags[[1]]
[[7]]$tags[[1]]$id
[1] 48404

[[7]]$tags[[1]]$name
[1] "Ecology"


[[7]]$tags[[2]]
[[7]]$tags[[2]]$id
[1] 11917

[[7]]$tags[[2]]$name
[1] "ecology"


[[7]]$tags[[3]]
[[7]]$tags[[3]]$id
[1] 46723

[[7]]$tags[[3]]$name
[1] " open science"


[[7]]$tags[[4]]
[[7]]$tags[[4]]$id
[1] 47395

[[7]]$tags[[4]]$name
[1] " evolution"



[[7]]$categories
[[7]]$categories[[1]]
[[7]]$categories[[1]]$id
[1] 24

[[7]]$categories[[1]]$name
[1] "Evolutionary biology"


[[7]]$categories[[2]]
[[7]]$categories[[2]]$id
[1] 39

[[7]]$categories[[2]]$name
[1] "Ecology"



[[7]]$files
[[7]]$files[[1]]
[[7]]$files[[1]]$download_url
[1] "http://files.figshare.com/101976/2011.tar.gz"

[[7]]$files[[1]]$size
[1] "342 KB"

[[7]]$files[[1]]$id
[1] 101976

[[7]]$files[[1]]$mime_type
[1] "application/x-gzip"

[[7]]$files[[1]]$name
[1] "2011.tar.gz"



[[7]]$links
[[7]]$links[[1]]
[[7]]$links[[1]]$link
[1] "http://www.carlboettiger.info/2011"

[[7]]$links[[1]]$id
[1] 1148




[[8]]
[[8]]$article_id
[1] 96916

[[8]]$title
[1] "Lab Notebook, 2010"

[[8]]$defined_type
[1] "fileset"

[[8]]$status
[1] "Public"

[[8]]$version
[1] 1

[[8]]$published_date
[1] "22:39, Oct 29, 2012"

[[8]]$description
[1] "<p>Permanent archive of Carl Boettiger's open lab notebook entries for the year 2010 (<a href=\"http://www.carlboettiger.info/archives.html\">http://www.carlboettiger.info/archives.html</a>).&nbsp;Entries are archived in plain text UTF-8. Written in pandoc-flavored Markdown.&nbsp;Meets the goals of the Data Management Plan:&nbsp;<a href=\"http://www.carlboettiger.info/2012/10/09/data-management-plan.html\">http://www.carlboettiger.info/2012/10/09/data-management-plan.html</a></p>"

[[8]]$description_nohtml
[1] "Permanent archive of Carl Boettiger's open lab notebook entries for the year 2010 (http://www.carlboettiger.info/archives.htmlhttp://www.carlboettiger.info/2012/10/09/data-management-plan.html"

[[8]]$total_size
[1] "253.80 KB"

[[8]]$authors
[[8]]$authors[[1]]
[[8]]$authors[[1]]$first_name
[1] "Carl"

[[8]]$authors[[1]]$last_name
[1] "Boettiger"

[[8]]$authors[[1]]$id
[1] 96387

[[8]]$authors[[1]]$full_name
[1] "Carl Boettiger"



[[8]]$tags
[[8]]$tags[[1]]
[[8]]$tags[[1]]$id
[1] 48404

[[8]]$tags[[1]]$name
[1] "Ecology"


[[8]]$tags[[2]]
[[8]]$tags[[2]]$id
[1] 11917

[[8]]$tags[[2]]$name
[1] "ecology"


[[8]]$tags[[3]]
[[8]]$tags[[3]]$id
[1] 46723

[[8]]$tags[[3]]$name
[1] " open science"


[[8]]$tags[[4]]
[[8]]$tags[[4]]$id
[1] 47395

[[8]]$tags[[4]]$name
[1] " evolution"



[[8]]$categories
[[8]]$categories[[1]]
[[8]]$categories[[1]]$id
[1] 24

[[8]]$categories[[1]]$name
[1] "Evolutionary biology"


[[8]]$categories[[2]]
[[8]]$categories[[2]]$id
[1] 39

[[8]]$categories[[2]]$name
[1] "Ecology"



[[8]]$files
[[8]]$files[[1]]
[[8]]$files[[1]]$download_url
[1] "http://files.figshare.com/101975/2010.tar.gz"

[[8]]$files[[1]]$size
[1] "260 KB"

[[8]]$files[[1]]$id
[1] 101975

[[8]]$files[[1]]$mime_type
[1] "application/x-gzip"

[[8]]$files[[1]]$name
[1] "2010.tar.gz"



[[8]]$links
list()


[[9]]
[[9]]$article_id
[1] 95839

[[9]]$title
[1] "R code for the function fs_create "

[[9]]$defined_type
[1] "dataset"

[[9]]$status
[1] "Public"

[[9]]$version
[1] 1

[[9]]$published_date
[1] "19:48, Sep 13, 2012"

[[9]]$description
[1] "<p>An R implementation of the figshare API function to create a new article. &nbsp;Look Ma, I can share nice code on figshare!</p>\n<p>&nbsp;</p>\n<p>This function is part of the <a href=\"https://github.com/ropensci/rfigshare\">rfigshare</a> package by the <a href=\"http://ropensci.org\">rOpenSci</a> project. &nbsp;</p>"

[[9]]$description_nohtml
[1] "An R implementation of the figshare API function to create a new article.  Look Ma, I can share nice code on figshare!This function is part of therfigsharerOpenSci"

[[9]]$total_size
[1] "2.04 KB"

[[9]]$authors
[[9]]$authors[[1]]
[[9]]$authors[[1]]$first_name
[1] "Carl"

[[9]]$authors[[1]]$last_name
[1] "Boettiger"

[[9]]$authors[[1]]$id
[1] 96387

[[9]]$authors[[1]]$full_name
[1] "Carl Boettiger"



[[9]]$tags
[[9]]$tags[[1]]
[[9]]$tags[[1]]$id
[1] 47906

[[9]]$tags[[1]]$name
[1] " code"


[[9]]$tags[[2]]
[[9]]$tags[[2]]$id
[1] 47624

[[9]]$tags[[2]]$name
[1] "R"


[[9]]$tags[[3]]
[[9]]$tags[[3]]$id
[1] 42046

[[9]]$tags[[3]]$name
[1] "r"



[[9]]$categories
[[9]]$categories[[1]]
[[9]]$categories[[1]]$id
[1] 77

[[9]]$categories[[1]]$name
[1] "Applied Computer Science"



[[9]]$files
[[9]]$files[[1]]
[[9]]$files[[1]]$download_url
[1] "http://files.figshare.com/98377/fs_create.R"

[[9]]$files[[1]]$size
[1] "2 KB"

[[9]]$files[[1]]$id
[1] 98377

[[9]]$files[[1]]$mime_type
[1] "text/plain"

[[9]]$files[[1]]$name
[1] "fs_create.R"



[[9]]$links
list()


[[10]]
[[10]]$article_id
[1] 138

[[10]]$title
[1] "Labrid adaptive peaks"

[[10]]$defined_type
[1] "figure"

[[10]]$status
[1] "Public"

[[10]]$version
[1] 2

[[10]]$published_date
[1] "13:45, Dec 30, 2011"

[[10]]$description
[1] "<p>Described in the notebook: http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Comparative_Phylogenetics/2010/03/12</p>"

[[10]]$description_nohtml
[1] "Described in the notebook: http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Comparative_Phylogenetics/2010/03/12"

[[10]]$total_size
[1] "29.71 KB"

[[10]]$authors
[[10]]$authors[[1]]
[[10]]$authors[[1]]$first_name
[1] "Carl"

[[10]]$authors[[1]]$last_name
[1] "Boettiger"

[[10]]$authors[[1]]$id
[1] 96387

[[10]]$authors[[1]]$full_name
[1] "Carl Boettiger"



[[10]]$tags
[[10]]$tags[[1]]
[[10]]$tags[[1]]$id
[1] 277

[[10]]$tags[[1]]$name
[1] "comparative methods"


[[10]]$tags[[2]]
[[10]]$tags[[2]]$id
[1] 276

[[10]]$tags[[2]]$name
[1] "phylogenetics"


[[10]]$tags[[3]]
[[10]]$tags[[3]]$id
[1] 275

[[10]]$tags[[3]]$name
[1] "fins"


[[10]]$tags[[4]]
[[10]]$tags[[4]]$id
[1] 274

[[10]]$tags[[4]]$name
[1] "labrids"



[[10]]$categories
[[10]]$categories[[1]]
[[10]]$categories[[1]]$id
[1] 24

[[10]]$categories[[1]]$name
[1] "Evolutionary biology"


[[10]]$categories[[2]]
[[10]]$categories[[2]]$id
[1] 39

[[10]]$categories[[2]]$name
[1] "Ecology"



[[10]]$files
[[10]]$files[[1]]
[[10]]$files[[1]]$download_url
[1] "http://files.figshare.com/137/Labrid_fins.png"

[[10]]$files[[1]]$size
[1] "30 KB"

[[10]]$files[[1]]$id
[1] 137

[[10]]$files[[1]]$mime_type
[1] "image/png"

[[10]]$files[[1]]$name
[1] "Labrid_fins.png"



[[10]]$links
list()

```


Note that we can easily grab the ids with the wrapper function `fs_ids`:



```r
fs_ids(all_mine)
```

```
 [1] 105136 105135  97653  97500  97279  97218  96919  96916  95839    138
```




We can delete unwanted files that are not public with `fs_delete`:  


```r
fs_delete(id)
```

