{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "9c2f8a0e",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-12-05T23:31:05.162392Z",
     "iopub.status.busy": "2022-12-05T23:31:05.159738Z",
     "iopub.status.idle": "2022-12-05T23:31:08.602173Z",
     "shell.execute_reply": "2022-12-05T23:31:08.600452Z"
    },
    "papermill": {
     "duration": 3.450808,
     "end_time": "2022-12-05T23:31:08.604597",
     "exception": false,
     "start_time": "2022-12-05T23:31:05.153789",
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
   "id": "9003b863",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:31:08.642110Z",
     "iopub.status.busy": "2022-12-05T23:31:08.612414Z",
     "iopub.status.idle": "2022-12-05T23:31:08.685700Z",
     "shell.execute_reply": "2022-12-05T23:31:08.683925Z"
    },
    "papermill": {
     "duration": 0.080315,
     "end_time": "2022-12-05T23:31:08.688127",
     "exception": false,
     "start_time": "2022-12-05T23:31:08.607812",
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
   "id": "4d46e682",
   "metadata": {
    "papermill": {
     "duration": 0.003035,
     "end_time": "2022-12-05T23:31:08.694111",
     "exception": false,
     "start_time": "2022-12-05T23:31:08.691076",
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
   "id": "31949a0c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:31:08.703056Z",
     "iopub.status.busy": "2022-12-05T23:31:08.701534Z",
     "iopub.status.idle": "2022-12-05T23:31:08.746005Z",
     "shell.execute_reply": "2022-12-05T23:31:08.744341Z"
    },
    "papermill": {
     "duration": 0.051372,
     "end_time": "2022-12-05T23:31:08.748271",
     "exception": false,
     "start_time": "2022-12-05T23:31:08.696899",
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
   "id": "f7ceaa8f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:31:08.757843Z",
     "iopub.status.busy": "2022-12-05T23:31:08.756428Z",
     "iopub.status.idle": "2022-12-05T23:31:08.773221Z",
     "shell.execute_reply": "2022-12-05T23:31:08.771631Z"
    },
    "papermill": {
     "duration": 0.024057,
     "end_time": "2022-12-05T23:31:08.775574",
     "exception": false,
     "start_time": "2022-12-05T23:31:08.751517",
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
   "id": "9e81098f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:31:08.785784Z",
     "iopub.status.busy": "2022-12-05T23:31:08.784335Z",
     "iopub.status.idle": "2022-12-05T23:31:08.801141Z",
     "shell.execute_reply": "2022-12-05T23:31:08.799512Z"
    },
    "papermill": {
     "duration": 0.024306,
     "end_time": "2022-12-05T23:31:08.803478",
     "exception": false,
     "start_time": "2022-12-05T23:31:08.779172",
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
   "id": "54bcd6a9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T23:31:08.813796Z",
     "iopub.status.busy": "2022-12-05T23:31:08.812330Z",
     "iopub.status.idle": "2022-12-05T23:31:09.020671Z",
     "shell.execute_reply": "2022-12-05T23:31:09.018928Z"
    },
    "papermill": {
     "duration": 0.215932,
     "end_time": "2022-12-05T23:31:09.022968",
     "exception": false,
     "start_time": "2022-12-05T23:31:08.807036",
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
   "execution_count": null,
   "id": "914015f2",
   "metadata": {
    "papermill": {
     "duration": 0.004027,
     "end_time": "2022-12-05T23:31:09.031028",
     "exception": false,
     "start_time": "2022-12-05T23:31:09.027001",
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
   "duration": 7.79372,
   "end_time": "2022-12-05T23:31:09.155983",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-05T23:31:01.362263",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
