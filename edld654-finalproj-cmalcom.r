{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "bb400a9b",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-12-05T23:40:55.490716Z",
     "iopub.status.busy": "2022-12-05T23:40:55.488080Z",
     "iopub.status.idle": "2022-12-05T23:40:58.877784Z",
     "shell.execute_reply": "2022-12-05T23:40:58.876034Z"
    },
    "papermill": {
     "duration": 3.398296,
     "end_time": "2022-12-05T23:40:58.880321",
     "exception": false,
     "start_time": "2022-12-05T23:40:55.482025",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.5 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "Attaching package: ‘recipes’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stringr’:\n",
      "\n",
      "    fixed\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stats’:\n",
      "\n",
      "    step\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "library(recipes)\n",
    "library(lubridate)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "341f33f5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:40:58.917778Z",
     "iopub.status.busy": "2022-12-05T23:40:58.888273Z",
     "iopub.status.idle": "2022-12-05T23:40:58.957131Z",
     "shell.execute_reply": "2022-12-05T23:40:58.955397Z"
    },
    "papermill": {
     "duration": 0.075825,
     "end_time": "2022-12-05T23:40:58.959500",
     "exception": false,
     "start_time": "2022-12-05T23:40:58.883675",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Import data\n",
    "abaloneAGE <- read.csv(\"../input/abalone-dataset/abalone.csv\",header=TRUE)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "367285cb",
   "metadata": {
    "papermill": {
     "duration": 0.003194,
     "end_time": "2022-12-05T23:40:58.965968",
     "exception": false,
     "start_time": "2022-12-05T23:40:58.962774",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Information on the Variables:\n",
    "\n",
    "Abalone is a marine snail and is an edible shellfish. Since abalones have been overfished in the past and are a vital part of the ecosystem the abalone fishery has regulations in place. Scientists want to determine if machine learning can be used to predict the age of an abalone to help guide these regulations.\n",
    "\n",
    "Typically the age of an abalone is found by cutting through the cone of the shell, which is then stained. Next the number of rings in the shell are counted through a microscope. This can be a lengthy process. Scientists hope measurements that are easier to obtain, such as abalone height, can be used to predict abalone age.\n",
    "\n",
    "The number of rings (an indicator of age) should be predicted as a continuous value [outcome variable]. There are 8 predictor variables, which are listed below.\n",
    "\n",
    "Name / Type of Data / Unit of Measurement / Description\n",
    "* Sex / nominal / -- / Male (M), Female (F), and Infant (I)\n",
    "* Length / continuous / millimeters (mm) / longest shell measurement (assume end to end)\n",
    "* Diameter / continuous / mm / perpendicular to length\n",
    "* Height / continuous / mm / with meat in shell\n",
    "* Whole weight / continuous / grams (g) / whole abalone\n",
    "* Shucked weight / continuous / g / weight of meat\n",
    "* Viscera weight / continuous / g / gut weight (after bleeding)\n",
    "* Shell weight / continuous / g / after being dried\n",
    "* Rings / integer / -- / + 1.5 gives the age in years"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "ad501d72",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:40:58.975095Z",
     "iopub.status.busy": "2022-12-05T23:40:58.973610Z",
     "iopub.status.idle": "2022-12-05T23:40:59.019209Z",
     "shell.execute_reply": "2022-12-05T23:40:59.017453Z"
    },
    "papermill": {
     "duration": 0.052575,
     "end_time": "2022-12-05T23:40:59.021532",
     "exception": false,
     "start_time": "2022-12-05T23:40:58.968957",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t4177 obs. of  9 variables:\n",
      " $ Sex           : chr  \"M\" \"M\" \"F\" \"M\" ...\n",
      " $ Length        : num  0.455 0.35 0.53 0.44 0.33 0.425 0.53 0.545 0.475 0.55 ...\n",
      " $ Diameter      : num  0.365 0.265 0.42 0.365 0.255 0.3 0.415 0.425 0.37 0.44 ...\n",
      " $ Height        : num  0.095 0.09 0.135 0.125 0.08 0.095 0.15 0.125 0.125 0.15 ...\n",
      " $ Whole.weight  : num  0.514 0.226 0.677 0.516 0.205 ...\n",
      " $ Shucked.weight: num  0.2245 0.0995 0.2565 0.2155 0.0895 ...\n",
      " $ Viscera.weight: num  0.101 0.0485 0.1415 0.114 0.0395 ...\n",
      " $ Shell.weight  : num  0.15 0.07 0.21 0.155 0.055 0.12 0.33 0.26 0.165 0.32 ...\n",
      " $ Rings         : int  15 7 9 10 7 8 20 16 9 19 ...\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 9</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Sex</th><th scope=col>Length</th><th scope=col>Diameter</th><th scope=col>Height</th><th scope=col>Whole.weight</th><th scope=col>Shucked.weight</th><th scope=col>Viscera.weight</th><th scope=col>Shell.weight</th><th scope=col>Rings</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>M</td><td>0.455</td><td>0.365</td><td>0.095</td><td>0.5140</td><td>0.2245</td><td>0.1010</td><td>0.150</td><td>15</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>M</td><td>0.350</td><td>0.265</td><td>0.090</td><td>0.2255</td><td>0.0995</td><td>0.0485</td><td>0.070</td><td> 7</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>F</td><td>0.530</td><td>0.420</td><td>0.135</td><td>0.6770</td><td>0.2565</td><td>0.1415</td><td>0.210</td><td> 9</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>M</td><td>0.440</td><td>0.365</td><td>0.125</td><td>0.5160</td><td>0.2155</td><td>0.1140</td><td>0.155</td><td>10</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>I</td><td>0.330</td><td>0.255</td><td>0.080</td><td>0.2050</td><td>0.0895</td><td>0.0395</td><td>0.055</td><td> 7</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>I</td><td>0.425</td><td>0.300</td><td>0.095</td><td>0.3515</td><td>0.1410</td><td>0.0775</td><td>0.120</td><td> 8</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 9\n",
       "\\begin{tabular}{r|lllllllll}\n",
       "  & Sex & Length & Diameter & Height & Whole.weight & Shucked.weight & Viscera.weight & Shell.weight & Rings\\\\\n",
       "  & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & M & 0.455 & 0.365 & 0.095 & 0.5140 & 0.2245 & 0.1010 & 0.150 & 15\\\\\n",
       "\t2 & M & 0.350 & 0.265 & 0.090 & 0.2255 & 0.0995 & 0.0485 & 0.070 &  7\\\\\n",
       "\t3 & F & 0.530 & 0.420 & 0.135 & 0.6770 & 0.2565 & 0.1415 & 0.210 &  9\\\\\n",
       "\t4 & M & 0.440 & 0.365 & 0.125 & 0.5160 & 0.2155 & 0.1140 & 0.155 & 10\\\\\n",
       "\t5 & I & 0.330 & 0.255 & 0.080 & 0.2050 & 0.0895 & 0.0395 & 0.055 &  7\\\\\n",
       "\t6 & I & 0.425 & 0.300 & 0.095 & 0.3515 & 0.1410 & 0.0775 & 0.120 &  8\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 9\n",
       "\n",
       "| <!--/--> | Sex &lt;chr&gt; | Length &lt;dbl&gt; | Diameter &lt;dbl&gt; | Height &lt;dbl&gt; | Whole.weight &lt;dbl&gt; | Shucked.weight &lt;dbl&gt; | Viscera.weight &lt;dbl&gt; | Shell.weight &lt;dbl&gt; | Rings &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | M | 0.455 | 0.365 | 0.095 | 0.5140 | 0.2245 | 0.1010 | 0.150 | 15 |\n",
       "| 2 | M | 0.350 | 0.265 | 0.090 | 0.2255 | 0.0995 | 0.0485 | 0.070 |  7 |\n",
       "| 3 | F | 0.530 | 0.420 | 0.135 | 0.6770 | 0.2565 | 0.1415 | 0.210 |  9 |\n",
       "| 4 | M | 0.440 | 0.365 | 0.125 | 0.5160 | 0.2155 | 0.1140 | 0.155 | 10 |\n",
       "| 5 | I | 0.330 | 0.255 | 0.080 | 0.2050 | 0.0895 | 0.0395 | 0.055 |  7 |\n",
       "| 6 | I | 0.425 | 0.300 | 0.095 | 0.3515 | 0.1410 | 0.0775 | 0.120 |  8 |\n",
       "\n"
      ],
      "text/plain": [
       "  Sex Length Diameter Height Whole.weight Shucked.weight Viscera.weight\n",
       "1 M   0.455  0.365    0.095  0.5140       0.2245         0.1010        \n",
       "2 M   0.350  0.265    0.090  0.2255       0.0995         0.0485        \n",
       "3 F   0.530  0.420    0.135  0.6770       0.2565         0.1415        \n",
       "4 M   0.440  0.365    0.125  0.5160       0.2155         0.1140        \n",
       "5 I   0.330  0.255    0.080  0.2050       0.0895         0.0395        \n",
       "6 I   0.425  0.300    0.095  0.3515       0.1410         0.0775        \n",
       "  Shell.weight Rings\n",
       "1 0.150        15   \n",
       "2 0.070         7   \n",
       "3 0.210         9   \n",
       "4 0.155        10   \n",
       "5 0.055         7   \n",
       "6 0.120         8   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "str(abaloneAGE)\n",
    "\n",
    "head(abaloneAGE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "04f75cbb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:40:59.031587Z",
     "iopub.status.busy": "2022-12-05T23:40:59.030227Z",
     "iopub.status.idle": "2022-12-05T23:40:59.046691Z",
     "shell.execute_reply": "2022-12-05T23:40:59.045141Z"
    },
    "papermill": {
     "duration": 0.023849,
     "end_time": "2022-12-05T23:40:59.049078",
     "exception": false,
     "start_time": "2022-12-05T23:40:59.025229",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sum(is.na(abaloneAGE))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "17cff9e9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:40:59.058872Z",
     "iopub.status.busy": "2022-12-05T23:40:59.057409Z",
     "iopub.status.idle": "2022-12-05T23:40:59.075873Z",
     "shell.execute_reply": "2022-12-05T23:40:59.073819Z"
    },
    "papermill": {
     "duration": 0.026074,
     "end_time": "2022-12-05T23:40:59.078597",
     "exception": false,
     "start_time": "2022-12-05T23:40:59.052523",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>1</li><li>29</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 1\n",
       "\\item 29\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 1\n",
       "2. 29\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1]  1 29"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#range of outcome variable\n",
    "range(abaloneAGE$Rings)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "ddff2f1f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:40:59.089256Z",
     "iopub.status.busy": "2022-12-05T23:40:59.087824Z",
     "iopub.status.idle": "2022-12-05T23:40:59.299765Z",
     "shell.execute_reply": "2022-12-05T23:40:59.298135Z"
    },
    "papermill": {
     "duration": 0.219506,
     "end_time": "2022-12-05T23:40:59.302041",
     "exception": false,
     "start_time": "2022-12-05T23:40:59.082535",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘psych’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:ggplot2’:\n",
      "\n",
      "    %+%, alpha\n",
      "\n",
      "\n",
      "Warning message in describeBy(abaloneAGE):\n",
      "“no grouping variable requested”\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A psych: 9 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>vars</th><th scope=col>n</th><th scope=col>mean</th><th scope=col>sd</th><th scope=col>median</th><th scope=col>trimmed</th><th scope=col>mad</th><th scope=col>min</th><th scope=col>max</th><th scope=col>range</th><th scope=col>skew</th><th scope=col>kurtosis</th><th scope=col>se</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>Sex*</th><td>1</td><td>4177</td><td>2.0529088</td><td>0.82224042</td><td>2.0000</td><td>2.0661083</td><td>1.4826000</td><td>1.0000</td><td> 3.0000</td><td> 2.0000</td><td>-0.09808466</td><td>-1.51472196</td><td>0.012722328</td></tr>\n",
       "\t<tr><th scope=row>Length</th><td>2</td><td>4177</td><td>0.5239921</td><td>0.12009291</td><td>0.5450</td><td>0.5324783</td><td>0.1186080</td><td>0.0750</td><td> 0.8150</td><td> 0.7400</td><td>-0.63941377</td><td> 0.06164107</td><td>0.001858169</td></tr>\n",
       "\t<tr><th scope=row>Diameter</th><td>3</td><td>4177</td><td>0.4078813</td><td>0.09923987</td><td>0.4250</td><td>0.4146994</td><td>0.0963690</td><td>0.0550</td><td> 0.6500</td><td> 0.5950</td><td>-0.60876067</td><td>-0.04827109</td><td>0.001535515</td></tr>\n",
       "\t<tr><th scope=row>Height</th><td>4</td><td>4177</td><td>0.1395164</td><td>0.04182706</td><td>0.1400</td><td>0.1402498</td><td>0.0370650</td><td>0.0000</td><td> 1.1300</td><td> 1.1300</td><td> 3.12657056</td><td>75.89530908</td><td>0.000647180</td></tr>\n",
       "\t<tr><th scope=row>Whole.weight</th><td>5</td><td>4177</td><td>0.8287422</td><td>0.49038902</td><td>0.7995</td><td>0.7995646</td><td>0.5285469</td><td>0.0020</td><td> 2.8255</td><td> 2.8235</td><td> 0.53057728</td><td>-0.02647558</td><td>0.007587671</td></tr>\n",
       "\t<tr><th scope=row>Shucked.weight</th><td>6</td><td>4177</td><td>0.3593675</td><td>0.22196295</td><td>0.3360</td><td>0.3439231</td><td>0.2349921</td><td>0.0010</td><td> 1.4880</td><td> 1.4870</td><td> 0.71858153</td><td> 0.59125529</td><td>0.003434379</td></tr>\n",
       "\t<tr><th scope=row>Viscera.weight</th><td>7</td><td>4177</td><td>0.1805936</td><td>0.10961425</td><td>0.1710</td><td>0.1733193</td><td>0.1178667</td><td>0.0005</td><td> 0.7600</td><td> 0.7595</td><td> 0.59142714</td><td> 0.08099937</td><td>0.001696035</td></tr>\n",
       "\t<tr><th scope=row>Shell.weight</th><td>8</td><td>4177</td><td>0.2388309</td><td>0.13920267</td><td>0.2340</td><td>0.2305173</td><td>0.1475187</td><td>0.0015</td><td> 1.0050</td><td> 1.0035</td><td> 0.62048093</td><td> 0.52816358</td><td>0.002153849</td></tr>\n",
       "\t<tr><th scope=row>Rings</th><td>9</td><td>4177</td><td>9.9336845</td><td>3.22416903</td><td>9.0000</td><td>9.6410410</td><td>2.9652000</td><td>1.0000</td><td>29.0000</td><td>28.0000</td><td> 1.11330186</td><td> 2.32391229</td><td>0.049886791</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A psych: 9 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & vars & n & mean & sd & median & trimmed & mad & min & max & range & skew & kurtosis & se\\\\\n",
       "  & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\tSex* & 1 & 4177 & 2.0529088 & 0.82224042 & 2.0000 & 2.0661083 & 1.4826000 & 1.0000 &  3.0000 &  2.0000 & -0.09808466 & -1.51472196 & 0.012722328\\\\\n",
       "\tLength & 2 & 4177 & 0.5239921 & 0.12009291 & 0.5450 & 0.5324783 & 0.1186080 & 0.0750 &  0.8150 &  0.7400 & -0.63941377 &  0.06164107 & 0.001858169\\\\\n",
       "\tDiameter & 3 & 4177 & 0.4078813 & 0.09923987 & 0.4250 & 0.4146994 & 0.0963690 & 0.0550 &  0.6500 &  0.5950 & -0.60876067 & -0.04827109 & 0.001535515\\\\\n",
       "\tHeight & 4 & 4177 & 0.1395164 & 0.04182706 & 0.1400 & 0.1402498 & 0.0370650 & 0.0000 &  1.1300 &  1.1300 &  3.12657056 & 75.89530908 & 0.000647180\\\\\n",
       "\tWhole.weight & 5 & 4177 & 0.8287422 & 0.49038902 & 0.7995 & 0.7995646 & 0.5285469 & 0.0020 &  2.8255 &  2.8235 &  0.53057728 & -0.02647558 & 0.007587671\\\\\n",
       "\tShucked.weight & 6 & 4177 & 0.3593675 & 0.22196295 & 0.3360 & 0.3439231 & 0.2349921 & 0.0010 &  1.4880 &  1.4870 &  0.71858153 &  0.59125529 & 0.003434379\\\\\n",
       "\tViscera.weight & 7 & 4177 & 0.1805936 & 0.10961425 & 0.1710 & 0.1733193 & 0.1178667 & 0.0005 &  0.7600 &  0.7595 &  0.59142714 &  0.08099937 & 0.001696035\\\\\n",
       "\tShell.weight & 8 & 4177 & 0.2388309 & 0.13920267 & 0.2340 & 0.2305173 & 0.1475187 & 0.0015 &  1.0050 &  1.0035 &  0.62048093 &  0.52816358 & 0.002153849\\\\\n",
       "\tRings & 9 & 4177 & 9.9336845 & 3.22416903 & 9.0000 & 9.6410410 & 2.9652000 & 1.0000 & 29.0000 & 28.0000 &  1.11330186 &  2.32391229 & 0.049886791\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A psych: 9 × 13\n",
       "\n",
       "| <!--/--> | vars &lt;int&gt; | n &lt;dbl&gt; | mean &lt;dbl&gt; | sd &lt;dbl&gt; | median &lt;dbl&gt; | trimmed &lt;dbl&gt; | mad &lt;dbl&gt; | min &lt;dbl&gt; | max &lt;dbl&gt; | range &lt;dbl&gt; | skew &lt;dbl&gt; | kurtosis &lt;dbl&gt; | se &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| Sex* | 1 | 4177 | 2.0529088 | 0.82224042 | 2.0000 | 2.0661083 | 1.4826000 | 1.0000 |  3.0000 |  2.0000 | -0.09808466 | -1.51472196 | 0.012722328 |\n",
       "| Length | 2 | 4177 | 0.5239921 | 0.12009291 | 0.5450 | 0.5324783 | 0.1186080 | 0.0750 |  0.8150 |  0.7400 | -0.63941377 |  0.06164107 | 0.001858169 |\n",
       "| Diameter | 3 | 4177 | 0.4078813 | 0.09923987 | 0.4250 | 0.4146994 | 0.0963690 | 0.0550 |  0.6500 |  0.5950 | -0.60876067 | -0.04827109 | 0.001535515 |\n",
       "| Height | 4 | 4177 | 0.1395164 | 0.04182706 | 0.1400 | 0.1402498 | 0.0370650 | 0.0000 |  1.1300 |  1.1300 |  3.12657056 | 75.89530908 | 0.000647180 |\n",
       "| Whole.weight | 5 | 4177 | 0.8287422 | 0.49038902 | 0.7995 | 0.7995646 | 0.5285469 | 0.0020 |  2.8255 |  2.8235 |  0.53057728 | -0.02647558 | 0.007587671 |\n",
       "| Shucked.weight | 6 | 4177 | 0.3593675 | 0.22196295 | 0.3360 | 0.3439231 | 0.2349921 | 0.0010 |  1.4880 |  1.4870 |  0.71858153 |  0.59125529 | 0.003434379 |\n",
       "| Viscera.weight | 7 | 4177 | 0.1805936 | 0.10961425 | 0.1710 | 0.1733193 | 0.1178667 | 0.0005 |  0.7600 |  0.7595 |  0.59142714 |  0.08099937 | 0.001696035 |\n",
       "| Shell.weight | 8 | 4177 | 0.2388309 | 0.13920267 | 0.2340 | 0.2305173 | 0.1475187 | 0.0015 |  1.0050 |  1.0035 |  0.62048093 |  0.52816358 | 0.002153849 |\n",
       "| Rings | 9 | 4177 | 9.9336845 | 3.22416903 | 9.0000 | 9.6410410 | 2.9652000 | 1.0000 | 29.0000 | 28.0000 |  1.11330186 |  2.32391229 | 0.049886791 |\n",
       "\n"
      ],
      "text/plain": [
       "               vars n    mean      sd         median trimmed   mad       min   \n",
       "Sex*           1    4177 2.0529088 0.82224042 2.0000 2.0661083 1.4826000 1.0000\n",
       "Length         2    4177 0.5239921 0.12009291 0.5450 0.5324783 0.1186080 0.0750\n",
       "Diameter       3    4177 0.4078813 0.09923987 0.4250 0.4146994 0.0963690 0.0550\n",
       "Height         4    4177 0.1395164 0.04182706 0.1400 0.1402498 0.0370650 0.0000\n",
       "Whole.weight   5    4177 0.8287422 0.49038902 0.7995 0.7995646 0.5285469 0.0020\n",
       "Shucked.weight 6    4177 0.3593675 0.22196295 0.3360 0.3439231 0.2349921 0.0010\n",
       "Viscera.weight 7    4177 0.1805936 0.10961425 0.1710 0.1733193 0.1178667 0.0005\n",
       "Shell.weight   8    4177 0.2388309 0.13920267 0.2340 0.2305173 0.1475187 0.0015\n",
       "Rings          9    4177 9.9336845 3.22416903 9.0000 9.6410410 2.9652000 1.0000\n",
       "               max     range   skew        kurtosis    se         \n",
       "Sex*            3.0000  2.0000 -0.09808466 -1.51472196 0.012722328\n",
       "Length          0.8150  0.7400 -0.63941377  0.06164107 0.001858169\n",
       "Diameter        0.6500  0.5950 -0.60876067 -0.04827109 0.001535515\n",
       "Height          1.1300  1.1300  3.12657056 75.89530908 0.000647180\n",
       "Whole.weight    2.8255  2.8235  0.53057728 -0.02647558 0.007587671\n",
       "Shucked.weight  1.4880  1.4870  0.71858153  0.59125529 0.003434379\n",
       "Viscera.weight  0.7600  0.7595  0.59142714  0.08099937 0.001696035\n",
       "Shell.weight    1.0050  1.0035  0.62048093  0.52816358 0.002153849\n",
       "Rings          29.0000 28.0000  1.11330186  2.32391229 0.049886791"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(psych)\n",
    "describeBy(abaloneAGE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "d72cb812",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:40:59.313271Z",
     "iopub.status.busy": "2022-12-05T23:40:59.311894Z",
     "iopub.status.idle": "2022-12-05T23:40:59.630429Z",
     "shell.execute_reply": "2022-12-05T23:40:59.628740Z"
    },
    "papermill": {
     "duration": 0.327167,
     "end_time": "2022-12-05T23:40:59.633434",
     "exception": false,
     "start_time": "2022-12-05T23:40:59.306267",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nHGtlG7vHF0aJHSrlq9QaO02jZiVx3WH29eT0q4eWcRznFfDqyZtPHl6JDpCJI/5+pGOAfOhp\nm4Bv7Lo0eHXnifPJuYUmvb9gFDR2LwpVwbN169Y9Kyj6UrmxtlfYuqtpCW8R0a9Pi7Im8egY\nsdQnW6nSOHFJAj46N1zq3DC9sOjZix83cw2YzoqTYtI/j/nHLyxq6lN/F2Ms5fJkB9dmJV9n\nk08PkbmF8bdH+Tu3XBHHGHtweJBY6puYr2SMPb7QX+JYs6TygqzHD4o9TM7mH5xd1bXUb88S\neQ3GGGPKuR0D5D6NXqnpNnTdb0nZRV/ENTZ2GgvTNorH/4yWubctXiVstL+zxsbuf+eLZvxn\n/kt+L0WV6z0CgHIxY6wxxjQmmy3HWtnGLufxViK6kKUoaew0jpoV59Xqh0U9ZSNnh16Hi344\nXBrs0e7b6zoGyIeetgn4xu7NM//9VAlWJjHXLl2wcZzEc8ywLr9888XFK9euXTkffSP1ZSIi\nkjjW7O/tyE/j22yysuCbUxmKLh6aJ+YlH4p3rjTWrfjojWqDW+Us+oVoJX+3fw03/obUTcrf\neHb+UkHOlQA/X/4uU+UqsgqJKOfxli2Pc3e/5p+enu4Y+r6jauf0vx7u6FJV8SxHJPEsWdzN\nH16tN/EUf9ur9jcp197gb4fO2Ld3RoP/BsjxixMt+TOh2/aNX7077+CHI6pOc5y25uCKsY00\nrhNthWkcxcPf45z9J0mKD1kZXNv9hKbXfK14RokrPlwAlmXGWCOtyTaX7CnWuKL/9K0iXhOX\nouG4irk61V1KbusYYAndE/QPcddUHlgDTp54URRkX2wZ2GDJnjjfOi0nvbf22zpexc+ohQAn\nISKZiNM+MRERMeJKzaV2WLFLmcN1pe5S1ypTnxR7mpKlUuYRUdySZYyp+lbz8/Dw8PZvmKVU\nHX1rJxG51mxekBV7NacoI+q+eZL/FnJldWv1l3XwqFJNTVBQleJ6HMIHT57Rwm/u2QfHNkR8\n8Wbb23maj3rWVpjGUagUKvV1xWk5Ktldgs8UgJWYM9ZIV7LZS6xlJx8SO/jXc5IasIpK454f\noo54NGQCPwckYYXBqn9RJB9/55qkd+zeTW9PGv1Ku6YZyqKTlQpzb+59VvRpTLmwRiKv0drV\nQdvEPP9OIdmPNmcVn+31YFeMo09/HYv2atI1+/HWR8Un3j/4Y2r3QZuJlLM332j9xeWSX48f\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(ggplot2)\n",
    "par(mfrow = c(4,2))\n",
    "\n",
    "H2 <- hist(abaloneAGE$Length)\n",
    "\n",
    "H3 <- hist(abaloneAGE$Diameter)\n",
    "\n",
    "H4 <- hist(abaloneAGE$Height)\n",
    "\n",
    "H5 <- hist(abaloneAGE$Whole.weight)\n",
    "\n",
    "H6 <- hist(abaloneAGE$Shucked.weight)\n",
    "\n",
    "H7 <- hist(abaloneAGE$Viscera.weight)\n",
    "\n",
    "H8 <- hist(abaloneAGE$Shell.weight)\n",
    "\n",
    "H9 <- hist(abaloneAGE$Rings)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "669a7d71",
   "metadata": {
    "papermill": {
     "duration": 0.005286,
     "end_time": "2022-12-05T23:40:59.644229",
     "exception": false,
     "start_time": "2022-12-05T23:40:59.638943",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 8.031651,
   "end_time": "2022-12-05T23:40:59.768710",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-05T23:40:51.737059",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
