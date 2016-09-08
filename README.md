#cmsr

Commission management system **(cmsr)** 

cmsr turns the incentive calculation into a very simple process that, after configuration and association to a target group, includes the incentive plan validation and simulation through what-if scenarios. This is completed, in order to determine the financial and sales potential impact before going to production (like weDo technology)
## Installation

You can install cmsr from github with:

```R
# install.packages("devtools")
devtools::install_github("jmcimula/cmsr")
```

## Key functions

* `data(cmsales)`: A dataset containing the sales reps activities
* `cms_markdown()`: commission based on the Mark Down value
* `cms_markup()`: commission based on the Mark Up value
* `cmscalc()`: calculation of commission of sales reps
* `cmscalc()`: calculation of the bonus based on the performance of the sales reps

## Licence

GPL (>= 2)

### Author

Jean Marie Cimula
