# RKEEL: Using Keel in R code

## Install RKEEL
There is two ways to install RKEEL package.

First and better, it is possible to install it from CRAN repository. For that, only have to type the following:
```
> install.packages("RKEEL")
> library(RKEEL)
```

The second way to install it is downloading the last version of the source packages from *bin* folder.
Then, in R, only have to type:
```
> install.packages(RKEELdata_x.tar.gz, repos = NULL)
> library("RKEELdata")
> install.packages(RKEEL_x.tar.gz, repos = NULL)
> library("RKEEL")
```


## CITATION
In order to cite this work, use the following reference or the *citation.bib* file to use in latex. The package was originally presented at FUZZ-IEEE 2016 international conference [Moy16], and later integrated into a new version of the KEEL software that was published in IJCIS journal [Tri17].

> [Moy16] J.M. Moyano and L. Sanchez. (2016). RKEEL: Using RKEEL: Using KEEL in R code. In *2016 IEEE International Conference on Fuzzy Systems, FUZZ-IEEE 2016*, 257-264. DOI: 10.1109/FUZZ-IEEE.2016.7737695.

> [Tri17] I. Triguero, S. González, J.M. Moyano, S. García López, J. Alcalá Fernández, J. Luengo Martín, A.L. Fernández Hilario, M.J. del Jesús Díaz, L. Sánchez, and F. Herrera. (2017). KEEL 3.0: An open source software for multi-stage analysis in data mining. *International Journal of Computational Intelligence Systems*, 10(1): 1238-1249. DOI: 10.2991/ijcis.10.1.82.
