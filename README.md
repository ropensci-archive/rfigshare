---
title: rfigshare tutorial
author: Carl Boettiger
---


<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{An Introduction to the rfigshare package}
-->

[![Build Status](https://api.travis-ci.org/ropensci/rfigshare.png)](https://travis-ci.org/ropensci/rfigshare)




rfigshare
==========

*An R interface to [FigShare](http://figshare.com)*

* Maintainer: Carl Boettiger, [cboettig](https://github.com/cboettig)
* License: [CC0](http://creativecommons.org/publicdomain/zero/1.0/)
* Contact: Report bugs, questions, or feature requests on the [Issues Tracker](https://github.com/ropensci/rfigshare/issues), or get in touch with us at [info@ropensci.org](mailto:info@ropensci.org)

Installation
------------



```r
require(devtools)
install_github("rfigshare", "ropensci")
```

Getting Started
---------------



# Using rfigshare



```r
require(rfigshare)
```




The first time you use an `rfigshare` function, it will ask you to authenticate online. Just log in and click okay to authenticate rfigshare.  R will allow you to cache your login credentials so that you won't be asked to authenticate again (even between R sessions), as long as you are using the same working directory in future.  

Try a search for an author:



```r
fs_author_search("Boettiger")
```

```
## list()
```



Try creating your own content:



```r
id <- fs_create("Test title", "description of test")
```

```
## Your article has been created! Your id number is 1126334
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

```
##        id  name                                                      
##   [1,] 1   Biophysics                                                
##   [2,] 4   Biochemistry                                              
##   [3,] 7   Medicine                                                  
##   [4,] 8   Microbiology                                              
##   [5,] 10  Anatomy                                                   
##   [6,] 11  Behavioral Neuroscience                                   
##   [7,] 12  Cell Biology                                              
##   [8,] 13  Genetics                                                  
##   [9,] 14  Molecular Biology                                         
##  [10,] 15  Neuroscience                                              
##  [11,] 16  Physiology                                                
##  [12,] 17  Geography                                                 
##  [13,] 19  Pharmacology                                              
##  [14,] 20  Computer Engineering                                      
##  [15,] 21  Biotechnology                                             
##  [16,] 23  Software Engineering                                      
##  [17,] 24  Evolutionary Biology                                      
##  [18,] 25  Anthropology                                              
##  [19,] 27  Economics                                                 
##  [20,] 28  Paleontology                                              
##  [21,] 29  Geology                                                   
##  [22,] 31  Environmental Chemistry                                   
##  [23,] 32  Geochemistry                                              
##  [24,] 34  Environmental Science                                     
##  [25,] 35  Limnology                                                 
##  [26,] 36  Oceanography                                              
##  [27,] 37  Organic Chemistry                                         
##  [28,] 39  Ecology                                                   
##  [29,] 42  Biological Engineering                                    
##  [30,] 44  Toxicology                                                
##  [31,] 45  Sociology                                                 
##  [32,] 46  Immunology                                                
##  [33,] 47  Stereochemistry                                           
##  [34,] 54  Planetary Geology                                         
##  [35,] 55  Stellar Astronomy                                         
##  [36,] 56  Galactic Astronomy                                        
##  [37,] 57  Cosmology                                                 
##  [38,] 58  Astrophysics                                              
##  [39,] 59  Planetary Science                                         
##  [40,] 61  Developmental Biology                                     
##  [41,] 62  Marine Biology                                            
##  [42,] 63  Parasitology                                              
##  [43,] 64  Cancer                                                    
##  [44,] 65  Botany                                                    
##  [45,] 66  Crystallography                                           
##  [46,] 69  Inorganic Chemistry                                       
##  [47,] 70  Molecular Physics                                         
##  [48,] 71  Nuclear Chemistry                                         
##  [49,] 73  Radiochemistry                                            
##  [50,] 75  Supramolecular Chemistry                                  
##  [51,] 76  Theoretical Computer Science                              
##  [52,] 77  Applied Computer Science                                  
##  [53,] 78  Atmospheric Sciences                                      
##  [54,] 79  Geophysics                                                
##  [55,] 80  Hydrology                                                 
##  [56,] 82  Mineralogy                                                
##  [57,] 84  Paleoclimatology                                          
##  [58,] 85  Palynology                                                
##  [59,] 86  Physical Geography                                        
##  [60,] 87  Soil Science                                              
##  [61,] 88  Agricultural Engineering                                  
##  [62,] 89  Aerospace Engineering                                     
##  [63,] 90  Genetic Engineering                                       
##  [64,] 91  Mechanical Engineering                                    
##  [65,] 92  Nuclear Engineering                                       
##  [66,] 94  Art                                                       
##  [67,] 95  Design                                                    
##  [68,] 97  Law                                                       
##  [69,] 98  Literature                                                
##  [70,] 99  Performing Arts                                           
##  [71,] 100 Philosophy                                                
##  [72,] 102 Algebra                                                   
##  [73,] 103 Geometry                                                  
##  [74,] 104 Probability                                               
##  [75,] 105 Statistics                                                
##  [76,] 106 Science Policy                                            
##  [77,] 107 Applied Physics                                           
##  [78,] 108 Atomic Physics                                            
##  [79,] 109 Computational Physics                                     
##  [80,] 110 Condensed Matter Physics                                  
##  [81,] 111 Mechanics                                                 
##  [82,] 112 Particle Physics                                          
##  [83,] 113 Plasma Physics                                            
##  [84,] 114 Quantum Mechanics                                         
##  [85,] 115 Solid Mechanics                                           
##  [86,] 116 Thermodynamics                                            
##  [87,] 117 Entropy                                                   
##  [88,] 118 General Relativity                                        
##  [89,] 119 M-Theory                                                  
##  [90,] 120 Special Relativity                                        
##  [91,] 122 Mental Health                                             
##  [92,] 125 Bioinformatics                                            
##  [93,] 126 History                                                   
##  [94,] 127 Archaeology                                               
##  [95,] 128 Hematology                                                
##  [96,] 129 Education                                                 
##  [97,] 130 Survey Results                                            
##  [98,] 131 Anesthesiology                                            
##  [99,] 132 Infectious Diseases                                       
## [100,] 133 Plant Biology                                             
## [101,] 134 Virology                                                  
## [102,] 135 Computational  Biology                                    
## [103,] 136 NMR Spectroscopy                                          
## [104,] 137 Cheminformatics                                           
## [105,] 138 Numerical Analysis                                        
## [106,] 139 Pathology                                                 
## [107,] 140 Cardiology                                                
## [108,] 141 Computational Chemistry                                   
## [109,] 143 Solid Earth Sciences                                      
## [110,] 144 Climate Science                                           
## [111,] 145 Solar System, Solar Physics, Planets and Exoplanets       
## [112,] 146 Space Science                                             
## [113,] 147 Stars, Variable Stars                                     
## [114,] 148 Instrumentation, Techniques, and Astronomical Observations
## [115,] 149 Interstellar and Intergalactic Matter                     
## [116,] 150 Extragalactic Astronomy                                   
## [117,] 151 Biomarkers                                                
## [118,] 152 Pathogenesis                                              
## [119,] 153 Health Care                                               
## [120,] 154 Diseases                                                  
## [121,] 155 Stem Cells                                                
## [122,] 156 Systems Biology                                           
## [123,] 157 Structural Biology                                        
## [124,] 158 Biological Techniques                                     
## [125,] 159 Zoology                                                   
## [126,] 160 Digital Humanities                                        
## [127,] 161 Disability Studies                                        
## [128,] 162 Drama                                                     
## [129,] 163 Entertainment                                             
## [130,] 164 Environmental Humanities                                  
## [131,] 165 Ethnic Studies                                            
## [132,] 166 Gender studies                                            
## [133,] 167 Language                                                  
## [134,] 168 Linguistics                                               
## [135,] 169 Media Studies                                             
## [136,] 170 Museology                                                 
## [137,] 171 Religious Studies                                         
## [138,] 172 Rhetoric                                                  
## [139,] 173 Applied Psychology                                        
## [140,] 174 Clinical Psychology                                       
## [141,] 175 Developmental and Educational Psychology                  
## [142,] 176 Neuroscience and Physiological Psychology                 
## [143,] 177 Organizational Behavioral Psychology                      
## [144,] 178 Personality, Social and Criminal Psychology               
## [145,] 179 Artificial Intelligence and Image Processing              
## [146,] 180 Computation Theory and Mathematics                        
## [147,] 181 Computer Software                                         
## [148,] 182 Data Format                                               
## [149,] 183 Distributed Computing                                     
## [150,] 184 Information Systems                                       
## [151,] 185 Library and Information Studies
```


And we can add the category or categories we like,



```r
fs_add_categories(id, c("Education", "Software Engineering"))
```



The file we have created remains saved as a draft until we publish it, either publicly or privately.  Note that once a file is declared public, it cannot be made private or deleted.  Let's release this dataset privately:



```r
fs_make_private(id)
```

```
## Response [http://api.figshare.com/v1/my_data/articles/1126334/action/make_private]
##   Status: 200
##   Content-type: application/json; charset=UTF-8
##   Size: 48 B
## {"success": "Article status changed to Private"}
```


We can now share the dataset with collaborators by way of the private url.  

### The quick and easy way

The `rfigshare` package will let you create a new figshare article with additional authors, tags, categories, etc in a single command usnig the `fs_new_article` function.  The essential metadata `title`, `description` and `type` are required, but any other information we omit at this stage can be added later.  If we set `visibility` to private or public, the article is published on figshare immediately.  



```r
data(mtcars)
write.csv(mtcars,"mtcars.csv")
id <- fs_new_article(title="A Test of rfigshare", 
                     description="This is a test", 
                     type="dataset", 
                     authors=c("Karthik Ram", "Scott Chamberlain"), 
                     tags=c("ecology", "openscience"), 
                     categories="Ecology", 
                     links="http://ropensci.org", 
                     files="mtcars.csv",
                     visibility="private")
```

```
## Your article has been created! Your id number is 1126335
```

```r
unlink("mtcars.csv") # clean up
```


# Examining Data on Figshare

We can view all available metadata of a figshare object. 



```r
fs_details(id)
```

```
## article_id: 1.1263e+06
## title: A Test of rfigshare
## master_publisher_id: 0.0e+00
## defined_type: dataset
## status: Private
## version: 1.0
## published_date: 06:25, Aug 03, 2014
## description: This is a test
## description_nohtml: This is a test
## total_size: 1.70 KB
## authors:
## - first_name: Ropensci
##   last_name: Testaccount
##   id: 4.3142e+05
##   full_name: Ropensci TestAccount
## - first_name: Karthik
##   last_name: Ram
##   id: 9.7306e+04
##   full_name: Karthik Ram
## - first_name: Scott
##   last_name: Chamberlain
##   id: 9.6554e+04
##   full_name: Scott Chamberlain
## tags:
## - id: 1.9539e+05
##   name: Published using rfigshare
## - id: 4.7864e+04
##   name: openscience
## - id: 1.1917e+04
##   name: ecology
## categories:
## - id: 39.0
##   name: Ecology
## files:
## - size: 2 KB
##   thumb: ~
##   id: 1.6204e+06
##   mime_type: text/plain
##   name: mtcars.csv
## links:
## - link: http://ropensci.org
##   id: 673.0
```

You can see all of the files you have (Currently only up to 10):



```r
mine <- fs_browse()
mine[1:2]
```

```
## [[1]]
## article_id: 1.1263e+06
## title: A Test of rfigshare
## master_publisher_id: 0.0e+00
## defined_type: dataset
## status: Private
## version: 1.0
## published_date: 06:25, Aug 03, 2014
## description: This is a test
## description_nohtml: This is a test
## total_size: 1.70 KB
## authors:
## - first_name: Ropensci
##   last_name: Testaccount
##   id: 4.3142e+05
##   full_name: Ropensci TestAccount
## - first_name: Karthik
##   last_name: Ram
##   id: 9.7306e+04
##   full_name: Karthik Ram
## - first_name: Scott
##   last_name: Chamberlain
##   id: 9.6554e+04
##   full_name: Scott Chamberlain
## tags:
## - id: 1.9539e+05
##   name: Published using rfigshare
## - id: 4.7864e+04
##   name: openscience
## - id: 1.1917e+04
##   name: ecology
## categories:
## - id: 39.0
##   name: Ecology
## files:
## - size: 2 KB
##   thumb: ~
##   id: 1.6204e+06
##   mime_type: text/plain
##   name: mtcars.csv
## links:
## - link: http://ropensci.org
##   id: 673.0
## 
## [[2]]
## article_id: 1.1263e+06
## title: Test title
## master_publisher_id: 0.0e+00
## defined_type: dataset
## status: Private
## version: 1.0
## published_date: 06:25, Aug 03, 2014
## description: description of test
## description_nohtml: description of test
## total_size: 1.70 KB
## authors:
## - first_name: Ropensci
##   last_name: Testaccount
##   id: 4.3142e+05
##   full_name: Ropensci TestAccount
## tags:
## - id: 1.5681e+04
##   name: demo
## - id: 1.9539e+05
##   name: Published using rfigshare
## categories:
## - id: 23.0
##   name: Software Engineering
## - id: 129.0
##   name: Education
## files:
## - size: 2 KB
##   thumb: ~
##   id: 1.6204e+06
##   mime_type: text/plain
##   name: mtcars.csv
## links: []
```

Note that we can easily grab the ids with the wrapper function `fs_ids`:




```r
fs_ids(mine)
```

```
##  [1] 1126335 1126334 1126332 1126329 1126328 1126324 1126322 1126321
##  [9] 1126318 1126317
```


We can delete unwanted files that are not public with `fs_delete`:  



```r
fs_delete(id)
```

To cite package `rfigshare` in publications use:



```r
citation("rfigshare")
```

```
## 
## To cite package 'rfigshare' in publications use:
## 
##   Carl Boettiger, Scott Chamberlain, Karthik Ram and Edmund Hart
##   (2014). rfigshare: an R interface to figshare.com.. R package
##   version 0.3-1. http://CRAN.R-project.org/package=rfigshare
## 
## A BibTeX entry for LaTeX users is
## 
##   @Manual{,
##     title = {rfigshare: an R interface to figshare.com.},
##     author = {Carl Boettiger and Scott Chamberlain and Karthik Ram and Edmund Hart},
##     year = {2014},
##     note = {R package version 0.3-1},
##     url = {http://CRAN.R-project.org/package=rfigshare},
##   }
```


[![ropensci.org logo](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)\
