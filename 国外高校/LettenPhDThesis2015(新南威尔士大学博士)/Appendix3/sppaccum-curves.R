library(reshape)
library(picante)
library(ape)
library(phylobase)
library(ggplot2)
library(ggthemes)
library(Cairo)
library(plyr)
library(scales)
library(splines)
library(lme4)
library(lmerTest)
library(visreg)

source("JibbonR/prsb_revise_funcs.R")
source("JibbonR/jib_import.R")

# choose community resolution - options are "full", "mono" or "commel"
comm.decide("full")

spec_accum = specaccum(community, method = "random", permutations = 100,
          conditioned =TRUE, gamma = "jack1")
plot(spec_accum)


