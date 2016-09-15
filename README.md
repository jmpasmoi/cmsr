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
* `data(cmstelecom)`: Activation tracking of sales forces in telecom industry
* `cms_markdown()`: commission based on the Mark Down value
* `cms_markup()`: commission based on the Mark Up value
* `cmscalc()`: calculation of commission of sales reps
* `cms_kpi_rate()`: calculation of the bonus based on the performance of the sales reps

## Example 

``` r
library(cmsr) # for functions

#> cmscalc(cmsales,com.type="Markdown",rmv.na= TRUE)
#   sales_rep_id   region product total_prod target sales total_price total_disc total_sales      bonus  markdown
#1      SLREP001 kinshasa    Beer        710    533   450     1093.40   644.4900    668.7450  2.3777600 0.4105634
#2      SLREP001 kinshasa  Flower        410    308   338      676.50   518.6610    538.1805  2.7864375 0.2333171
#3      SLREP001 kinshasa   Fruit       1050    788   824      787.50   574.7400    596.3700  1.7107210 0.2701714
#4      SLREP001 kinshasa    Shoe        165    125   149     1153.35   968.6043   1005.0572 18.1739001 0.1601818
#5      SLREP001 kinshasa    Soap        125     95    88      100.00    65.4720     67.9360  0.7018182 0.3452800
#6      SLREP002  katanga    Beer        635    478   597      977.90   855.0234    887.2017  4.2093300 0.1256535
#7      SLREP002  katanga  Flower        420    315   358      693.00   549.3510    570.0255  4.0071625 0.2072857
#8      SLREP002  katanga   Fruit       1190    893  1011      892.50   705.1725    731.7113  1.8336331 0.2098908
#9      SLREP002  katanga    Shoe        190    144   124     1328.10   806.0868    836.4234  5.6660940 0.3930526
#10     SLREP002  katanga    Soap        165    124   136      132.00   101.1840    104.9920  1.4153333 0.2334545
#11     SLREP003 bascongo    Beer        650    488   485     1001.00   694.6170    720.7585  2.4565233 0.3060769
#12     SLREP003 bascongo  Flower        480    361   394      792.00   604.5930    627.3465  3.8409969 0.2366250
#13     SLREP003 bascongo   Fruit       1200    901  1018      900.00   710.0550    736.7775  1.8148580 0.2110500
#14     SLREP003 bascongo    Shoe        195    147   136     1363.05   884.0952    917.3676  6.7453500 0.3513846
#15     SLREP003 bascongo    Soap        195    147   170      156.00   126.4800    131.2400  1.9968077 0.1892308
#16     SLREP004 bandundu    Beer        685    515   623     1054.90   892.2606    925.8403  4.0132865 0.1541752
#17     SLREP004 bandundu  Flower        535    402   448      882.75   687.4560    713.3280  2.7866205 0.2212336
#18     SLREP004 bandundu   Fruit       1220    916  1106      915.00   771.4350    800.4675  2.0024982 0.1569016
#19     SLREP004 bandundu    Shoe        200    152   161     1398.00  1046.6127   1086.0014 11.2872190 0.2513500
#20     SLREP004 bandundu    Soap        225    170   182      180.00   135.4080    140.5040  1.4987717 0.2477333
```

This dashboard could allow the GTM (GoToMarket) teams to track the performance in acquisition (Activations, Gross connection, reconnection, Churn, Net Add) in order to enhance the visibility of activations carried out by the sales forces.

``` r
#> cms_tracker(cmstelecom, region = c("kinshasa","katanga","bandundu"), from = "2016-06-01", to = "2016-06-03")
#  agent_id ADJ DISC GCN  NN NWR PREACT REC
#1 SLREP001 105  163 194  61  89     91  30
#2 SLREP002  92   22 228 260 136    198  54
#3 SLREP003  71   69 208 189 137    228  50
#4 SLREP004 120   46 276 277 156    276  47
#5 SLREP005  65  103 161 126  96    193  68
```

It is possible to fix the target in acquisition for tracking the performance of the sales forces in this order (ADJ,DISC,GCN,NN,NWR,PREACT,REC). Please use `?cmstelecom` to learn more about these variables.

How to run this function with the target:

``` r
cms_tracker(cmstelecom, region = c("kinshasa","katanga","bandundu"), 
                        from = "2016-06-01", to = "2016-06-03", 
						set.target = c(100,130,90,80,75,120,100)
			)
```

### Author

Jean Marie Cimula

## Licence

GPL (>= 2)
