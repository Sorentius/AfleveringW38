# Opgave 1
library(tidyverse)
rooms <- c(1, 5, 2, 1, 3, 1, NA, 3, 1, 3, 2, 1, NA, 1, 8, 3, 1, 4, NA, 1, 3, 1, 2, 1, 7, 1, NA)
# Jeg fjerner for god ordens skyld NA'erne
rooms_uden_NA <- na.omit(rooms)
rooms_mere_end_2 <- rooms_uden_NA[rooms_uden_NA > 2]
# Jeg kan nu ved hjælp af length-kommandoen tjekke antallet af huse med flere end 2 værelser
length(rooms_mere_end_2)
# Konsollen siger 9, dvs. mission accomplisched.

# Opgave 2
class(rooms)
# Konsollen siger numeric. Dvs. det drejer sig om tal.

# Opgave 3 
median(rooms)
# Konsollen siger NA - vi skal eksplicitere at R ikke skal medtage NA'erne i sine beregninger
?median()
median(rooms, na.rm = TRUE)
# Konsollen siger, at medianen er 2.

# Opgave 4
# Vi starter med at hente den ønskede fil ned i en dertil oprettet data-mappe
dir.create("data")
download.file(
  "https://raw.githubusercontent.com/datacarpentry/r-socialsci/main/episodes/data/SAFI_clean.csv",
  "data/SAFI_clean.csv", mode = "wb"
)
# Vi kan nu indlæse i R
library(here)
interviews <- read_csv(
  here("data", "SAFI_clean.csv"), 
  na = "NULL")
interviews

# Opgave 5
# Jeg startede med i et nyt excelark at indlæse mine kongedata og tilføje en ekstra søjle der angav regeringstiden i år. Derpå indlæser jeg i R
DKkings <- read_csv2(here("data", "DKkings.csv"))
DKkings   
# Jeg opretter et objekt baseret på den 10. søjle i mit excelark - netop søjlen med regeringstiderne
years_reigning <- DKkings[[10]]
# Og nu kan vi - dvs. R - regne løs
median(years_reigning, na.rm = TRUE)
# Konsollen spytter værdien 17 ud. Dvs. medianregeringstiden er 17 år. Jeg tæller ikke efter!
mean(years_reigning, na.rm = TRUE)
# Konsollen spytter værdien 19.49057 ud. Dvs. den gennemsnitlige regeringstid er ca. 19.5 år. Jeg tæller ikke efter!

