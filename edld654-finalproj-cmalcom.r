{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "1ba0fa8c",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:33.541499Z",
     "iopub.status.busy": "2022-12-07T02:32:33.539654Z",
     "iopub.status.idle": "2022-12-07T02:32:37.422174Z",
     "shell.execute_reply": "2022-12-07T02:32:37.420304Z"
    },
    "papermill": {
     "duration": 3.893129,
     "end_time": "2022-12-07T02:32:37.424499",
     "exception": false,
     "start_time": "2022-12-07T02:32:33.531370",
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
      "\n",
      "\n",
      "Attaching package: ‘psych’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:ggplot2’:\n",
      "\n",
      "    %+%, alpha\n",
      "\n",
      "\n",
      "corrplot 0.92 loaded\n",
      "\n",
      "Loading required package: lattice\n",
      "\n",
      "Loading required package: survival\n",
      "\n",
      "Loading required package: Formula\n",
      "\n",
      "\n",
      "Attaching package: ‘Hmisc’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:psych’:\n",
      "\n",
      "    describe\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:dplyr’:\n",
      "\n",
      "    src, summarize\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    format.pval, units\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "library(recipes)\n",
    "library(lubridate)\n",
    "library(ggplot2)\n",
    "library(psych)\n",
    "library(corrplot)\n",
    "library(Hmisc)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "6bdb7d7b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:37.466569Z",
     "iopub.status.busy": "2022-12-07T02:32:37.437733Z",
     "iopub.status.idle": "2022-12-07T02:32:37.502815Z",
     "shell.execute_reply": "2022-12-07T02:32:37.501043Z"
    },
    "papermill": {
     "duration": 0.074761,
     "end_time": "2022-12-07T02:32:37.505332",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.430571",
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
   "cell_type": "code",
   "execution_count": 3,
   "id": "54924a52",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:37.521076Z",
     "iopub.status.busy": "2022-12-07T02:32:37.519333Z",
     "iopub.status.idle": "2022-12-07T02:32:37.555114Z",
     "shell.execute_reply": "2022-12-07T02:32:37.553463Z"
    },
    "papermill": {
     "duration": 0.045682,
     "end_time": "2022-12-07T02:32:37.557475",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.511793",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ID</th><th scope=col>Sex</th><th scope=col>Length</th><th scope=col>Diameter</th><th scope=col>Height</th><th scope=col>Whole.weight</th><th scope=col>Shucked.weight</th><th scope=col>Viscera.weight</th><th scope=col>Shell.weight</th><th scope=col>Rings</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>M</td><td>0.455</td><td>0.365</td><td>0.095</td><td>0.5140</td><td>0.2245</td><td>0.1010</td><td>0.150</td><td>15</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2</td><td>M</td><td>0.350</td><td>0.265</td><td>0.090</td><td>0.2255</td><td>0.0995</td><td>0.0485</td><td>0.070</td><td> 7</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>3</td><td>F</td><td>0.530</td><td>0.420</td><td>0.135</td><td>0.6770</td><td>0.2565</td><td>0.1415</td><td>0.210</td><td> 9</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4</td><td>M</td><td>0.440</td><td>0.365</td><td>0.125</td><td>0.5160</td><td>0.2155</td><td>0.1140</td><td>0.155</td><td>10</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5</td><td>I</td><td>0.330</td><td>0.255</td><td>0.080</td><td>0.2050</td><td>0.0895</td><td>0.0395</td><td>0.055</td><td> 7</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>6</td><td>I</td><td>0.425</td><td>0.300</td><td>0.095</td><td>0.3515</td><td>0.1410</td><td>0.0775</td><td>0.120</td><td> 8</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & ID & Sex & Length & Diameter & Height & Whole.weight & Shucked.weight & Viscera.weight & Shell.weight & Rings\\\\\n",
       "  & <int> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & M & 0.455 & 0.365 & 0.095 & 0.5140 & 0.2245 & 0.1010 & 0.150 & 15\\\\\n",
       "\t2 & 2 & M & 0.350 & 0.265 & 0.090 & 0.2255 & 0.0995 & 0.0485 & 0.070 &  7\\\\\n",
       "\t3 & 3 & F & 0.530 & 0.420 & 0.135 & 0.6770 & 0.2565 & 0.1415 & 0.210 &  9\\\\\n",
       "\t4 & 4 & M & 0.440 & 0.365 & 0.125 & 0.5160 & 0.2155 & 0.1140 & 0.155 & 10\\\\\n",
       "\t5 & 5 & I & 0.330 & 0.255 & 0.080 & 0.2050 & 0.0895 & 0.0395 & 0.055 &  7\\\\\n",
       "\t6 & 6 & I & 0.425 & 0.300 & 0.095 & 0.3515 & 0.1410 & 0.0775 & 0.120 &  8\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | ID &lt;int&gt; | Sex &lt;chr&gt; | Length &lt;dbl&gt; | Diameter &lt;dbl&gt; | Height &lt;dbl&gt; | Whole.weight &lt;dbl&gt; | Shucked.weight &lt;dbl&gt; | Viscera.weight &lt;dbl&gt; | Shell.weight &lt;dbl&gt; | Rings &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | M | 0.455 | 0.365 | 0.095 | 0.5140 | 0.2245 | 0.1010 | 0.150 | 15 |\n",
       "| 2 | 2 | M | 0.350 | 0.265 | 0.090 | 0.2255 | 0.0995 | 0.0485 | 0.070 |  7 |\n",
       "| 3 | 3 | F | 0.530 | 0.420 | 0.135 | 0.6770 | 0.2565 | 0.1415 | 0.210 |  9 |\n",
       "| 4 | 4 | M | 0.440 | 0.365 | 0.125 | 0.5160 | 0.2155 | 0.1140 | 0.155 | 10 |\n",
       "| 5 | 5 | I | 0.330 | 0.255 | 0.080 | 0.2050 | 0.0895 | 0.0395 | 0.055 |  7 |\n",
       "| 6 | 6 | I | 0.425 | 0.300 | 0.095 | 0.3515 | 0.1410 | 0.0775 | 0.120 |  8 |\n",
       "\n"
      ],
      "text/plain": [
       "  ID Sex Length Diameter Height Whole.weight Shucked.weight Viscera.weight\n",
       "1 1  M   0.455  0.365    0.095  0.5140       0.2245         0.1010        \n",
       "2 2  M   0.350  0.265    0.090  0.2255       0.0995         0.0485        \n",
       "3 3  F   0.530  0.420    0.135  0.6770       0.2565         0.1415        \n",
       "4 4  M   0.440  0.365    0.125  0.5160       0.2155         0.1140        \n",
       "5 5  I   0.330  0.255    0.080  0.2050       0.0895         0.0395        \n",
       "6 6  I   0.425  0.300    0.095  0.3515       0.1410         0.0775        \n",
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
    "#add an ID variable\n",
    "abaloneAGE1 <- cbind(ID = 1:nrow(abaloneAGE), abaloneAGE)    # Applying cbind function\n",
    "\n",
    "head(abaloneAGE1)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9b78d601",
   "metadata": {
    "papermill": {
     "duration": 0.006285,
     "end_time": "2022-12-07T02:32:37.569966",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.563681",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Information on the Variables\n",
    "\n",
    "Abalone is a marine snail and is an edible shellfish. Since abalones have been overfished in the past and are a vital part of the ecosystem the abalone fishery has regulations in place. Scientists want to determine if machine learning can be used to predict the age of an abalone to help guide these regulations.\n",
    "\n",
    "Typically the age of an abalone is found by cutting through the cone of the shell, which is then stained. Next the number of rings in the shell are counted through a microscope. This can be a lengthy process. Scientists hope measurements that are easier to obtain, such as abalone height, can be used to predict abalone age.\n",
    "\n",
    "The number of rings (an indicator of age) should be predicted as a continuous value [outcome variable]. There are 8 predictor variables, which are listed below.\n",
    "\n",
    "Name / Type of Data / Unit of Measurement / Description\n",
    "* Sex / nominal / -- / Male (M), Female (F), and Infant (I) [assume sex is not determinable in infants]\n",
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
   "execution_count": 4,
   "id": "fea21f03",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:37.601588Z",
     "iopub.status.busy": "2022-12-07T02:32:37.584201Z",
     "iopub.status.idle": "2022-12-07T02:32:37.629042Z",
     "shell.execute_reply": "2022-12-07T02:32:37.626358Z"
    },
    "papermill": {
     "duration": 0.055488,
     "end_time": "2022-12-07T02:32:37.631731",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.576243",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t4177 obs. of  10 variables:\n",
      " $ ID            : int  1 2 3 4 5 6 7 8 9 10 ...\n",
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
    }
   ],
   "source": [
    "str(abaloneAGE1)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4709d196",
   "metadata": {
    "papermill": {
     "duration": 0.00632,
     "end_time": "2022-12-07T02:32:37.644842",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.638522",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "There appears to be no missing data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "3c401614",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:37.660055Z",
     "iopub.status.busy": "2022-12-07T02:32:37.658690Z",
     "iopub.status.idle": "2022-12-07T02:32:37.677888Z",
     "shell.execute_reply": "2022-12-07T02:32:37.675934Z"
    },
    "papermill": {
     "duration": 0.029727,
     "end_time": "2022-12-07T02:32:37.680564",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.650837",
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
    "#missing data\n",
    "sum(is.na(abaloneAGE1))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "11a52faf",
   "metadata": {
    "papermill": {
     "duration": 0.006433,
     "end_time": "2022-12-07T02:32:37.693411",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.686978",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The two abalones with a height of 0 are infants and size may have been negligible or impossible to determine. These seem to be valid height measurements so will not remove them as outliers or replace them with the mean."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "b71ec3f5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:37.708928Z",
     "iopub.status.busy": "2022-12-07T02:32:37.707493Z",
     "iopub.status.idle": "2022-12-07T02:32:37.726752Z",
     "shell.execute_reply": "2022-12-07T02:32:37.724701Z"
    },
    "papermill": {
     "duration": 0.030076,
     "end_time": "2022-12-07T02:32:37.729545",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.699469",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>ID</dt><dd>0</dd><dt>Sex</dt><dd>0</dd><dt>Length</dt><dd>0</dd><dt>Diameter</dt><dd>0</dd><dt>Height</dt><dd>2</dd><dt>Whole.weight</dt><dd>0</dd><dt>Shucked.weight</dt><dd>0</dd><dt>Viscera.weight</dt><dd>0</dd><dt>Shell.weight</dt><dd>0</dd><dt>Rings</dt><dd>0</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[ID] 0\n",
       "\\item[Sex] 0\n",
       "\\item[Length] 0\n",
       "\\item[Diameter] 0\n",
       "\\item[Height] 2\n",
       "\\item[Whole.weight] 0\n",
       "\\item[Shucked.weight] 0\n",
       "\\item[Viscera.weight] 0\n",
       "\\item[Shell.weight] 0\n",
       "\\item[Rings] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "ID\n",
       ":   0Sex\n",
       ":   0Length\n",
       ":   0Diameter\n",
       ":   0Height\n",
       ":   2Whole.weight\n",
       ":   0Shucked.weight\n",
       ":   0Viscera.weight\n",
       ":   0Shell.weight\n",
       ":   0Rings\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "            ID            Sex         Length       Diameter         Height \n",
       "             0              0              0              0              2 \n",
       "  Whole.weight Shucked.weight Viscera.weight   Shell.weight          Rings \n",
       "             0              0              0              0              0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colSums(abaloneAGE1==0)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "6ab3b8eb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:37.745649Z",
     "iopub.status.busy": "2022-12-07T02:32:37.744289Z",
     "iopub.status.idle": "2022-12-07T02:32:37.762031Z",
     "shell.execute_reply": "2022-12-07T02:32:37.760181Z"
    },
    "papermill": {
     "duration": 0.028655,
     "end_time": "2022-12-07T02:32:37.764686",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.736031",
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
    "range(abaloneAGE1$Rings)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a296ac22",
   "metadata": {
    "papermill": {
     "duration": 0.012004,
     "end_time": "2022-12-07T02:32:37.783406",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.771402",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Descriptive Statistics, Histograms, and Correlations"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "0e8d9412",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:37.799808Z",
     "iopub.status.busy": "2022-12-07T02:32:37.798405Z",
     "iopub.status.idle": "2022-12-07T02:32:37.898958Z",
     "shell.execute_reply": "2022-12-07T02:32:37.897323Z"
    },
    "papermill": {
     "duration": 0.111067,
     "end_time": "2022-12-07T02:32:37.901114",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.790047",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A psych: 10 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>vars</th><th scope=col>n</th><th scope=col>mean</th><th scope=col>sd</th><th scope=col>median</th><th scope=col>trimmed</th><th scope=col>mad</th><th scope=col>min</th><th scope=col>max</th><th scope=col>range</th><th scope=col>skew</th><th scope=col>kurtosis</th><th scope=col>se</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>ID</th><td> 1</td><td>4177</td><td>2089.0000000</td><td>1.205940e+03</td><td>2089.0000</td><td>2089.0000000</td><td>1547.8344000</td><td>1.0000</td><td>4177.0000</td><td>4176.0000</td><td> 0.00000000</td><td>-1.20086190</td><td>18.659224707</td></tr>\n",
       "\t<tr><th scope=row>Sex*</th><td> 2</td><td>4177</td><td>   2.0529088</td><td>8.222404e-01</td><td>   2.0000</td><td>   2.0661083</td><td>   1.4826000</td><td>1.0000</td><td>   3.0000</td><td>   2.0000</td><td>-0.09808466</td><td>-1.51472196</td><td> 0.012722328</td></tr>\n",
       "\t<tr><th scope=row>Length</th><td> 3</td><td>4177</td><td>   0.5239921</td><td>1.200929e-01</td><td>   0.5450</td><td>   0.5324783</td><td>   0.1186080</td><td>0.0750</td><td>   0.8150</td><td>   0.7400</td><td>-0.63941377</td><td> 0.06164107</td><td> 0.001858169</td></tr>\n",
       "\t<tr><th scope=row>Diameter</th><td> 4</td><td>4177</td><td>   0.4078813</td><td>9.923987e-02</td><td>   0.4250</td><td>   0.4146994</td><td>   0.0963690</td><td>0.0550</td><td>   0.6500</td><td>   0.5950</td><td>-0.60876067</td><td>-0.04827109</td><td> 0.001535515</td></tr>\n",
       "\t<tr><th scope=row>Height</th><td> 5</td><td>4177</td><td>   0.1395164</td><td>4.182706e-02</td><td>   0.1400</td><td>   0.1402498</td><td>   0.0370650</td><td>0.0000</td><td>   1.1300</td><td>   1.1300</td><td> 3.12657056</td><td>75.89530908</td><td> 0.000647180</td></tr>\n",
       "\t<tr><th scope=row>Whole.weight</th><td> 6</td><td>4177</td><td>   0.8287422</td><td>4.903890e-01</td><td>   0.7995</td><td>   0.7995646</td><td>   0.5285469</td><td>0.0020</td><td>   2.8255</td><td>   2.8235</td><td> 0.53057728</td><td>-0.02647558</td><td> 0.007587671</td></tr>\n",
       "\t<tr><th scope=row>Shucked.weight</th><td> 7</td><td>4177</td><td>   0.3593675</td><td>2.219629e-01</td><td>   0.3360</td><td>   0.3439231</td><td>   0.2349921</td><td>0.0010</td><td>   1.4880</td><td>   1.4870</td><td> 0.71858153</td><td> 0.59125529</td><td> 0.003434379</td></tr>\n",
       "\t<tr><th scope=row>Viscera.weight</th><td> 8</td><td>4177</td><td>   0.1805936</td><td>1.096143e-01</td><td>   0.1710</td><td>   0.1733193</td><td>   0.1178667</td><td>0.0005</td><td>   0.7600</td><td>   0.7595</td><td> 0.59142714</td><td> 0.08099937</td><td> 0.001696035</td></tr>\n",
       "\t<tr><th scope=row>Shell.weight</th><td> 9</td><td>4177</td><td>   0.2388309</td><td>1.392027e-01</td><td>   0.2340</td><td>   0.2305173</td><td>   0.1475187</td><td>0.0015</td><td>   1.0050</td><td>   1.0035</td><td> 0.62048093</td><td> 0.52816358</td><td> 0.002153849</td></tr>\n",
       "\t<tr><th scope=row>Rings</th><td>10</td><td>4177</td><td>   9.9336845</td><td>3.224169e+00</td><td>   9.0000</td><td>   9.6410410</td><td>   2.9652000</td><td>1.0000</td><td>  29.0000</td><td>  28.0000</td><td> 1.11330186</td><td> 2.32391229</td><td> 0.049886791</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A psych: 10 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & vars & n & mean & sd & median & trimmed & mad & min & max & range & skew & kurtosis & se\\\\\n",
       "  & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\tID &  1 & 4177 & 2089.0000000 & 1.205940e+03 & 2089.0000 & 2089.0000000 & 1547.8344000 & 1.0000 & 4177.0000 & 4176.0000 &  0.00000000 & -1.20086190 & 18.659224707\\\\\n",
       "\tSex* &  2 & 4177 &    2.0529088 & 8.222404e-01 &    2.0000 &    2.0661083 &    1.4826000 & 1.0000 &    3.0000 &    2.0000 & -0.09808466 & -1.51472196 &  0.012722328\\\\\n",
       "\tLength &  3 & 4177 &    0.5239921 & 1.200929e-01 &    0.5450 &    0.5324783 &    0.1186080 & 0.0750 &    0.8150 &    0.7400 & -0.63941377 &  0.06164107 &  0.001858169\\\\\n",
       "\tDiameter &  4 & 4177 &    0.4078813 & 9.923987e-02 &    0.4250 &    0.4146994 &    0.0963690 & 0.0550 &    0.6500 &    0.5950 & -0.60876067 & -0.04827109 &  0.001535515\\\\\n",
       "\tHeight &  5 & 4177 &    0.1395164 & 4.182706e-02 &    0.1400 &    0.1402498 &    0.0370650 & 0.0000 &    1.1300 &    1.1300 &  3.12657056 & 75.89530908 &  0.000647180\\\\\n",
       "\tWhole.weight &  6 & 4177 &    0.8287422 & 4.903890e-01 &    0.7995 &    0.7995646 &    0.5285469 & 0.0020 &    2.8255 &    2.8235 &  0.53057728 & -0.02647558 &  0.007587671\\\\\n",
       "\tShucked.weight &  7 & 4177 &    0.3593675 & 2.219629e-01 &    0.3360 &    0.3439231 &    0.2349921 & 0.0010 &    1.4880 &    1.4870 &  0.71858153 &  0.59125529 &  0.003434379\\\\\n",
       "\tViscera.weight &  8 & 4177 &    0.1805936 & 1.096143e-01 &    0.1710 &    0.1733193 &    0.1178667 & 0.0005 &    0.7600 &    0.7595 &  0.59142714 &  0.08099937 &  0.001696035\\\\\n",
       "\tShell.weight &  9 & 4177 &    0.2388309 & 1.392027e-01 &    0.2340 &    0.2305173 &    0.1475187 & 0.0015 &    1.0050 &    1.0035 &  0.62048093 &  0.52816358 &  0.002153849\\\\\n",
       "\tRings & 10 & 4177 &    9.9336845 & 3.224169e+00 &    9.0000 &    9.6410410 &    2.9652000 & 1.0000 &   29.0000 &   28.0000 &  1.11330186 &  2.32391229 &  0.049886791\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A psych: 10 × 13\n",
       "\n",
       "| <!--/--> | vars &lt;int&gt; | n &lt;dbl&gt; | mean &lt;dbl&gt; | sd &lt;dbl&gt; | median &lt;dbl&gt; | trimmed &lt;dbl&gt; | mad &lt;dbl&gt; | min &lt;dbl&gt; | max &lt;dbl&gt; | range &lt;dbl&gt; | skew &lt;dbl&gt; | kurtosis &lt;dbl&gt; | se &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| ID |  1 | 4177 | 2089.0000000 | 1.205940e+03 | 2089.0000 | 2089.0000000 | 1547.8344000 | 1.0000 | 4177.0000 | 4176.0000 |  0.00000000 | -1.20086190 | 18.659224707 |\n",
       "| Sex* |  2 | 4177 |    2.0529088 | 8.222404e-01 |    2.0000 |    2.0661083 |    1.4826000 | 1.0000 |    3.0000 |    2.0000 | -0.09808466 | -1.51472196 |  0.012722328 |\n",
       "| Length |  3 | 4177 |    0.5239921 | 1.200929e-01 |    0.5450 |    0.5324783 |    0.1186080 | 0.0750 |    0.8150 |    0.7400 | -0.63941377 |  0.06164107 |  0.001858169 |\n",
       "| Diameter |  4 | 4177 |    0.4078813 | 9.923987e-02 |    0.4250 |    0.4146994 |    0.0963690 | 0.0550 |    0.6500 |    0.5950 | -0.60876067 | -0.04827109 |  0.001535515 |\n",
       "| Height |  5 | 4177 |    0.1395164 | 4.182706e-02 |    0.1400 |    0.1402498 |    0.0370650 | 0.0000 |    1.1300 |    1.1300 |  3.12657056 | 75.89530908 |  0.000647180 |\n",
       "| Whole.weight |  6 | 4177 |    0.8287422 | 4.903890e-01 |    0.7995 |    0.7995646 |    0.5285469 | 0.0020 |    2.8255 |    2.8235 |  0.53057728 | -0.02647558 |  0.007587671 |\n",
       "| Shucked.weight |  7 | 4177 |    0.3593675 | 2.219629e-01 |    0.3360 |    0.3439231 |    0.2349921 | 0.0010 |    1.4880 |    1.4870 |  0.71858153 |  0.59125529 |  0.003434379 |\n",
       "| Viscera.weight |  8 | 4177 |    0.1805936 | 1.096143e-01 |    0.1710 |    0.1733193 |    0.1178667 | 0.0005 |    0.7600 |    0.7595 |  0.59142714 |  0.08099937 |  0.001696035 |\n",
       "| Shell.weight |  9 | 4177 |    0.2388309 | 1.392027e-01 |    0.2340 |    0.2305173 |    0.1475187 | 0.0015 |    1.0050 |    1.0035 |  0.62048093 |  0.52816358 |  0.002153849 |\n",
       "| Rings | 10 | 4177 |    9.9336845 | 3.224169e+00 |    9.0000 |    9.6410410 |    2.9652000 | 1.0000 |   29.0000 |   28.0000 |  1.11330186 |  2.32391229 |  0.049886791 |\n",
       "\n"
      ],
      "text/plain": [
       "               vars n    mean         sd           median    trimmed     \n",
       "ID              1   4177 2089.0000000 1.205940e+03 2089.0000 2089.0000000\n",
       "Sex*            2   4177    2.0529088 8.222404e-01    2.0000    2.0661083\n",
       "Length          3   4177    0.5239921 1.200929e-01    0.5450    0.5324783\n",
       "Diameter        4   4177    0.4078813 9.923987e-02    0.4250    0.4146994\n",
       "Height          5   4177    0.1395164 4.182706e-02    0.1400    0.1402498\n",
       "Whole.weight    6   4177    0.8287422 4.903890e-01    0.7995    0.7995646\n",
       "Shucked.weight  7   4177    0.3593675 2.219629e-01    0.3360    0.3439231\n",
       "Viscera.weight  8   4177    0.1805936 1.096143e-01    0.1710    0.1733193\n",
       "Shell.weight    9   4177    0.2388309 1.392027e-01    0.2340    0.2305173\n",
       "Rings          10   4177    9.9336845 3.224169e+00    9.0000    9.6410410\n",
       "               mad          min    max       range     skew        kurtosis   \n",
       "ID             1547.8344000 1.0000 4177.0000 4176.0000  0.00000000 -1.20086190\n",
       "Sex*              1.4826000 1.0000    3.0000    2.0000 -0.09808466 -1.51472196\n",
       "Length            0.1186080 0.0750    0.8150    0.7400 -0.63941377  0.06164107\n",
       "Diameter          0.0963690 0.0550    0.6500    0.5950 -0.60876067 -0.04827109\n",
       "Height            0.0370650 0.0000    1.1300    1.1300  3.12657056 75.89530908\n",
       "Whole.weight      0.5285469 0.0020    2.8255    2.8235  0.53057728 -0.02647558\n",
       "Shucked.weight    0.2349921 0.0010    1.4880    1.4870  0.71858153  0.59125529\n",
       "Viscera.weight    0.1178667 0.0005    0.7600    0.7595  0.59142714  0.08099937\n",
       "Shell.weight      0.1475187 0.0015    1.0050    1.0035  0.62048093  0.52816358\n",
       "Rings             2.9652000 1.0000   29.0000   28.0000  1.11330186  2.32391229\n",
       "               se          \n",
       "ID             18.659224707\n",
       "Sex*            0.012722328\n",
       "Length          0.001858169\n",
       "Diameter        0.001535515\n",
       "Height          0.000647180\n",
       "Whole.weight    0.007587671\n",
       "Shucked.weight  0.003434379\n",
       "Viscera.weight  0.001696035\n",
       "Shell.weight    0.002153849\n",
       "Rings           0.049886791"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "psych::describe(abaloneAGE1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "6b2b4f08",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:37.918012Z",
     "iopub.status.busy": "2022-12-07T02:32:37.916565Z",
     "iopub.status.idle": "2022-12-07T02:32:38.221360Z",
     "shell.execute_reply": "2022-12-07T02:32:38.219669Z"
    },
    "papermill": {
     "duration": 0.316483,
     "end_time": "2022-12-07T02:32:38.224684",
     "exception": false,
     "start_time": "2022-12-07T02:32:37.908201",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nf7y8O1Uikdg7+F9LyWaMxZ8bS0QcJ85Svclu5XssT5Irk2L+5A+2V/C0x2k56U/PBdiLiajl\nL3fy7bv+CBlj56cEEZFbhS8LtlvyPZ3xqLObQ6n2p5+kKuXJq4ZWJSKJfZlncqWeBfO1dqHh\n8U3kVW9iVEKGUp60uHVpIpJ5tGeMJd6cTUQSWcXLydmMseSYbXybfPs4ld9KwvWp6oyTdPsT\n/u/P7yYzxhKjB/Mv9ydm8jNnJOzSPDHKdTzCT9fV0aTFz7c12yor+bh6W7mTVPIRNd4sO2ze\ninP3ktXz7/64s1ijD4rEsVRws44zl2x+npc1+SZyLT/gSnxaTvqzabVLEZFL2Y9ZYYVd9usz\nMhFHRIP+d4MxlvH8THmZhIg+PP1MfdRmRV3q6OdERC1m7eXXoKcxs1NO2os4Iury1YFMJYu7\n9EtpezFpK+xeP/ySiEQS99cK1bOzfYjISSoSiV1SFKqHB9oTkZPvsEIPnPrcKPTy0dNETHAd\nwoyD1KcrQmaN1KfZ1CU29THGZldwI6Imq24yxiK/bkhEPg3efH2obiU9Z6OeLKe/cfKdeHKV\nvmOdjyH5zcDkxlgh14h1k5swCzv56/P8/2SO/jX7jZr+w/a/HyS++Tyn2abPL/UnIpHY8Vl2\n7v/H6nPxh2dprx9/zf99Mu973T+7lKcC2a3pulua0Wa+fPDv4b0bV38zIMSXX5z/VMH/PSrm\nFT9bDUcpEYUdfMi/HOjjREQh66Py7bv+CJne7KYnHnV2C/09lp8tJ/0631t24t0kPQvma+1C\nw+ObqMeFeP7dhwfDiEjqWJMxdvajmkQk82g/L0+gTEJEjVZc52fe2a4sETl4dmaMMWVmVQcp\nEVXqd5gxlnJ/Dr+V5U9yU2HRZzfGFJmxC8d095KJ+bc4kf37H29Rv5tw6+R3X386uHfn2pVK\ni/KKPM9aw7M1/g9ovSP3tsiNlY0pr3TTX9g9O92DiMT2pTPyPlhH/7njl19++etGkvqola/q\nSkR2Lo3U9wj0NOaDffyjEvWy82b+u18l0noXQJnJfwu4/EnqqRHViGjphOpEFP4k9UjXCkRU\nc8LZQg+c+two9PLR00QMhR1jDKnPxlKfZlOX5NQX81MrInKr+DljbE55VyLqf/zN3Ul1K+k5\nG/VkOf2No/XE03PI3mJAfjMwuTHG9F8j1k1uxamwy9fRJF8HgnzfkV74aV7jKt7qU5kT2bfo\n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"
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
    "par(mfrow = c(4,2))\n",
    "\n",
    "H3 <- hist(abaloneAGE1$Length)\n",
    "\n",
    "H4 <- hist(abaloneAGE1$Diameter)\n",
    "\n",
    "H5 <- hist(abaloneAGE1$Height)\n",
    "\n",
    "H6 <- hist(abaloneAGE1$Whole.weight)\n",
    "\n",
    "H7 <- hist(abaloneAGE1$Shucked.weight)\n",
    "\n",
    "H8 <- hist(abaloneAGE1$Viscera.weight)\n",
    "\n",
    "H9 <- hist(abaloneAGE1$Shell.weight)\n",
    "\n",
    "H10 <- hist(abaloneAGE1$Rings)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "023ad541",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:38.244481Z",
     "iopub.status.busy": "2022-12-07T02:32:38.243064Z",
     "iopub.status.idle": "2022-12-07T02:32:38.260377Z",
     "shell.execute_reply": "2022-12-07T02:32:38.258793Z"
    },
    "papermill": {
     "duration": 0.029342,
     "end_time": "2022-12-07T02:32:38.262670",
     "exception": false,
     "start_time": "2022-12-07T02:32:38.233328",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "   F    I    M \n",
       "1307 1342 1528 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "table(abaloneAGE1$Sex)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "68258486",
   "metadata": {
    "papermill": {
     "duration": 0.008467,
     "end_time": "2022-12-07T02:32:38.279548",
     "exception": false,
     "start_time": "2022-12-07T02:32:38.271081",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "None of the variables appear to have 0 variance."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "ffd82c2a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:38.299990Z",
     "iopub.status.busy": "2022-12-07T02:32:38.298558Z",
     "iopub.status.idle": "2022-12-07T02:32:38.355647Z",
     "shell.execute_reply": "2022-12-07T02:32:38.353805Z"
    },
    "papermill": {
     "duration": 0.069863,
     "end_time": "2022-12-07T02:32:38.358293",
     "exception": false,
     "start_time": "2022-12-07T02:32:38.288430",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.0144223076482966"
      ],
      "text/latex": [
       "0.0144223076482966"
      ],
      "text/markdown": [
       "0.0144223076482966"
      ],
      "text/plain": [
       "[1] 0.01442231"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.00984855103022665"
      ],
      "text/latex": [
       "0.00984855103022665"
      ],
      "text/markdown": [
       "0.00984855103022665"
      ],
      "text/plain": [
       "[1] 0.009848551"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.0017495026644267"
      ],
      "text/latex": [
       "0.0017495026644267"
      ],
      "text/markdown": [
       "0.0017495026644267"
      ],
      "text/plain": [
       "[1] 0.001749503"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.240481389201562"
      ],
      "text/latex": [
       "0.240481389201562"
      ],
      "text/markdown": [
       "0.240481389201562"
      ],
      "text/plain": [
       "[1] 0.2404814"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.0492675507435239"
      ],
      "text/latex": [
       "0.0492675507435239"
      ],
      "text/markdown": [
       "0.0492675507435239"
      ],
      "text/plain": [
       "[1] 0.04926755"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.0120152838599927"
      ],
      "text/latex": [
       "0.0120152838599927"
      ],
      "text/markdown": [
       "0.0120152838599927"
      ],
      "text/plain": [
       "[1] 0.01201528"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.0193773832021586"
      ],
      "text/latex": [
       "0.0193773832021586"
      ],
      "text/markdown": [
       "0.0193773832021586"
      ],
      "text/plain": [
       "[1] 0.01937738"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "10.3952659473471"
      ],
      "text/latex": [
       "10.3952659473471"
      ],
      "text/markdown": [
       "10.3952659473471"
      ],
      "text/plain": [
       "[1] 10.39527"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "var(abaloneAGE1$Length)\n",
    "var(abaloneAGE1$Diameter)\n",
    "var(abaloneAGE1$Height)\n",
    "var(abaloneAGE1$Whole.weight)\n",
    "var(abaloneAGE1$Shucked.weight)\n",
    "var(abaloneAGE1$Viscera.weight)\n",
    "var(abaloneAGE1$Shell.weight)\n",
    "var(abaloneAGE1$Rings)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "4e5f65e9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:38.380287Z",
     "iopub.status.busy": "2022-12-07T02:32:38.378785Z",
     "iopub.status.idle": "2022-12-07T02:32:38.586011Z",
     "shell.execute_reply": "2022-12-07T02:32:38.583369Z"
    },
    "papermill": {
     "duration": 0.221486,
     "end_time": "2022-12-07T02:32:38.589173",
     "exception": false,
     "start_time": "2022-12-07T02:32:38.367687",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 8 × 8 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Length</th><th scope=col>Diameter</th><th scope=col>Height</th><th scope=col>Whole.weight</th><th scope=col>Shucked.weight</th><th scope=col>Viscera.weight</th><th scope=col>Shell.weight</th><th scope=col>Rings</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>Length</th><td>1.0000000</td><td>0.9833190</td><td>0.8882060</td><td>0.9726329</td><td>0.9568303</td><td>0.9526577</td><td>0.9479264</td><td>0.6043853</td></tr>\n",
       "\t<tr><th scope=row>Diameter</th><td>0.9833190</td><td>1.0000000</td><td>0.8957053</td><td>0.9713244</td><td>0.9504722</td><td>0.9483906</td><td>0.9541488</td><td>0.6228950</td></tr>\n",
       "\t<tr><th scope=row>Height</th><td>0.8882060</td><td>0.8957053</td><td>1.0000000</td><td>0.9159848</td><td>0.8741960</td><td>0.9005869</td><td>0.9212243</td><td>0.6577164</td></tr>\n",
       "\t<tr><th scope=row>Whole.weight</th><td>0.9726329</td><td>0.9713244</td><td>0.9159848</td><td>1.0000000</td><td>0.9770596</td><td>0.9752517</td><td>0.9694259</td><td>0.6308320</td></tr>\n",
       "\t<tr><th scope=row>Shucked.weight</th><td>0.9568303</td><td>0.9504722</td><td>0.8741960</td><td>0.9770596</td><td>1.0000000</td><td>0.9476354</td><td>0.9177305</td><td>0.5394200</td></tr>\n",
       "\t<tr><th scope=row>Viscera.weight</th><td>0.9526577</td><td>0.9483906</td><td>0.9005869</td><td>0.9752517</td><td>0.9476354</td><td>1.0000000</td><td>0.9381434</td><td>0.6143438</td></tr>\n",
       "\t<tr><th scope=row>Shell.weight</th><td>0.9479264</td><td>0.9541488</td><td>0.9212243</td><td>0.9694259</td><td>0.9177305</td><td>0.9381434</td><td>1.0000000</td><td>0.6924746</td></tr>\n",
       "\t<tr><th scope=row>Rings</th><td>0.6043853</td><td>0.6228950</td><td>0.6577164</td><td>0.6308320</td><td>0.5394200</td><td>0.6143438</td><td>0.6924746</td><td>1.0000000</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 8 × 8 of type dbl\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & Length & Diameter & Height & Whole.weight & Shucked.weight & Viscera.weight & Shell.weight & Rings\\\\\n",
       "\\hline\n",
       "\tLength & 1.0000000 & 0.9833190 & 0.8882060 & 0.9726329 & 0.9568303 & 0.9526577 & 0.9479264 & 0.6043853\\\\\n",
       "\tDiameter & 0.9833190 & 1.0000000 & 0.8957053 & 0.9713244 & 0.9504722 & 0.9483906 & 0.9541488 & 0.6228950\\\\\n",
       "\tHeight & 0.8882060 & 0.8957053 & 1.0000000 & 0.9159848 & 0.8741960 & 0.9005869 & 0.9212243 & 0.6577164\\\\\n",
       "\tWhole.weight & 0.9726329 & 0.9713244 & 0.9159848 & 1.0000000 & 0.9770596 & 0.9752517 & 0.9694259 & 0.6308320\\\\\n",
       "\tShucked.weight & 0.9568303 & 0.9504722 & 0.8741960 & 0.9770596 & 1.0000000 & 0.9476354 & 0.9177305 & 0.5394200\\\\\n",
       "\tViscera.weight & 0.9526577 & 0.9483906 & 0.9005869 & 0.9752517 & 0.9476354 & 1.0000000 & 0.9381434 & 0.6143438\\\\\n",
       "\tShell.weight & 0.9479264 & 0.9541488 & 0.9212243 & 0.9694259 & 0.9177305 & 0.9381434 & 1.0000000 & 0.6924746\\\\\n",
       "\tRings & 0.6043853 & 0.6228950 & 0.6577164 & 0.6308320 & 0.5394200 & 0.6143438 & 0.6924746 & 1.0000000\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 8 × 8 of type dbl\n",
       "\n",
       "| <!--/--> | Length | Diameter | Height | Whole.weight | Shucked.weight | Viscera.weight | Shell.weight | Rings |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| Length | 1.0000000 | 0.9833190 | 0.8882060 | 0.9726329 | 0.9568303 | 0.9526577 | 0.9479264 | 0.6043853 |\n",
       "| Diameter | 0.9833190 | 1.0000000 | 0.8957053 | 0.9713244 | 0.9504722 | 0.9483906 | 0.9541488 | 0.6228950 |\n",
       "| Height | 0.8882060 | 0.8957053 | 1.0000000 | 0.9159848 | 0.8741960 | 0.9005869 | 0.9212243 | 0.6577164 |\n",
       "| Whole.weight | 0.9726329 | 0.9713244 | 0.9159848 | 1.0000000 | 0.9770596 | 0.9752517 | 0.9694259 | 0.6308320 |\n",
       "| Shucked.weight | 0.9568303 | 0.9504722 | 0.8741960 | 0.9770596 | 1.0000000 | 0.9476354 | 0.9177305 | 0.5394200 |\n",
       "| Viscera.weight | 0.9526577 | 0.9483906 | 0.9005869 | 0.9752517 | 0.9476354 | 1.0000000 | 0.9381434 | 0.6143438 |\n",
       "| Shell.weight | 0.9479264 | 0.9541488 | 0.9212243 | 0.9694259 | 0.9177305 | 0.9381434 | 1.0000000 | 0.6924746 |\n",
       "| Rings | 0.6043853 | 0.6228950 | 0.6577164 | 0.6308320 | 0.5394200 | 0.6143438 | 0.6924746 | 1.0000000 |\n",
       "\n"
      ],
      "text/plain": [
       "               Length    Diameter  Height    Whole.weight Shucked.weight\n",
       "Length         1.0000000 0.9833190 0.8882060 0.9726329    0.9568303     \n",
       "Diameter       0.9833190 1.0000000 0.8957053 0.9713244    0.9504722     \n",
       "Height         0.8882060 0.8957053 1.0000000 0.9159848    0.8741960     \n",
       "Whole.weight   0.9726329 0.9713244 0.9159848 1.0000000    0.9770596     \n",
       "Shucked.weight 0.9568303 0.9504722 0.8741960 0.9770596    1.0000000     \n",
       "Viscera.weight 0.9526577 0.9483906 0.9005869 0.9752517    0.9476354     \n",
       "Shell.weight   0.9479264 0.9541488 0.9212243 0.9694259    0.9177305     \n",
       "Rings          0.6043853 0.6228950 0.6577164 0.6308320    0.5394200     \n",
       "               Viscera.weight Shell.weight Rings    \n",
       "Length         0.9526577      0.9479264    0.6043853\n",
       "Diameter       0.9483906      0.9541488    0.6228950\n",
       "Height         0.9005869      0.9212243    0.6577164\n",
       "Whole.weight   0.9752517      0.9694259    0.6308320\n",
       "Shucked.weight 0.9476354      0.9177305    0.5394200\n",
       "Viscera.weight 1.0000000      0.9381434    0.6143438\n",
       "Shell.weight   0.9381434      1.0000000    0.6924746\n",
       "Rings          0.6143438      0.6924746    1.0000000"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nlLpM+1IlqUONc+fYJSzVXdfrsioKDFR4VXW9QbM3Fx69o75sNv01Ty1qq2yogsupdS/9fFj2\nU3rhX6pdTYHBuvxKvfVjkYvmp2rcUDWJUmiwatXTgH9re2rh0foVdflESbqngWw2Hcq48Etu\nvNz5cfv8vapcVo//6uY/JUmSPTfp4Y5XPDrh4/W7D2bmnDpyYNesD1/u1Ch2dWr2370kPWFW\nh+bdX5k2Z+eh49m5mQf3bJoyYcQV7QcePt0ZmX5wTvsmMS9Pnr19/9FTebmpx/cvmf3RHZ0a\njv3hgCea4F7THnh0woQJr0/yyJ+20WJraNsIfXne/LmZz2jTccWOk6TUTXp3u6IfNr664omO\nLvyq00AL/9LBn3X/rWrTvMihgi8A8AyGYs0ztKEGH9Ps/RoRfu6ho9+p0U3KtqnX9YqqrCO7\n9d13WvGdfk4sspZ9y5tVub3+fYf2LtU3C3VNG10XqgV+GnCXsvdo2rca1kNdjqpFZUmyZ6hb\nI608rMYddHsPHdymGa/r68+1cIO6VpekF17T7s81+kcNfF4dqio8+MIvKTC+p/67SzcPVPxl\nnvhzWvVsn+mbT0iK6nH/k7dftW3xtLc+X30qZf3tvd9O+PlxV6+wP9bj4Z0ZuTabLfb+J265\nqtqmHz5679utKdu/6flAv42f9JH0Rp+CE/x63POfGzvXT9m96s1Xpx7OyXr97j6PHV4X5p3r\nUziyd63/ecprT7/5/V9ml+I+M2apXhfd0Ur/7a6OLRURopQkrVqo3/apeqy+ukmHJ6n2w8oP\n0EKvf7iqhZ+oAcCHOOA5hyc7JEe991wf3X6XQ3LctNjhcDjaRzokx6k856FhzRyS4/M/C0/e\n8F+H5Og63/nt7fUckuOqkY48u3PPjdEOyVGmkeNolnPPZ30dkuOelc5vx3dySI7HpjlOv8Kx\n9jNHsL+jXEtH7ulde/7tkBxTd1zsS26o47D5O6r3dqTlXPAPIy8vLy0tLaO40pMblgmUFFy+\nTdLJ9IJ9T9WPKHj3/nDoxPmvSNo5vuBorV5Tzux8qlklSX7+ZTYcS01POxJgs0mq1euTMyds\n/vSagle9vCOpuDWmpaWlp6cXu2nFMf+mJqEBRfrXw+uM9+gVC6SlpeXl5V3wf+4lSd3muO86\nR6C/Q3J++YU47nzC+aY68Lqj+02O73Zc6KcAABwOh4OhWPMEVZOkRFcz5Ho8o6lTdWu9wj2N\n+knS0awip80aXTjrfFgjSXr8i8IVFuL/JUmHT79k/K8K66hXBxTO5Gt7pwY3VPp6JZw1unq2\ni3mJI18fvadynpohnnls9p+ZuZIqNP1PudONvXGQ86bdd7Ykn/+SlK0LCzaajux6ZuftwxpJ\nsudnjtuVarMFhfjZJJWrW+fMCRHNahdsVPTKxdLyM7Ny5RcQEBAQYPYdNm4X1kiTv1PGcf3y\ns374QSvXKjVNn413vqkuG65Fs3RdfbOrBADfwFCseXKPSFKkq5Wurr1VkvIztW2H9u3Tnt36\n7j0Xp4UFFW5HBEpSt6qFewIrFG6nr1NKtiIba+qUIj+hrJ8k/XZcdSPO/eEX/5I2VVy2zy2y\nk533QlZoUXiVCi2dTUtceVQdqp/zEvvpiXRnj6faTofCPcuOqHmld/pE3zN7z85PBk2L//Km\nTvVTdq8edessSeVr39a/qjdO0u82a3NBlM4+ubxiZLzJ1XhCYLjaXG12Ee5j1SdqAPB6BDvz\n/LxHkjq6SkWZ2/XQUH25WDn58gtUVD216SbtOfe08z8S/P7mUyJrhyQdmqzBk10cTcxysfPi\nX+LJtfeyjzvvVA2pWpiAQ6qULdjI2Jdx/ksiGreSlkra/MpPmn1nwc4vXt9WsJGekC7p5qnL\n9gZ1H/vVnw9d3+7MUjQVmt06e/77lusQ8z6pqZIUFi7b6e1/EH7eDFSfULPmPz1RI3Gffl6s\nqe/pNV97ogYAr8dfKOZ5+09JuqmWi0MdOmnaIg3/r/7Ypexs7dmqL167pGsFXSZJbefI4XDx\n9VizS3qJJ7scck/mFmwEhhWO9vqd7ozMO330bOWjnmhTPljS/oX/into9IeT3x1261XjNzkD\noiPPIen477NmzNt7+qc5s1zq9oUz5/zpkWbgbBERiojQiazC7X/48lFWfaIGAK9Hj51J9k7V\nH8cU3kXR53VIZG7RxuOq+6omDC/cmXv0ki4X3kllArVnqnR9kf3TX9LvxzR2QpFR3RK/xAMC\nyjnfotnJhYub2POd3TwBYS7m9tn8yn7xxbDmfV89ZXesmPb6immSVO7ysPQ9JyWFRobmpm/o\nHPf4/uy8wLJNP/zuy5va1jmxZ+XIPv1m7kt5d0iXGlcnDKvvm71EvuL22yUpKECSBgwwtxZP\nuW6oyvXQwvfPWnvZTy17aN5mVauqO6/VzJv15BQtWKiPXtVLvvNEDQBejyfd1/IAACAASURB\nVGBnhjVfqfdDsjs0dZqL7i5bgGw2Ze6U43RnWO5RPXKTJKnED5P1070N9c43GjtHz/Vx7tv7\nvR4Yo8A2mlg0HuXZi/0SjwmpXLlgI+tQ4eBv9rH0go2yUWVdvqpG7HMb5l7+n5ffWbruT3to\nlc597n3qplVdrl8sqUqHygnfDtyfnSep5dhpt7a7XFLVup3fmDlwZut3HPbcd4f/Omxud482\nqrSbMaNwe/p08+rwJKs+UQOA1yPYed7hj9RvsXM7N1O7N2rzAdlsenqWbohycX5oQ3WsppUf\nqssJdWuqpN2a842i+ih4mxKe05vHNexfJSlj4gItaqoxffVFK3Vso/R9mr1QjjKaN6twZl5g\nNUl65WkdbK7hT1/USzwsuGKsNENSyh+Hzuw8vto5rlozpprrl0m1utw1o8tdZ75d/2z7go0+\nDcKS55wo2K7YsvD+kuDKLQs2Mvbvlgh2xso7oUVLtGOf0rM0arT2JSja1a+GD3E+UcPVG2lv\nmlTeue0TT9QA4FOYY+d56es1c6bza84iHZVuGKSfduqlm/72JT+u1QN9tWOhJr6lTYf072la\nM0OP95F9h8ZPKmEZQTW0cZOeGKS8RH32sdbu0bX36pc96hZZeE6NR9Wvgw58pwlv6VTeRb3E\nw8pUvqVOSICk5O0vJxbc7urImzx5pySbzW9YIxdzsE4lz4+JiYmJibnl0Z8K9thzDj338U5J\nQeVaDaxWtlI75w0rmyd8f+ZVO2Z8UrAR3rCB55oDF5a8p1q11PsWDX9co5+RpLG9VKeNFvry\nOsxWeqIGAJ9iczgcZteAUiE/Pz8rK8vPr9j/llg2rFXvydslVWjWfeANV59Y8/m0H3dLqtJq\nzL7lIyV93ir64V3JkrrP3T6rU6TDntG+es3NGTk2W0DcPY+0jbSt+fbTBVuSJXV86ZeFw5vm\npm9oWKtLUk6+pIY9+t90db0TO1dMmbE01+Gw2Wwvrj84vJhz7Ox2u81ms9mM6MU8s9xJeJ3x\niZsf9fTl7HZ7aGiov7/H7hU+8JXq3il7eQ0ZIr9v9NpWORz6epTueVU5odqxX3XCPHVpj0pf\np3pdlJSpVq6eqLFzvtKnOJ+osfaAWntwwSAApQ3BDgYpcbCz5yQNatty5s4i62IEl28xe8tP\nXSuFSJreouaDO5Ml9Zi/63+dIyUdmPfcFbdNzLYXeW9Xa/fIlh8nhPrZJO35dnSHu95Mz7ef\nfYLNZuv1xKxZz/QqdoUEuxLrGKm1adp0QI0jtKCn4hap4G+kvXPU4Ea1nqTVgz11aU87uV0j\nRmraD8o9PTXWL0R3DNMHL6hcoA6+oXtWaNh41l4G4F4MxcLb+QVV++TXP/77+D3N60SWCQys\nUC26zz0jl29bXJDqXKrZe+y2xVPv6t21fq0qgSHlatdv+8hzH246neokXd73xT/XzBpyW1y9\n6hWDAwLKV4i8Ou7292b/XoJUh0uy/riavqnG5w2p1+mjZpW1caIZNbkJT9QAYAZ67GCQEvfY\neT8je+wM5vEeu0B/9VyouddIKtJjJ6lvHc07odwLrWAMADgLd8UCME+FEK37VLrmvAN2rT2q\n8FgTSiqx0vBEDQBej2AHwDwjWuqp6Xqim8YNKtzpyNXY65SUoZGjzKus+Aqek3EsU5VCL/zM\nDIZKAHgGwQ6AeUbO1bcN9cp9mj5B0cmSNOhOrZyrXamq308vtja7vuIoDU/UAOD1mGMHgzDH\nzhd5fI6dpPx0jXtSH36u/SnOPZWiNfBRjRuuIAu+WwDAowh2MAjBzhcZEezOSEzQiXSFVVRt\n41bA9izrPVEDgNcj2MEgBDtfZGiws5gl76n/SB3OdH7rcGhQIy0tr0mz1LO2qZUBsDKCHQxC\nsPNFHgl2f/xRjJOvvNKdlzaMVZ+oAcDrEexgEIKdL/JIsCvWH5SP/gVl4SdqAPBu3BULwFhx\ncefuWblY6Tku9vuu9cfV9P1/fKIGwQ6ARxDsABjrhx/O3dO0irYec7Hfd+Xmq2a060O1y2hz\noqHFAChNLDguBgAmcz5R43wFT9ToanQ9AEoNgh0AuNuIlkqariemyH7WHEFHrsbEKylD9/rU\nEzUA+BRunoBBuHnCFxm03EnBUKyV/i7KT1WnhlqTpMgGik7W6qO6p3/hEzU2z1AQK8gA8AgL\nfsoCgMn8w7Vyl154RAFHtPqoJE39QskVNGKiNn9JqgPgOfTYwSD02PkieuzcwHpP1ADgxSz4\nKQsAJvtirk5kO7drRKlZU1IdAGOw3AkAYz300Ll7DqW73i/p/fc9Xo8n3Hmd/ALVNla9eys+\nXq3rm10QgNKCoVgYhKFYX8STJ0po5INaulS/73DeFVulnuLj1bu34mIVHmR2cQCsjGAHgxDs\nfJFHgt233xbj5L593Xlpg6Ud0vJlWrq0MOT5BavDNYqP16ghZhcHwJoIdjAIwc4XGXTzRGmQ\ndlDvv6pxHyglW/LZnkgAXo85dgDgGY48bVyrZcu0bJmWr9CxLEkKrqhOXcyuDIBlEewAwN1e\ne17Llmn5z87+uaAIdeqpbt0UE6MOV8jfgp27ALwEQ7EwCEOxvoih2BIqeDNUbqpH7lVsjK5u\noQCrvD3WrVO95q5vAUnYopQgXcktwICZCHYwCMHOFxHsSujyKtp7TJLCL1OnTurcRZ07q10z\nK/TV2Wz63171jXZxaHRLvZqk7ESjSwJwFoZiAcDd9hzVgW1asULLl2vFCs37PzkcCorQ1Z3U\nubM6d1GP9maXWEzvvq08u3P7u0+0r+K5Jzjy9OVeKdjgugCcgx47GIQeO19Ej517nEjQihVa\nvkxTpvvqXbGhgTqVd+HTen+oufd7vhoAf4seOxjKbrdbLNvZ7XZJDofDesGuoGkF/7UkgwLr\nrvVaskSLF2vpUmeqq97AiOu617wFzsWWu3fX2M/UsbqLc8pUUrsWBtcF4Bz02MEgubm52dnZ\nFz4PMIoHOyMTNjvD3JIlOpAqSX6h6niN4uMVH68WdTxyUWPEx+vZqepQzew6ALhGsINBCoZi\nJVmsZ+vMb5DF2qWzmmaxTlad7ob0YLA782a4rLHi4hUfr55dVT7QI9cCgLMwFAtDWS8i2Gw2\nq86xO9M0swtxPz8/P88OMXfrq/h4xcXpiigPXsUU+Wl66n7NWqYj6a5PSEsztiAARRDsAMDd\nlvzP7Ao8ZkQnvbVRZWqoVSsrrN4CWA5DsTAId8X6Ims3zYQbfk/+rIa3SNKhQ4Ze143CQ2Rv\nor2rVDnE7FIAuECPHQAYxZGjw4fNLuLSZOTqtjdIdYDXItgBgFHKtdaaNWYXcWnCgmTBDlzA\nOhiKhUEYivVF1m4aay+XxPhYvZSiw2tVlpt8AW9EsINBCHa+yNpN83iwyzuhRUu0Y5/SszRq\ntPYlKNo3b5JNSCjcduToge7aUktjhqlFY1Upf+7JUb7ZRsAqCHYwCMHOF1m7aZ4NdkveU/+R\nOpzp/Nbh0KBGWlpek2apZ21PXdRDivUG4DMFMBVz7ADA3Q58pbihspfX8BHy+0avbZWk3jfr\n/17Vtc21Y7/qhJldYnEMGWJ2BQAuFj12MAg9dr7I2k3zYI9dx0itTdOmA2ocoQU9FbfI2Y+1\nd44a3KjWk7R6sEeuC6DUs+CnLACYbP1xNX1TjSPO3V+nj5pV1saJZtQEoFQg2AGAu+Xmq2a0\n60O1yygn0dBiAJQmzLEDAHerEKJ1n0rXnHfArrVHFR5rQknu0rjx3x4KCFR4FdVvpPib1O8a\nlrsDTEGPHQC424iWSpquJ6bIftYkZkeuxsQrKUP3jjKvsktWs6ZS/9L27dq+XfsSlZqiv3Y5\nvz1+TNt+1dT3dFt3dRisXLvZtQKlEcEOANxt5Fy1r6ZX7lPNRhq7QZIG3akGVTR2oer304ut\nza7vEkwepOPZin1Av+xUZqoSDykjW78vVM8oRcUpMVnH92jcIP0yRWN+N7tWoDTirlgYhLti\nfZG1m+bZdezy0zXuSX34ufanOPdUitbARzVuuIJ8+begeWUlttGRefIv+q7IT1e1quo2XTNv\nlqSYmtrSUUe+MqVGoDQj2MEgBDtfZO2mGfRIscQEnUhXWEXVjvT4tQwQHKDY+fqhu4tDN1yu\nBVLWHkn6qJMe3qrcEwZXB4CbJwDAk2pEqYbZNbhRgJ/+2iq5CnZ706TTTxj7K0P+ZYysC0AB\ngh0AuMPBg8U4+bLLPFaHh8XW0NwR+rKTbr+qyP6Zz2jTccW/I0mpm/TudkU/Y0qBQCnHUCwM\nwlCsL7J209w8FFtKHqiavk71uigpU626q2NLRYQoJUmrFuq3faoeq53zlT5FtR9WfoDWHlDr\nKmaXC5Q69NgBgDsMLh1PCSvXSjvWacRITftB63507vQL0Z1P6IMXVC5QqVnqeoOGjSfVAaag\nxw4GocfOF1m7aQbdPGFVuanasEXHT6p8RV15lcrRTQB4BX4VAcBjtv6i9duUkqHwSmrRXs2i\nzC6oRFJTJSksXLbT2wUaNHVu5GfozO7wcENrA1AUwQ4APGDjNxo0TL8fKLLzquv06TQ1q2BS\nTSUVESFJxzJVKdS5/Q8YBQJMRbADAHc7OkftblO2Xdffo2vaqUp5nTioH/+nOXPVprX2b1Hl\nELNLLI7bb5ekoABJGjDA3FoA/DPm2Hm9P+9Uoy90w2LNjnFxtH5F7UrW4QxVu7glo1pW04Yj\nOpWn4IubWnRHfX25SymnFB5cjJpdYY6dL7J20zw4x657LS0+pG+36/p6RfbPHaPrn1eP/9OC\nWzxyXQClngU/ZWGohNGqUEEzdptdB+BN1h5R/XHnpjpJ145Ro4paNc6Mmtwq74R+mKU3J+ql\nFyVpX4LZBQFwYii2lPnfKp3KU5D7einsp5SSohy7234gYAFZeap/letDjcO1Y6ex1bjbkvfU\nf6QOZzq/HTVaY3tpaXlNmqWetU2tDAA9dqVNVF01bChfG1iz5yVPeX5opysaVKlQqU7DK+9+\n7KVtaTn//JJTx9a/NGxAq0bRlcIjatRudN2A4d9tPH72CVlJv4196I4W9WpXjKjSoHn7R5+f\ndDzX/HhagpZ6Z0NKJjvlx+eff/7Vt9eYXcglKx+oDbNdH/rtmMq3MbYatzrwleKG6liQho/W\niCbOnb1v1pE/dG1z7T1panEAmGPn/Yo7xy4/Va88o+nfau9hVa6lrn01+lk1Or0AQYcaWnOo\nyBy7lE0a9qTmrVB2kDr21uT31aWmTnbX0a+l03PsTqRp0hOa9I0Opiqqrm54UOMflr/NefUz\nEtMVWfbv2lHiOXb23KSHO7WevrnI08RDIlp+v/WnDn8z8y/94JxOLe/emZF79k6bf+jIrzY8\nF19TUnrCrE5t7jvnhIhGN61b/Wn1oOJX6KaJaCVpqVsb4qIkY+fYfXRb4+Hf/xVeZ3zi5kc9\nfS3PzrG7t6E+2aGX/qen+p7176h8TbhdT87UoJ80JdYj1zVAx0itTdOmA2ocoQU9FbfIeRvs\n3jlqcKNaT9Lq0rFQM+Ct6LGzFnuGujXS029Ll+n2u9S4mma8risbatlh1+dnblWj9pr+g5p0\n1g3dtHW2Gl6lE6fOPe2BNnrpR8X204P9lbxL/x2iBxdK0guv6cXukjTweX3wwaXfYOHSqmf7\nFGSdqB73v//x+0Pv7CDpVMr623u//XcveaPPwzszcm02v56Dnnx/ysfjRt1XPcjfkZ/1+t19\nTuY7JPtjPQpOsF3zryff/+D1h/s2kZSy/ZueD3zviSZcpOK31EsbUmyO7F2/L356QPvh3/9l\ndilu8s43qlpGo25Qg/Z6cJhGPaUH71b9KnpypqrE6J0uZtd3CdYfV9M31fi8RU/q9FGzyto4\n0YyaABSix87rFfTY1eiqq109n2f+HKXnFPbYTeisJ1fqsWmaeJezn+CXz9VloAKvUPI6BdjO\n7bG7o56+3K2PftXg1pKUk6irW2jdUVW+pUiPXcVYbZ+rKiGSlL5RlVspqIVO/ipJex/X5RM1\ndYcG1v/ndpSwx86Rc1XVqn9m5gaXb/PXwSXl/G2SXmxx2bidKZJ+OHSiS9i5adJhz4gIq5bn\ncNTq9cn2b24t2Ll3Zp9mA3+S9PKOpPtsn1Sr/6SkWr2mbP/mtoITXmxXe9zm437+ZX5POlQ/\ntHhzT93TrVX8lqYnvu3ehpzPgB67FXe1uXHO9qy8wuFjK/TYSTq5VUP/rS8WKTffuScwXHc8\nqLefV1iQpy5qgEB/9VyouddIKtJjJ6lvHc07odzUf3g1AE+jx85HJC7TzJkuvtKLTsAa/6vC\nOurVAYWjP23v1OCGSl+vhPP+ts1P1ax9qj7YmeokBdXQ7GdcXH3yx85UJ6ncFapWRtkH3dWy\nf5Z5bPafmbmSKjT9T0HWkXTjoLoFG+9sST7/JTZbUIifTVK5unXO7Ixo5pzTXTHQL2XrwoLt\npiO7njnh9mGNJNnzM8ftMudjqQQt9c6GFFd+Zlau/AICAgICrPV0r7AmmvqDMk/o91+0ZJl+\n36yME/p0vG+nOkkVQrTuU1cH7Fp7VOFdXR0CYByCnY+4YbEcDhdf9c5awj59nVKyVbaxpk7R\nxx8XfpX1k6Tfjp/7M5OmKzdf3e4qsrPmQwo8713RsWqRb/2Mu/kiO3lRwUaFFoUdlhVaOlud\nuPKoi9fYAt/pEy1p5yeDpi3enJ6TfWDb0uH9ZkkqX/u2/lXL2E/fw3t2M2yns9SeZUfc24SL\nVIKWemdDiqvbrM2pqampqalH9vvU8PFFCghTyzbq1kUtm7r4zfJFI1oqabqemCL7WaM9jlyN\niVdShu4dZV5lACSWO7GUrB2SdGiyBk92cTQx67zzt0vS5UVvd7AFKPi8d4Ubl0cppuzjzjwa\nUrVwpf6QKs6aM/ZluHzVzVOX7Q3qPvarPx+6vt1Dp3dWaHbr7Pnv+0sRjVtJSyVtfuUnzb6z\n4OgXr28r2EhPSHd3Iy5KCVrqnQ2BxY2cq28b6pX7NH2CopMladCdWjlXu1JVv59ebH2h1wPw\nLEv8CxIFgi6TpLZzXPftPdbsvPMjJencxGBXTv65Z5q3PEruSef9noFhgWd2+gU6+7HyTua6\neI10/PdZM+btPX2yM5Wmbl84c86fkspHPdGmfLCk/Qv/FffQ6A8nvzvs1qvGb3LmKkeeObNO\nS9BS72wIJCk/Tf+5XXUjVb686y/f5R+ulbv0wiMKOKLVRyVp6hdKrqARE7X5SxP/EQigAD12\nFhLeSWUCtWeqdH2R/dNf0u/HNHbCuZN7qt4tv2e0ZIZ01j16hz52EezME1DO+RbNTs4+s9Oe\n75w9FnBWBjojN31D57jH92fnBZZt+uF3X97Uts6JPStH9uk3c1/Ku0O61Lg6YVj98C++GNa8\n76un7I4V015fMU2Syl0elr7npKTQyFBPN8qlErTU5lfWCxsCSRrRSW9tVJkaatVK/r62buQF\n+ZfT6Hc0+h0lJuhEusIqqnak2TUBcKLHzkr8dG9DHftGY+cU7tv7vR4YoylrVe68ZBBcS3G1\ndOgDTdvg3JN7RDe7unnigvI8tSJuSOXKBRtZhwqHkrOPOQcZy0a5WDYv4dv/7M/Ok9Ry7LRb\n210eYLNVrdv5jZkDJTnsue8O/1VSjdjnNsx9v0/nZmFlAstVqhE/aPS8N51DSFU6VPZQW/5Z\nCVoqr2wIJGnqnyrXUgm7tXyplixx8eW7vpirE6f/7VEjSs2akuoAr0KPnbVMXKBFTTWmr75o\npY5tlL5PsxfKUUbzZrm+4+HrH9S8g+5prWnXKSpUS+YqbIDKTlbARQ8VBVaTpFee1sHmGv60\n2+/4C64YK82QlPLHoTM7j692jjbWjKl2/kuSNzgX+K3YsvDOkuDKLQs2MvbvlrpLqtXlrhld\nCm8cWf9s+4KNPg3C3Fj/xStBSwt4W0MgSRm5uu0NVQ658Jk+587r5BeotrHq3Vvx8Wp9gXWO\nABiMHjtrCaqhjZv0xCDlJeqzj7V2j669V7/sUbe/+Sd1mSbaulkDr9eO5fpmsboM09q3lZPv\nnK53MWo8qn4ddOA7TXhLp/Lc1Y7CAivfUickQFLy9pcTC24CdeRNnrxTks3mN6zReaukSpXa\nOe8q3Tyh8C7LHTM+KdgIb9jgVPL8mJiYmJiYWx79qWCnPefQcx/vlBRUrtXAan/78AyPKkFL\nvbMhkKSwIJ97cN/FevwBXXW5flmoZ4epTQNVra+BQ/XVfKVe4Nl3AIzBAsWl25rV8quktg0K\n92RuVtnmipmnxfHuvVSJHym2bFir3pO3S6rQrPvAG64+sebzaT/ullSl1Zh9y0dK+rxV9MO7\nkiV1n7t9VqfI3PQNDWt1ScrJl9SwR/+brq53YueKKTOW5jocNpvtxfUHh9UNaF+95uaMHJst\nIO6eR9pG2tZ8++mCLcmSOr70y8LhTYtbobtW8b1gS89p7Myrw9zbkPMZ+Uix7JPLK0bGyxoL\nFI+P1UspOrxWZV1MjrSCtENavkxLl2rpUv2+Q3aH/ILV4RrFx2vUELOLA0o1gl3pFhWuRD8l\nHymcgTexmx5fpmWJ6uLmeTMlf1ZsTtKgti1n7iyy3G5w+Razt/zUtVKIpOktaj64M1lSj/m7\n/tc5UtKeb0d3uOvN9PwiM/9sNluvJ2bNeqaXpAPznrvitonZ9iJv/mrtHtny44TQ4q/S57Zn\nxV6opTqvse5tiIuSCHYXLyGhcNuRowe6a0stjRmmFo1V5by5DVFRbruu6dIO6v1XNe4DpWRL\nEp8pgKmYY1e6TXtUsS+rWYwGXavwQK2br8+X66qH1dmLZkP7BVX75Nc/2r845tNZC3YfOBZc\n8bLO8f1GvfhUswp/+2jay/u++OeaLuP+O2n+sl/2HzsZVL5K83Zd73rwibt7OPsma/Yeu21x\n8+dembJm09Z9R7MiazW5vv/g5x7v75YwVGIlaKl3NqSUio4+b9dfuv9n1yf7evpx5GnjWi1b\npmXLtHyFjmVJUnBFdfLlx+AClkCPXan340d6ebK2/KnUPEU30S2D9OwDCnL/5MsS99h5PyO7\ntQxm7aa5ucfu0eL0Mr79ttuua7DXnteyZVr+s7N/LihCnbqqWzfFxKjDFRZc2wXwNQQ7GIRg\n54us3TQPzrGzsII3Q+WmeuRexcbo6hYKsODbA/Bd/mPGjDG7BpQKDocjLy/PkhHB4XBYNf1Y\nu2mBgYHu/JdGjYb6fYuSMxReVRWte0vytHeVkqnMo9qwRfv36+BR+YWoRlUjHyEN4B/QYweD\n0GPni6zdNDf32J39p1SziWK6KSZGMTGKruS2S3iJA9u0YoWWL9eKFdq6Xw6HgiJ0dSd17qzO\nXdSjvdn1AaUawQ4GIdj5Ims3zc3B7relWrVKq1Zp1WrtP1G4P6q5YmKcOa+Wi/UIfduJBK1Y\noeXLNGU6d8UC3oBgB4MQ7HyRtZvmwTl2B/7U6tMh7/dthc/cq9tCMTHqFqM7r//H1/uIXeu1\nZIkWL9bSpTqcIUnVG+jQn2aXBZRqBDsYhGDni6zdNINunshJ0S9rtGqVVv6k71c7O7R89y/e\nhM3OMLdkiQ6kSpJfqDpeo/h4xcerRR2z6wNKO9axAwBPOrRfWzdrzSot+dWZ54IqXOg1Xiy6\nuXPjssa67z7Fx6tnV5W36AM2AB9EsAMAd8tJ1uJFWjBf8xdoe6JzZ+P2iotTr16KbWtqcZem\nW1/FxysuTldY6OEZgIUwFAuDMBTri6zdNPcPxW5dowULNH++lvyq3HxJCrtMPXqpVy/FxalW\nmDuvBQCu0GMHAO5QO0L7UyXJFqjWMYrrpV5xurqZLJiKAXgvgh0AuENBqgsI06PP6I4+at2g\ndEW6kz+r4S2SdOiQ2aUApZoFx8UAwARvPq9rOykgU6+PVNuGqhytW+/X5K+VkGJ2ZYZw5Ojw\nYR0+bHYdQGnHHDsYhDl2vsjaTfPIcif56VrxkxYu0sKF+n2X8zbYBm3Uo4d69tQ1HVXWouMk\n+Wn6basktWtndilAqUawg0EIdr7I2k3z+Dp2x/dq0SItXKhFi3TgpCT5h6pDrHr20DPDPHhd\nAKUYwQ4GIdj5Ims3zaAFigts+knjXtBXy2X3wQWKd+8uxsl163qsDgAXZtFBAQAwXfIBrfpZ\nP/+sVau0ZoOy8537G7Y2taziq1evGCf7VmYFLIdgBwDu4tDODfr5dJjbtr8w5URfodhYxcYo\nJkY1yptaZPENH17k2/lTtT1F5Wrqms6qWUlJ+7RmqQ6kq+9TurGhSSUCcGIoFgZhKNYXWbtp\nbh6KvaG7Vq3W0czCPZc1UkyMYmIVG6PoSm67kLnWvKCOz2nwG3p7iIJO/zo7sjX6eo1bomX7\n1bm6qfUBpR3BDgYh2PkiazfNzcGu4E+pch1nkouJVcNIt/1w71EnQunddWTmeav02VU9TEH/\n0l+vmVIXgAIMxQKAO7wxRbGxam71J6geTFeb+1ytveynphW0YppEsAPMZMHuEwAwwbBB1k91\nkgJs2r/M9aHdaQqsbGw1AM5FsAMAXLQrKmn/BH2x6dz9M4YrIVVX/MeMmgAUYo4dDMIcO19k\n7aYZuo6dZRz8SpffqVy7rhuka7uoajkdSdC8r/Tdrwqspj27dFlZs0sESjWCHQxCsPNF1m4a\nwa6EfvtCA4dp67EiO5v10iefqTVDsYDJCHYwCMHOF1m7aQS7S+DQr0u0frtOnlJEVbXqoJY8\ncALwChb8lAUAeFZeso4lKytL2ZkaPEAVWGAB8Bb02MEgBT12kizWaWe32ws2LNYulYKmBQcH\nW69pBTzbE7nkPfUfqcOnl2J2ODSokZaW16RZ6lnbg9cFcBEIdjBIbm5udna22VUApYIHR5kP\nfKW6d8peXkOGyO8bvbZVDoe+HqV7XlVOqHbsV50wj1wXwMUh2MEgZ3rsLDZh68xvkMXapdLR\nNOv12BV0Rnow2HWM1No0bTqgxhFa0FNxi5zPw907Rw1uVOtJWj3YiZeKKAAAIABJREFUI9cF\ncHGYGAFDWe9z1GazWfUOg9LQNLMLcT8/P78zY+gesf64mr6vxhHn7q/TR80qa+NEiWAHmMlq\nn7IAAA/KzVfNaNeHapdRTqKhxQA4D8EOAHDRKoRo3aeuDti19qjCuxpdD4CiCHYAgIs2oqWS\npuuJKbKfNT/bkasx8UrK0L2jzKsMgMTNEzAMCxT7Iprmizy79nJ+qjo11JokRTZQdLJWH9U9\n/bVyrnalqn4/bZ6hIJ9d83ndOtVrrvAgF4cStiglSFfWN7wmoNgs+CkLAPAU/3Ct3KUXHlHA\nEa0+KklTv1ByBY2YqM1f+nCqk9S6tZb+zRzBjwaoLaPM8A3cFQsAKA7/chr9jka/o8QEnUhX\nWEXVjnQeykpQaJSpxRXfu28r7/R9xN99on0Vzz3Bkacv90rBBtcFlAxDsTAIQ7G+iKb5Is8O\nxW5NUZPz1jqRJIc+e0lDX9SJUx65rueEBupU3oVP6/2h5t7v+WqAS0WPHQDgorVupTW/6oqi\n3Vo7ftQD/9LSvfIvb1JZl2DeAueNIN27a+xn6ljdxTllKqldC4PrAkqGYAcAuGhBB9XuKv28\nTldVkqTco3p2qF79P+Xbdc19+uA1s+srvphY50ZcnHp0V4dqplYDXCqGYmEQhmJ9EU3zRZ4d\nij2wUFf2VUYlLV+vwzP00NNKzFClK/T2B7qjg0euCKA4CHYwCMHOF9E0X+TZYCfp8BI1v1Yn\nJHuW/II1ZJwmDFWIL98PWyA/TU/dr1nLdCTd9QlpacYWBJQEQ7EAgOKoHqOtC9W8l5Kkr7fq\npsvNLshNRnTSWxtVpoZatZK/BRM/Sgl67GAQeux8EU3zRR7vsStwYq2uuEYpUVq/WvXDPHst\nY4SHyN5Ee1epcojZpQAlR48dAOAf1anjen+eXRlb1ayeapQt3Ll3rzFFuV9Grm57g1QHX0ew\nAwD8owiXC9dJERGKdH3EJ4UFyYIduCh1GIqFQRiK9UU0zRcZNBRrPeNj9VKKDq9V2UCzSwFK\njmAHgxDsfBFN80UeD3aObE3/QNsu07hbnHtuHqBet2rw9fp/9u47PIqqC+Dwb5NseichJJAQ\nSui9I70nqCAovSuKKAIWVBARUQTlQ2yI0kRQQKUo0qXFSBMBkRY6oYQESCN1U3a+P7IhHZKw\nhV3O++Txmb075ZzNypzcuXfGytw+z4iI3GUlnTFdOenP9Ak0qo13oZstVza3p6WJR5IUdsJI\npLAzR5KaOTJsYZdxk7b1+fsmlSZx9RNdo5UVikKT4Rz4DrVZ/T9eqi+AnC6FOZAxdkIIIUps\nek/+vsnwD5kyJrfx6nFmjGXhct56gU/bmC640hs3ztQRCKFn0mMnjER67MyRpGaODNtj5+WI\n9dNEryh8WPzcSHuM2G0GOa4QomQs8CwrhBDCUBI0NBpe1BtWNPfizj5jxyOEyE8uxQohhCgx\nRzWX/4VuRbx1LhHHmkYPSH9q1y72LRs1bt4E1SKkL/26yF1RxMNMeuyEEEKUWE9/zr3Nz8cL\ntm+YRngsHaaaIiY9qVSJhCuEhxMezuVIEuK5cl73MuY2pw+x7GsGdKX1aDK0po5ViGLJGDth\nJDLGzhxJaubIsGPsko8S2IbbqXToS5eWeDmTEM2ejWw/imNdrv+Dm51BjmsEESupMZy2o5n9\nBs2qowK0HN3J289zpzN7FpF8hYUfMGUZk/9mZjNThytE0R6Bwu779owMo8ESjj2br315B0b8\niVtb4sPytUd+QcUJuDTjziEGBbH6PPFpD/RPVUhltl7hjgYX27LvRF8a+/DvTdIysSvZP/p6\n+QQAKezMk6Rmjgx+H7uYozw/jt/2o81z+ug8lKULqOxsqIMaQX0vIptzczPW+b8VWUn4lKfj\nCtY8DdCpEifbcPMnk8QoxH1Z4Fm2oJDRABc+Ldg+5xRAwl/cSs3XvnMNQMO3jBCaJYiYiocH\nqy6YOg4hhLGUa8y6vURfZPMGfviB3zYTEcvOFeZd1QFn42nxesGqDrB2pm0FNk3SvRwcSNwf\nRg5NiJJ7BAq78kNxUpN8kpi03MasJM7GoXYB+PVKvvUXnAOY1NyIIRrRr/sID8dWf3/Ka9OI\njyfdsCNOtJlxS2eMb9ughrdHuSo1Gw5/debpxPR7b5Ia/c/7Ywc1qh7g6e5do36rV2Z8G5Mz\nLCZiY0+n4vlUfdmguRRgqanpN6+7UiL3vftC/4bVAzzdPPwq1wwZMHbNvkiDJaE3mvgdM2bM\nmPPlAVMHoldegYQ8yZAh9AohwMPU0eiDjRVXThX91qXE3OUryVg7GiciIcrgEbgUC7Ty5WAU\n267SvZKu5eK7VPuQ6at5fxA1/kf4a7kru9uToCEmFU97C7wUW1r3/QQuvUHVuSw7y4ige++p\nzJditRnRL7VttuJEbN5Ge/fGG0/tbF1MVEkRa9s2f+5cckbeRvdafQ/v/76CrVXExp51BoQW\ndzhnn5HRF+eXLsKyXtSz1NT0nlf2y+TIja0aDLmYmpl3HZWVeuSC/V8NLX4+Y3FBGvFS7KIB\ntSduvOJWZXbkiVeMcDh5VmwZPRnIpmus/JuBTfK1r3mX/jMJWcWmASQcp0oLyr9L+BQTRSnE\nfTwCPXbApLoAX+T5U+zr3wCefxw/Zy58SGZOx0DifhI0uD6Gp33uytoMZr9MFV9sHQmqz6T5\nZOWvhpPO8MpgKldAbUeFKgx5lYuJ3ENWArPGU6cyDnb4V2fo64QnFL1mNQ9UKuI1uS2eDqhU\nLArPbRlbB5WK0Jx+i3vvvLUfKhWarNyW+OOMeBxvV1y9CBnO9WSqeeDdL18YxX0CQZ5UnQsw\nsgYqFTeS75V1We2b1iu7RKjc7fkFSxaMH9IaSIs/OrDnl8VsoX2120vnkjNUKlWXF95e8M28\nl3rXAeLD13UfsxFwrfrUuEJG9dEVphU6djJEFkWy1NT0nle2b/q+lF3VVek6et43C94d94Ra\npVK0GcvH9TialFHMnk1K0Zw/smvK0FYTN165/8rmokqV+/yYr1VrKW/HoKY068aEN3lvGhPG\n0LwK/T7EpxM/9SXqW7wbkaDlh+dNHasQxXo0euxi1uPVF+/+ucNdK7oQ50fyGaY24qNjnIyh\njifAoUG0WE2nX9nVG3L6q/rVYouW/j1wSmHlj8SkMXori3rodpVynOqtuZFMg8doGsSZo+w/\njp0/J45TzRUK9dhpk+lQnb+iqN2alnW4fpqd+7Epz/Z/6VChYORftmb8AbZeoYc/wJ19uLUB\naLCIY6Nzc4nSkJiCo839d97ajwM3cidPpJyianNuptIuhMoOhG4jxg/1FWye4NYv9/8EVi/j\nwo9M3cGIGbQuz7DncCz2zohl7LFT0puUL38mJcPOpfmV67udrVXAh40qzjoXD2y5EdvetWAP\nUFLklz5BbwP+PZaGrxuQ3fhhy4BZJ2KsrB2PRN8IcigYpDbjZv9a9bZEJTv7PXH81KrypXzY\nZRn7fiw1NcPklaW55uVVK12rOHj0iLy6zlYF8PuI+gPXXAQ6/3Tq9ydK94B2Q/fYhQ1r3mdD\neGpm7tVkC+mxq1+/YEtyDJejUBTcG9G1Or/8YpDjGsedcF6bxPItZOT89Wtlz6AJfPMBzmqu\nf8bIMCbM5on7XKAQwoQejR67cn1wteP2WrIv4qSc4kYyDd5DBWP6A3xyUrfmgqMAkxrn23yn\nHxePseQLvljM5YPY2fBTnns1DenFjWRmbuXYXpYuY+8xfnsHzVW6vFF0MHOC+SuKV5dzch/f\nLWb7XvavQHWbJ3qSWajI7v8iwMdHdC+PfwrgYsu5j8leV3OFqGQqjtdVVKXaOfBcL6JTWPg3\noZtYvoZzZ6gVR3xawdWK+wQGjmRwQ4BOAxkz5h5VXZml3F5/JiUD8Kj7pnPOoOY+o6plL3x1\nMq7wJvGntmcv1J3U4W7jwAm1AG1WyqzzRXSObn6955aoZJWV/Zxti0tb+pSZpaZmoLw0d/am\naxWgXKNxtjnFWLMXdLuN3ndb/5k8mKyU1AysbGxsbGws65Lo8eMFfy5GEhfO6BYkHKeNmU87\nc63F4t9JjuHvvWzZwl8HSUjkh9k4qwEqTuSPtVLViYfco1HYAU28ULK4mABwdAaKwpQ2AJVe\nw96GTZ/pVvsjEqC1T75tFy/BO+fKrHMDfBzRXNe9zEpg4xU8g5ncI3f9Jz+gsTcRiwrOt802\n+xCubZgzNPfe5S2GMLomSUeJKHRi9hmOqx2HP9G9nHcU+0Ber0vqeaKTAc7PRqvwwrCy7Dwr\ngbWXqTCa0Tk3ZLL1Y/27RcR8j0/AwDQ5s888GnnfbfRorBupHfnXrcKbaHNmcuTtilHlVBgX\nQ28WWP/O+UWDl4YD9V5eO7yqiz6iLhFLTc1Aedk61fv0008//fTTGW/UubtO6nXdHyEOFRz0\nE73+dFx7IiEhISEh4ebVjfdf29y51WDRfvydmNQ130gPM6V2o/ljBAfTpgXO8nwmYWYema/s\nmw3Yc52lF5lbjpn7Ad2lSSt76pfj0DriNTgncyMZ9464579U1KZ8vpdWec4+t34mU0vr1ws+\nYeaVGoy6yfkEvPOfb5IOE6/BtzbLluZrd7IC+CeGau75d6SiXQU27SM2DU97wqKo+j9GRDH9\nKNsjGR7E/FCAZ6uVZefRK8jIouOwfI2VxqKeSAH3+AQMTBMTk71gXz531KO9t1P2QvLlIkb1\nudduCnuAE5/sZP2Q7MaV805nLyRFJOVfXTv1qWlZiqJ2qvvL++30Gvt9WGpqBsrLxrHumDF1\n826laJPnzjiWvdy/b4D+MhBlY8XAQD75j5QS3ybzYZCQAODqhipn+R7c3IwQkRAP6JEp7Fq/\nDltYu4W5zdkbTbneudM8pzam91Z2RdLsB7K0NH+94Lb3uDmIJgIgyLVge21XgKsptM7fnnoW\n4MZiRi8uYm+RRfXwTWvPphX8GUWPNG6lMrk9/pVQf8jn+xkexIarONXHz7ksO08NB6jqlK9R\nZYNdoW+FHm+PUkoZd3SD4tWu6ruNVmpd90/mnSKGzLtUfqu5y1eHEjVXt78QPPZ036a+J7cv\nWXxcV20o+S9J3zw4acmlO0DTqcv8jXs2stTUDJ1XNm1GzMwhHZZdugNUf+arlyuZ+R3ULMN/\n8Vg74WFWT55wdwe4nUI5B93yPTwKQ9KF+XtkCjv3LnjYE/kF0TW4o2Fgnk6pDpNhKx/tYeRm\ngDcbFdz2Hv1TdpUBzhWaA3s+CcCv0OUh24oALTZw8MmSRt7wA6x+YM4hqmxBUXg6AGsXAlwJ\n/xhNR24k0XlGGXdu6wtQsAdFS3oW9vnbTHdzfpuc6yCauNypwdos3R/WNnlKh7tUVk4rV06o\n33tOmlYJWz4vbDmAc1XXpIt3AAfffL+U5eN+BqzVXt+NMfbDyy01NUPnBSRFhI7uO/j38Hig\nxlPvhC0dqfcsRLE0miIaM5PYuoQd1/AaVsS7D7OBAwFsbQCGDjVtLELoxSNT2AGtyrPlCos/\nBni7Xm67W3u8HTkxnYUpAM29i968SF79sHmR/fOgS772L88A1CjUb+/WFkc1F5dB/tprxUyO\n3Ob9j3EtdK87u8oEuPLfLOanovbUdc6NqsbUw+yfhlbhvZZl3Hn54Vi9y+5V0D638cYS0h+i\nITL2Xl7ZC6k3cnscNbd11xydKjsVsQ34dX7v301V3/zoqz2Hz2gdvNv1enZy333tn9wFeLf2\nurta+p2wGafjAJ/WcwKMfvHIUlMzaF7AP6tmDHjpf1HpWSoru/5Tlyx6q4/5XPazCPb2xb6l\nsmb+dONFoherVuUur1hhujiE0JtHqbB7sylbrjD9P6wdqJX/Pum9AlgSzgkVHj1Kdy9iG3dC\n/Pl9E3N2MynnJmGbp/P3TQJGU77w3cmteLYmX63j/Q2810vXdmkjY6ajbs5cNUBWItdisbLD\nP+fuJ+Nq8sbfrFRT8V3d426G9mLqYV76FSs7mnqXYud52fkT7M/mb1g+huGNADJu8nRRkyfu\nK9NQT56w8+wMq4D4YzfuNsbs112kq9TJp+jNwL/9sFXtczsPjk5rlb3Qq0budfOrWz7KUhSg\nzfQOGJ2lpmbQvH5996khn/4B2LrUnbvm12fb+uk1dlECzzxTdLtXAH3H0S3QqMEYQmYsf+zm\n7GWSUnlnKpcjCCzdnXSEMK1HqbBr+hasJ1NL5dcKju19I5gl4SgKrQvNG7ivVb9R7THe7MzP\nHWkaxJkjhB7BrjK75xa9/txt/FGX6b1Z2ZQ2zUm6zPrtKI5sXqublBC1kMA3cG5C4mHdJkNG\n88bfJGcwvqeupdKrqGdwOoGAt8l767L77ryAX7ZQvzUjm7H8CSo7sHsTrkNxWoxNiWdQqn0A\nPpnC9fpMnFJEj+ODcfR6por92EtpmXHhH0Wm9/aztULJXLz4HKBSWU2oVcSYmLS4rSF9PwbK\n1Zu65ssugDb9xntLzgG2zk1H+OT2GB36XDc8/416nvoNuyQsNTXD5XX+x1HZVZ2dW4vfj21u\n4/3QzYR9JJj1berua/fXDJ5EVIru5TtTeb8He1z4di3dZYKOMA+PUmHn0hIvB26nMrpfwbeq\nv4v6SzKyeLNBqXfr1JBz/zD5fTbsYslePPwYOIGZH1ClmNHctn78d5xp0/hlKz8swbcKjz/L\ntI9oUvwl4ArP4TKOxHRGVtW1WLtQ2ZXzcYwd9EA7d6zDqRO8OJ6doRxW03sC307H5VvdcL2S\n8HuFfuvZ9Dsf7+bFN/Ve2KGynT+0es/F4RnJp1q06zPiqcdiD/y4/Goi4NVkWmsXW+DHpoEv\nnY8Dum4KX9vW186tXcrJQSeS01WH+j6jvNzCV3Xgt+93xqcBzScvyHuDn4UX7wC2zs3qORUx\n8MvgLDW1EuRVILU1j5UgL0Uz4rVfsxfLNau1ad4Hm/Ics1Lw+JfaF7q/txClcu0ngsejdWHi\na1it49NTAD2f5uc5PF6fs1epUmienBAPn0fjyROiOAf2Y1WOFjVyW1JO4FSfTpvZFaLfQ5X9\nWbHp0aNaNF5zLt+dCOxcGq0/ubNDOXtgRaNKL56LA7ptPf9rO1/g2ub3GgyYq9Hm+277tHz5\n5I6PHXJ6LrM0Ea6edQDXwPdvnCzmbtIljLDMz4q10NTumxeFUrtvXslRS8pXG1/cEZt8cDDs\ntXrFvVt0kMZ6Vqzmzp+eviFYzJMnshKZ/DxrQ7mZVPQKifd8oOLDrI0vBxM5fo3a7mzrTvAf\nummwlzZQow/NvmX/6PvtQgjTe2RuUCyKNCCYNi3J+5zNBeMApheaGmw6VrY+3x069r83Rtav\n4uuoVnv4BPYaOenP07vulgiFVer5/uldy4b17BDk7622dw4IavHyewuP5yl9gNRYXY+PvUep\nnx+vL5aamiHySrv9p7HCF/f0Wlvm/ESUFY2b0qxZET/m62gMdT+ndqHRAlV6Uc+L/4oZXSPE\nQ0Z67B5toVPp/BH+jzHqcdzUHN7Kj7toPJZ/5uv9Fidl7rF7+Bmt78f4JDVzZNgeOzd7tHW4\ntA+v4qfHmim1Nd23s6kLkK/HDuhdhc2xZNzvDsZCPAQs8CwrSqHDh2z7lqoZfP0xb0/n0B2m\nzGf/lya8cZ0Q4qGWnEGvzyywqgM87Dn8fVFvaDl4CzcTzJ0XogwepckTokhdn6fr86YOQghh\nJlxtLfYPv9caM3kFb3Vk1qjcRiWD958gOplJ75guMiFKQS7FCiORS7HmSFIzR4a9FDu7MzPj\niTqISeaSG1RWAm1rciAa3xoExrH/FiMH89cmzicQ1I8Tq0z4cEUhSk4KO2EkUtiZI0nNHOm/\nsIuIyF1W0hnTlZP+TJ9Ao9p4F7rnZWVzvp1vVhKz3mbhj1yN17WUC2TEK8yaiK0F/tslLJIU\ndsJIpLAzR5KaOdJ/YVeqT8kyzimREcQm4epJgK+pQxGidGSMnRBCiHsaN87UERjFyk0Ed8XT\nDsCvMvK8OmGepMdOGIn02JkjSc0cGXaMnQVTqbBS06IzPXsSEkKzIFMHJERZSGEnjEQKO3Mk\nqZkjKezKaNKL7NnDkbNkPwHFuzohIfTsSXBn3PT9sEQhDEYKO2EkUtiZI0nNHBmwsLt8BocA\nfBx0L1MuM+tLTl6l8WM8OYRGxT/w2owk3uDPUPbsyS3yrOxo3YWQEN55NC5JCzMnhZ0wEins\nzJGkZo4MUtjdOsSg4ewMZ/Yx3moAkBpO5SbcStWtYGXHvJ2Mb6PPg5pc4nUWzGHWN8RrwFLm\nhQhLJ5MnhBBC3FP6dep15GYKjdpR30PX+NyT3Eql40tMH8r5fUx+l4kd6R1L5UI3QDEvSib/\nHSQ0lNBQ/gzjdiqAnSdt25s6MiFKRHrshJFIj505ktTMkf577Oa05M2/mRfKxJziRpuMkzuq\nQGJPY28DcP0X/Afw+AZ+f0JvxzWyT2cQGsqfe3X9c7butO1Ax4506kTrBlhb4FdFWCQp7ISR\nSGFnjiQ1c6T/wq6iC8lNiA/Nbbk6i4ApPLmJDT1zGys4k9mF27/p7bhGlv1l8KrLy8/SuROP\nNcLGAr8ewuLJpVghhBD3FK8hKP+8gdXrAd5tlq/RxZaI/caLSu+qeHHpNrdP8tmn/PM37drT\nrh0t60lfnTAvUtgJIYS4J00WHq75WhadR2VNXc98jVYqlExjxqVnF29x7TRhYfz5J2FhbP4Z\nRcHWncfa0q4d7drTrZWpQxTi/uRSrDASuRRrjiQ1c6T/S7Fu9nhO5dJU3cuMWzj54jGA6B/z\nrebjRHpL4nbp7bimFRtBWBh/hrJ0hcyKFWbEAs+yQggh9KmeJxHvczVJ9/L3l8nIotuYfOtc\n/4FbqTR82fjRGcT5o6xdy+rVrFylq+oq1DB1TEKUiPTYCSORHjtzJKmZI/332J36mHqTcWvM\ntLHYXOWtj0jN5FICgTnXZ09sJngA15M4HkM9z3vu6yEWcYLdu9m1i927uZYAYOVAmy6EhBAS\nQqMqpo5PiBKRwk4YiRR25khSM0cGuUHxzH68uzb3WuSQxfzwHEBWErXrcOEaWoVXf+bTfvo8\nqJHd/TJUrE1wCCEhdO+Ai9qkMQlRalLYCSORws4cSWrmyFCPFPt3B7/tJsWG5iE8kzONICsB\nOx/qteXt9xjYTs9HNLJOTxESQnAwDSqbOhQhyk4KO2EkUtiZI0nNHBnwWbFCiIeeBZ5lhRBC\nCL25sxdfX3x9TR2HECUi97ETQgghiqekExVl6iCEKCkp7IQQQojiOTfjwAFTByFESckYO2Ek\nMsbOHElq5kjG2AnxKLPAs6wQQgghxKNJCjshhBDinr7pjE9zUwchRInIGDthVFqt1sKuxmq1\nWkBRFMu7qCepmaPs1LL/a5EMe4n5j2Ws382tlPytWrbtReNuwOMKoT9S2AkjuXumsdRTjqXm\nhaRmhjQajalDMBQDDh/c/TbBn6Ataty5cwUmLTfIQYXQN5k8IYwke/IEYGF9JHf/D7KwvJDU\nzNPd1Cysa5ycKtyAhV1Vd65Z89ff1HHjsVp4zWfLUyRG8XpP/mrImR+wsbSPVFgkKeyEkcis\nWHMkqZkjy07NgIWdg5rqizg+EuDHDox3JGYLQFYiXuV54wDvNDTIcYXQKws8ywohhBCllpFF\nZX/dcouaxO/WXZa1duEJfz5734ShCVFyUtgJIYQQ4GTLmf90yx5d0WqIzplF4etA3A5TxSVE\nqUhhJ4QQQsBjPlx8ixU7ydDi+Ti21swMA1AyWX8FhyBTxydEiUhhJ4QQQsDyr7FVGN6VfVFY\nORHiz9c96dGXVoGcj+epD0wdnxAlIrc7EUIIIcD7cS6EMWcp3g4Aq7bQ/XG2r8fKlmcms7iH\nqeMTokRkVqwwEpkVa44kNXNk2akZalZsxi3e/Ii2E3m6cr72W9dw9sVBHrwrzIYUdsJIpLAz\nR5KaObLs1Ax4uxMnW1r/xo4Qg+xcCGOxwLOsEEIIUWqT2rH/VVIyTR2HEA9ExtgJIYQQMH0n\nVkOp34Np42haGxeHgitUrlzUZkI8XORSrDASuRRrjiQ1c2TZqRnwUqxaDZCVRXGnRTldCnMg\nPXZCCCEEjB5t6giE0APpsRNGIj125khSM0eWnZoBe+yEsAgWeJYVQgghhHg0yaVYIYQQIkdm\nLH/s5uxlklJ5ZyqXIwiUORPCnMilWGEkcinWHElq5siyUzPspdjdXzN4ElEpupeKwqha7HHh\n27V0DzDUQYXQKws8ywohhBCldu0ngsdz25aJU3mtjq6x59PcPMbj9bl0x6TBCVFSUtgJIYQQ\nMGAiWfb8d4l5H9C9oq6x30xOrIEkBv9s0uCEKCkp7IQQQgg4GkPdz6ntXrC9Si/qefHfXFPE\nJESpSWEnhBBCQEYWlQKLfivAkfRIowYjRFlJYSeEEEKAhz2Hvy/qDS0Hb+HWwdjxCFEmUtgJ\nIYQQ8Fpjolfw1lK0eW4WoWQwPYToZJ59x3SRCVEKcrsTYSRyuxNzJKmZI8tOzYC3O8lKoG1N\nDkTjW4PAOPbfYuRg/trE+QSC+nFiFbbyxAthBizwLCuEEEKUmrUbf53ng5exucn+WwDLVhLn\nwWtzObFaqjphLqTHThiJ9NiZI0nNHFl2akZ6VmxkBLFJuHoS4GvwYwmhV2Z1lg1dRb8eVPTG\nVo23H027MGsh6drcFQYFoVKRoDFgDL4ueHTV/25H1UKlIi5N/3suoLEPKhWarJKub4SPVAgh\nHhKKhuWfM3kNfpWpV5cAX54eysIN+UbdCfFwM5/CbtbTdBrCujCqNmLgUDo149YhpowhqCu3\nDV8PieJETMXDg1UXTB2HEEI8mIybtApgxER++Du3cf1KxvSm+UgytMVvKcRDxEwKu+gVvLMe\n97acjSbsD5Z/x88biIhl7iCu7KbT+6aOz3z8uo/wcH0OFtGmER+fr9/UALSZcUtnjG/boIa3\nR7kqNRsOf3Xm6cT0e2+SGv3P+2MHNaoe4OnuXaN+q1dmfBuAtQBZAAAgAElEQVRT6N/l4799\nPSS4VRU/73I+/s279fts7T8Gy6BYhkhtVKC3U1E0Rux0KENeabePzpwwtGmtwHJu7n4BtZ4Y\nOvH3/2LuvhuxsWeRSWXzqfqygRPKZaBv473Tf2hp4nfMmDFjzpcHTB2IPkzvyd83Gf4hO97M\nbbx6nBfacWQ5b+03XWQP7PBhEor5lkac5Ng540YjDMtMxth91Ix3DvPzBfpVLfiWvyvXEknQ\n4GrLoCBWnyc+DTc7Q0Xi60JaS+J26Hm3o2qx7AyxqXjY63nPD+i+H+mlN6g6l2VnGRF07z2V\neYydNiP6pbbNVpyIzdto795446mdrYuJKilibdvmz51Lzsjb6F6r7+H931ew1QWwY3rv3nMK\n/h67Tt7829RS362qzEOaDJKaoqng7pWYWUSpHZuUbFfKGMuWWlnyur6hbePhBfJSWTtM+unf\n90IqAREbe9YZEFrcEZ19RkZfnF+6II2WWgm+jfdNv3RBGnGM3aIBtSduvOJWZXbkiVeMcDjD\njrHzcsT6aaJXFD4sfm6kPUbsNoMc1whUKn69RO/AIt6a2pg50Wjk9suWw0x67C4lA9zJKOKt\n2TP58EOs8/wTps1g9stU8cXWkaD6TJpPVp7ita43KlW+FsDHOd/IuYRTjOlHRW9snajelKkL\ni+2Ej9yOuz0O1TgVr2vJSmDWeOpUxsEO/+oMfZ3whIJbhW+jbyfKueDsQfun2HGx2MSreaBS\nEZ9niJunAyoVi8JzW8bWQaUiNOd/y3sH0Nqv4Bi7+OOMeBxvV1y9CBnO9WSqeeDdL18YxX2k\nQZ5UnQswsgYqFTeSi03kAeyb1iv7PFq52/MLliwYP6Q1kBZ/dGDPL4vZQvtqt5fOJWeoVKou\nL7y94Jt5L/WuA8SHr+s+ZmP2GjH/ze7zv52Ae63HP5m/ZOHnM2o4qoGdnzx9MOk+vS96ZIjU\n0uL+SMzUqqzU4wox2qS+0ufFZ72y87LqPurtBUuXzHrnuQq21kpW6rzhve5kKYBr1acKZzSq\nj+7PiQodOxklM4P8yihB+g8dRXP+yK4pQ1tN3HjF1KHoT4KGRsOLesOK5l7c2WfseB7c/C/5\n/HM+/xzg9+90y3l/PpvL6ktQ4lHXwhyYSY/dnmF0+gGHaixeSP9O2BTzl2h291K/WmzR0r8H\nTims/JGYNEZvZVEP3Tp1vTl1m0xtvlrQx5n0Vrp+uMS/qdaR2xpadaFOBQ5t47+bNH+RgwtQ\n5e+xi95N7Z6klufgURp4AmiT6VCdv6Ko3ZqWdbh+mp37sSnP9n/pUEF3rDNLaDCG9CwatqGO\nNwf3cDmF+s4ciy2ix+7L1ow/wNYr9PAHuLMPtzYADRZxbLRunYouRGlITMHR5v4BtPbjwA3S\nMrGzBkg5RdXm3EylXQiVHQjdRowf6ivYPMGtX+7/ka5exoUfmbqDETNoXZ5hz+FoU9zvsIw9\ndkp6k/Llz6Rk2Lk0v3J9t7O1CviwUcVZ5+KBLTdi27sW7CZJivzSJ+htwL/H0vB1A7IbP2wZ\nMOtEjJW145HoG0EONh80rDj7fLyNfZV/rv0b5GAD3Dr4/aKd14H6Y159spxDqWIsYweJYVKL\nPf2Cf7Mf7T26xVz7tXTx6Cu10uelaJPdXX0yFcW/x3fh6/pnN15a06veiJ3AR2ejJ1R0LiK2\njJv9a9XbEpXs7PfE8VOryqtL99UyTmol+ZWVLX09p1YaYcOa99kQnpqnV9hCeuzc7KnwAWcm\nFfFWHS+uBXLHBKM1HoiDmrTM+6/WcyGbnjd8NMJIzKTHrsN39GtA6gWGdMHZmx7PMOsr9p8o\neqbSTj8uHmPJF3yxmMsHsbPhp6mlONZTfbmVyurj7NvO4uUci2RQNQ59w85r+Va7/Rf1Hiel\nHHuP6Ko6YE4wf0Xx6nJO7uO7xWzfy/4VqG7zRE8ys0NV6DyR9Czm7+Hfv1i5nnPXGFyVY7EU\nqf+LAB8f0b08/imAiy3nPiZ7f5orRCVTcbyuorp/APk914voFBb+Tegmlq/h3BlqxRFfaDJK\ncR/pwJEMbgjQaSBjxtyjqiuzlNvrz6RkAB5133TOqcX7jKqWvfDVybjCm8Sf2p69UHdS7kXV\ngRNqAdqslFnnEzLTLsy9kAB41ns/u6oDvFuOmDJlypQpU0pb1ZWZIVIDoneeBRy8eiva5Aun\njuw79O+tVKP+OV6GvFQqW3srFeBcrcrdRvd6AdkLnsVUbJtf77klKlllZT9n2+LSVnVlY6Bf\nWdnSN6GslNQMrGxsbGxsLOvWbj39Ofc2Px8v2L5hGuGxdCjNeeQhsXkbO3awYwfA+z/olgv8\n7DvK71LVWZSH7p+Moqls+PkYO3/i5eFUd+KPdUx5hcfq4+LHc1OJy38zjsVL8M7p93JugI8j\nmuslPVDKKfZEUm0K/evkNFnz5RxatWJvnoHMcQep14NYCD1Kk3K57bMP4dqGOUO5+6dyiyGM\nrknSUSISACLnE5lE03m8lPOvvJUTS/dgX0xJ5DMcVzsOf6J7Oe8o9oG8XpfU80QnA5yfjVbh\nhWElDSCvrATWXqbCaEY307XY+rH+3SLCeJCP9MFo4v7IXvBo5H230aOxR/ZC5F+3Cm+izZnJ\nkbe/QpVzGr4YejPt9voMRQHc6/ru+Pr15jUDPNy9ajTpPGXBZmNOezNEasDVjdcBxWZPu+qB\nDZq369axTVXfSkMnL04zVm5lyAuV+qtegcC570Yt33UiKV1z7fSeif3WAi4BAwaXdyy8xZ3z\niwYvDQfqvbx2eFUX/aZQHAP9ysqQvml1XHsiISEhISHh5tWN91/bjCz+mXJ2DGhAx6f54BMW\nfM3s9whuylMf4liXH0JMHV/pdepMly506UJwMN266pYL/LRuZC6FgCgh/XexGFDn/nTuD3D7\nEntC2bGVletZOpPfdhLxJ05q3Wptyufbyqo01yMi56NVGPpMvsZyfdjfJ/dleiT1uhCdApCa\np5c76TDxGnxrs2xpvs2drAD+iaGaO0d/A5jcO98Kah+C3Dl+u6iAVLSrwKZ9xKbhaU9YFFX/\nx4goph9leyTDg5gfCvBstZIGkFf0CjKy6DgsX2OlsagnFoziQT7SB6OJ0dXT9uVzL1Lbeztl\nLyRfLmJUn3vtprAHOPHJTtYPyW5cOe909kJSRFJGysns5Sub+vf+XtfLcv3Mwc/f6Bd2dmXY\nvN4F92gYhkgN2HnhDhB/es3RnK20GXfWfzHhVKzrkW/76z2LwsqQF/D0stBLtl3f/+nM2Cdb\njs1p9KjXf/3WBUV1CmmnPjUtS1HUTnV/eb+d3kK/HwP9yih1+sIwnBoTvpfnx/HbekLX5bZ3\nHsrSBQack2cEW7aYOgJhPGZS2Gk0qGxyb9LhVYVnqvDMSD67RnALQg8w7V/mNte9+yD38oiL\nAKjteq91Uk6jqsPOsXQbT5/B3NxJ9rWS1LMANxYzenERW0WmAlxPKXr/td2KKexgWns2reDP\nKHqkcSuVye3xr4T6Qz7fz/AgNlzFqT5+ziUNIK/UcICqTvkaVTbYFfpWmO5ZOhk5M2bUruq7\njVZqXR9JZlHzaVwqv9Xc5atDiZqr218IHnu6b1Pfk9uXLD6uOyUrmUpmamL2ctrtuKCQlycN\naZN8MezDDxbGZGQdXTR09ZTogd7G6CMxRGqgrI9JA+zd2qzcurRjDef//lg2YPi06PSssz+O\nXvfRk30Nf6G5DHkBMUfWrtp8KWdla21GFpAQvn3NhjPNRzQosPLNg5OWXLoDNJ26zN/OeF9O\nw/zKoJTpCwMq15h1e7l9mUPHib2DiyeNWhHgYeqwHlhWIpOfZ20oN5OKXiEx0bgBCQMyix5Y\nLY4O+I8s4h37SiwbCbD5TG5jGbqTsnIuU7l6AlxJudfKtuU5uo/O4xhTh/g9TA3Laa8I0GID\nilLEz6v1AKo4A4TfKbjP6OLvsdzwA6xUzDnE2U9QFJ4OwNqNAFfCP0ZzhRtJtJ5RigDyJeIL\nULCbQUt6oSFZpns0kY2zrsrU5Lngrs3SXVa2yXN+vUtl5bRy5YTsQUthy+e9OuHNxZvOOFfV\nFdMOvg7WtrqtnCsM/OeXT4b06f3C6//b+VlHQFG081cUP0lZrwyRGih7Tpw+d+7c6VMbezSo\nZGfv3vzJiStfrAkoStb8X68aNCNd5KXPKyPp33bBb5xNTFc71f1u1/G4uIRL/219JtBFmxk/\nf1z7z88VHEWwfNzPgLXa67sxNQ2SQzEM8ysrdfrC4LwCCXmSIUNoXYn9W/nnDOYwyfBeXmvL\nnJ+IsqJxU5o1K+JHWBCzKOysKO/I7V+4WajPCbh0CaBJQOl2mfcuX2kXc+8nUmE0KhXfb823\ncuJ+rKxo+KPupWN9gtwA5m3GxZa5TxCVAuDWFkc1F5cVPNaKmbz6KnfSAeo/AzA7/8AUJZ1/\ni+muA+wqE+DKf7OYvx+1p65zblQ1Uk6xfxpahfda6tYsSQB5lR+OlYrdq/I13lhSRGFnOvZe\nXtkLqTdyf/ua27o/Op0qOxWxDfh1fu/fTQt6tavn6qh2LucXMmrq5s91/3J5t/aytquYvezf\n98W7E6wr9dLNMo7ZZ6S7whoiNbDy8/Pz8/Mr7257d5OgIbWzF27vL2p8m76VIa+I3968qskE\nGr+/vH/LqjYqVflq7T5bMwJQtBnzJx7Ku3L6nbAZp+MAn9ZzAozYXYehfmWlS18YksKsF6lf\njahkgIjlBDRh4GCa16Lj+KLnn5mLZWdwbkzEBf7cw+7dRfwIC2IWhR3MfQKthuZ9OZG/AArf\nxtO/YmXLx01KuqvydgC7cu76pqQzvlduj51be+p5cuotfr/7jCyFV59DUZjauuCu7AL4cRhZ\nSQR/AIAVz9bk9jre35C7zqWNjJnO0oM4qwEqPE8lZ/6ZwKK9ObvP5M3O+R7GmpVIRARXo3Jb\nxtUk6SgrL1Bxou4uLUN7Abz0K1Z2NL07jrsEAeSL359gf258w/J/dS0ZN3m6qMkT91XU7XD1\nws6zc/ZC/LEbdxtj9utqr0qdfIrb0L/9sFVbD964FR995dyaryZb7dHVNL1quNrl3LMwKyVP\nCavVFb623rYYhSFSS735X1hYWFhY2Ik8XUqaGF2Xj523MW5/XYa84v7VzQr3bJx7zcvOq3H2\nQvLVfA+su7rloyxFAdpML/WtpB+QIX5llDJ9YUCLejPlW87G6oYRP/kaGXbMnMewJvz5JZ+e\nMHV8DyA5g16f4fWQ3QBfGIaZFHaDV/NqZ65spUEF6reiVx+eepKmNakTQnwmc3dTqcT3eZo5\nCJWKXvV4fgJvjqNFAIvDcclzLt+xAmc1vWvS6QleGk2rAJacpt4o+lYpYm9PLqaJN8dms/4y\nwNxt1HRnem9qNuPZsfQPoUZv0u35bW3uhIM/5qG24oW2NO/EyIHUq8jcA7xRJ3efUQsJDKTO\n47ktQ0YDJGcwqKeupdKrqK05nUClV3HIMySuJAHk9csWqroyshldn+K5QdSsTkpfnNTYlHia\nodoH4JMpzJheRKfgA3P0eqaKvQ0QF/5RZPYEQyVz8eJzgEplNaGWe+FN0uK2durUqVOnTs+8\nsjO7RZt+470l5wBb56YjfJzsPXo0c7YFrqyfcSvn1tN7Pvwoe6H2oMp6z6JIhkgt4cLM4ODg\n4ODgoW/lPKRByVzytm4eRZP+xkitDHmVa6n74+TEx7md2WdXfZe94FazRt6VD32um3nwRj1P\njMsQvzJKmb4woHd34dSA6GjKO6K5zKk4uq9gykSW/0N5R+bNM3V8D8DV1oQjaoSxKWZkzwpl\n8OOKfwXF3kaxd1aqN1BGvq4cupG7wsDqCijxafm2CnRTbH3ztXw/XWlYU3G0UUCxcVc+/0up\n46W4d8ldIfKAMuwJxcdDsbFTKtdTJs1TNFm6tyo451tTUZToXxVrK8W5kZKaqSiKormqvDVK\nqeqrqNVKQA2l92jl8M2CiZzcrDzVQfFwVuxdlOYhypZzyp5gBZTYVEVRlGv/U0BxbpJngyzF\nxVYB5Uxsblt1DwWUWccK7vzeAbTyVUBJy8xtSbuijHxK8fdQ3MsrI6YqaZmK2koJmFrSjzQr\nVenXWnFUK44eSnRywWDyyMzMTExMTC69zaNrZX9XPep1nTh12vCuutuGeTednr3CwlreNjY2\nNjY2wdvOJycnJyXerOdkC6hUNiGjJrw3ZWKPurqOkDYz/87eZO97LbJb3Gp0e+2dac89o3up\ndqx1Mb7UQSYmJiYlJT0MqSXcOuSltgZUVrbdh497b9qbz7T1z17BwbPTzcRSB1m21O6bV4HU\n4qP3+uRM0KnZbfDk96aNGdxJrVIBKpVq5r+ReXfe0sUOsHVuVtqoTJJaSb6NpUrfcKmVQewN\n3VxLtyqzjXC45OTkxMTEzMzMe/w780BsrJR2m3XLZ15RQNmbc34JDlDUnoY6rhHM6qQ4N1aS\n0k0dhzAGM3nyhEFouXoJ70DsH+H7CRzYj1U5WuTpEkg5gVN9Om1ml55v2lT2Z8WmR49q0XhN\n/iHkdi6N1p/c2aGcPbCiUaUXz8UB3bae/7WdL3Bt83sNBszV5L9/tU/Ll0/u+NjBSgUo2uS3\nezT8at+NvCtY2bhM+e3o5I6+pY6wzM+KNUBqp79/udXL32fm//9a7RT09d7QwdljQw2f2n3z\nKpzaxd+mth72eVJWvmv6KpWqx1tr177b425LlibC1bMO4Br4/o2Tb5Q2nXxBGiu1+/7KgBKm\nb9DUykBz509P3xAs5skTtja0/J2wEIC3GjLnOAlpuus53QLYk0CGWU1kiYjIXVbSGdOVk/5M\nn0Cj2ngXuiZT2UhXKoQRmMmlWIOwwr/aI13VAQOCadOSpDy3aVgwDmB6I1NFVJiVrc93h479\n742R9av4OqrVHj6BvUZO+vP0rrvn0cIq9Xz/9K5lw3p2CPL3Vts7BwS1ePm9hcfznEdVVk4f\nbzv+/UcT29Su4mKvdvbwaffkyFWhJ8tQ1T0IQ6RWe8T8k1sWD+7xmI+7s42Nvbd/7adHv7P7\n5P4yVHVlVoa8qvb+8MyBteMGBFev4GlnY+Pi4ftY8MCv1x8pUNakxm7KXrD3qG3YHIphiF8Z\nJU5fGFYFJ45NQ5NF1h0Wn6P8MF1Vlx7JwWjcu5g6vlIKDMz9qVKD7Ve4vpfn+9O8fr63sn+E\nBXmUe+wEhE6l80f4P8aox3FTc3grP+6i8Vj+ma/3ARll7rF7+Bmtg8T4JDVzZNmpGbDHbt1w\nnl6Bb21cb3Amns9OMKEum+Yw5WP+i+Gtv5nd/P47eXi8Upo+1C+/NFgcwtiksHvk7VjER4s5\neYaETALr8Mwopo3BVv/llxR25khSM0eWnZoBCzvgy7F8vJroDPpMZNUHWKt4tT6fnSDkNX6b\nw8P33F4hCpPCThiJFHbmSFIzR5admmELu2xKnruyn9qLdXVqFnsvGyEeNmbySDEhhBDCOPKW\nxHXamCwMPapd/JhUGzVu3gTVIqQv/brIXVEsgPTYCSORHjtzJKmZI8tOTc89dgkJAK5uqHKW\n78HNeDOQ9KxbN07u40YKgL0rHo4k3CYlE8DXF00SsYkALZ8jbKFccTZ38vsTQgjxqHJ3x92d\n2NTc5Xv8mK/Fo4jR0HkMf58jJYHIGyRrOLKd7pWpHExkHDEXmTWKv5cy/YipYxUPSnrshJFI\nj505ktTMkWWnpuceu0GDABYux0XNsGH3WXnFCr0d18jqexHZnJubdQ+lvCsrCZ/ydFzBmqcB\nOlXiZBtu/mSSGIW+SGEnjEQKO3MkqZkjy07NGJMnLI+dDZ23sqVrEW89VZVtkHoRYFFbXjpF\nRqyRoxP6ZYFnWSGEEKJEkjNNHYFR2Fhx5VTRb11KzF2+koy1o3EiEoYjhZ0QQohHlbs3fUfz\n8w7Stfdf2Xx19uP0a6wuNH5uzbscj6HzLICE48wPJ/Al40cn9EsuxQojkUux5khSM0eWnZqe\nL8U625KcAWDvQ99+DBxIz8cKDkSzAEmHqd6e6BSadqVNY9ztiY9m33b+uUyFzpzbStJSAl4i\ny4aD12jmbepwxQORwk4YiRR25khSM0eWnZqeC7vMO2z5lbVrWb+VO+kArgH0G8DAgXRpYlE3\ndbsTzmuTWL6FjCxdi5U9gybwzQc4q7n+GSPDmDCbJ4JMGqXQAynshJFIYWeOJDVzZNmpGWry\nhDaFPzawdi3rNhKTBuBdg/4DGDSINsXf3dfsZCTw70li7uDiScMmOMtDCiyQFHbCSKSwM0eS\nmjmy7NQMPitWSWfPRtasYd1vRKUA+DdkwAAGDaJJoAGPK4SeSGEnjEQKO3MkqZkjy07NeLc7\nUTLZu4W1a1mzhmvJAOZ1unxEHqohCpFuWCGEEKIQJYPkJOJiiUs3dShlkv2ojNsplHO4/2Mz\nzKtmFfckhZ0QQgiRQ8kkbCOrV/PzbzmD7WoyeghDhpg6slIaOBDA1gZg6FDTxiKMSS7FCiOR\nS7HmSFIzR5admgEvxf6znVWrWP0LkckA9j48M5ChQ+nezKKmxwpLJz12QgghHmEnw1i9mlWr\nuRALYO1Az2EMGcIz3bC1rD9EM2P5YzdnL5OUyjtTuRxBYGVTxyT0T3rshJFIj505ktTMkWWn\npuceu/oVOREJoFLRIoShQxnUl3J2etv/w2P31wyepJvnCygKo2qxx4Vv19I9wKSRCT2Twk4Y\niRR25khSM0eWnZqeCzuViqBWDBnCkMFU99Tbbh82136i2hC0Lowbh9U6Pj2FovDLO4ycQ7oD\nZ69SxdXUIQq9kcJOGIkUduZIUjNHlp2angu7vy/Qopre9vbQauPLwUSOX6O2O9u6E/yHbhrs\npQ3U6EOzb9k/2tQhCr2xwLOsEEIIUSKPQlUHHI2h7ufULnTTkyq9qOfFf3NNEZMwFCnshBBC\nCIuWkUWlwKLfCnAkPdKowQgDk8JOCCGEsGge9hz+vqg3tBy8hVsHY8cjDEkKOyGEEMKivdaY\n6BW8tRRtnlH1SgbTQ4hO5tl3TBeZ0D+ZPCGMRCZPmCNJzRxZdmrGe1asJclKoG1NDkTjW4PA\nOPbfYuRg/trE+QSC+nFiFbbykVoOCzzLCiGEECKXtRt/neeDl7G5yf5bAMtWEufBa3M5sVqq\nOgsjPXbCSLJ77AAL67TTarXZCxaWF5KaebL41Ozs7CwvtWxG6omMjCA2CVdPAnyNcThhdFLY\nCSPJyMjQaDSmjkIIIR5SBrzKvHITwV3xtMQnaohCpLATRnK3x87Chv7c/T/IwvJCUjNPj0Jq\nltdjl90ZacDCTqXCSk2LzvTsSUgIzYIMchTxcJDCThiJTJ4wR5KaOZLUzJFh54VMepE9ezhy\nVjcr1rs6ISH07ElwZ9xsDXJEYTpS2AkjkcLOHElq5khSM0fGmPCbeIM/Q9mzJ7fIs7KjdRdC\nQnhnnAGPK4xLCjthJFLYmSNJzRxJaubI2HdySbzOgjnM+oZ4DYBUAhbExtQBCCGEEMLwlEz+\nO0hoKKGh/BnG7VQAO0/atjd1ZEKfpLATQgghLNqnMwgN5c+9uv45W3fadqdjRzp1onUDrC2w\nB/RRJpdihZHIpVhzJKmZI0nNHBn2Umz2J+ZVl5efpXMnHmuEjQV+hiKbFHbCSKSwM0eSmjmS\n1MyRYQu7qt5cug3gVpG2bWnXnnbtaFlP+uosklyKFUIIISzaxVtcO01YGH/+SVgYm39GUbB1\n57G2tGtHu/Z0a2XqEIXeSI+dMBLpsTNHkpo5ktTMkVFnxcZGEBbGn6EsXSGzYi2P9NgJIYQQ\nj4zzR9m9m1272LNHV9VVqGHqmIQ+SWEnhBBCWLSIE7pibvduriUAWDnQpgvjQwgJoVEVU8cn\n9EkKOyGEEMKiBdbXLVSszXPPERJC9w64qE0akzAUKeyEEEIIi9axNyEhBAfToLKpQxEGJ4Wd\nEEIIYdF2/2rqCITxWOAURSGEEELc3529+Pri62vqOIQ+SY+dEEII8UhS0omKMnUQQs+ksBNC\nCCEeSc7NOHDA1EEIPZPCTgghhHgkWbvQsqWpgxB6JmPshBBCCCEshPTYCSGEEBbn+vVSrFyx\nosHiEMYmhZ0QQghhcSpVKsXK8qxYCyKFnRBCCGFxRo82dQTCNFSK1OnCKLKyslJTU62sLHBY\np1arValUKpXK1IHon6RmjiQ1c6TVah0cHKytrU0diDB70mMnhBBCWBwZY/eoksJOCCGEsDgy\nxu5RZRGF3bUv8J9A+SFE/1DEu1kJOHmR5UzSbVr58e9N0jKxe1S7uxv7lO4TGBTE6vPEp+Fm\nZ+DIhBBC6I+MsXtUWURhV2k85d7m5o/cXEh5x4LvHp+MJpPmcx7dYs6gIqbSaD5f/8OgaqYO\nRQghRI5Fi0wdgTANSxnJPr42wNxTRbw1eRPA3McBft1HeDi2j3CFp/dPQJtGfDzpWr3tsMiD\nZMYtnTG+bYMa3h7lqtRsOPzVmacT0++9SWr0P++PHdSoeoCnu3eN+q1emfFtTEa+IEcFejsV\nRWPcKxIWnFoBhsjUJAyUSNrtozMnDG1aK7Ccm7tfQK0nhk78/b8YgyVRNAOl9nB+Ie9LE79j\nxowZc760oCduZcayZS2fz2XmhwCXI0wdkDAIS5kVG7sJryfxCCZmc752bQrObmR5kXQdtamr\n2Jh0ytmaOIbSuu+l2EtvUHUuy84yIujeeyrzrFhtRvRLbZutOBGbt9HevfHGUztbFxNVUsTa\nts2fO5eckbfRvVbfw/u/r2BrBaBoKrh7JWYWUSXEJiXblXLKXZln6llwagX3Y4hMHzCkMqVm\noESSrm9o23h4gXVU1g6Tfvr3vZDSjJTKDvJhSu3h/EKWxKIBtSduvOJWZXbkiVeMcDiDz4rd\n/TWDJxGVonupKIyqxR4Xvl1L9wBDHVSYgqlrHX3xfBx/F2K3cD0pX3v4u6Rm8tg8XVXX2g+V\nCk1W7gorPqJVPVwccHCmYTu+2pRv84RTjOlHRW9snVobbd4AACAASURBVKjelKkLyfvHaFYC\ns8ZTpzIOdvhXZ+jrhCfk27xPVawdAWY8i5cTbxwCiNjDsCep6I1ajVt5OjzF+hPF5lXNA5WK\neE2eTB1QqVgUntsytg4qFaGRJYqq8CcQf5wRj+PtiqsXIcO5nkw1D7z75QtDm8Hsl6nii60j\nQfWZNJ8sBSDIk6pzAUbWQKXiRnKxiTyAfdN6ZZ9sKnd7fsGSBeOHtAbS4o8O7PllMVtoX+32\n0rnkDJVK1eWFtxd8M++l3nWA+PB13cdszF4jLe6PxEytyko9rhBjdudacGoFGCJTkzBQIp/1\nyl7HqvuotxcsXTLrnecq2ForWanzhve6k2Wkv70NlNrD+YW8F0Vz/siuKUNbTdx4xdSh6M+1\nnwgez21bJk7ltTq6xp5Pc/MYj9fn0h2TBif0zFJ67IDlXRixixfC+LZtbmOfqvx6icM3aeIN\n0NqPAzdypw58FMw72yhflx6tIIlNvxKrYdYR3m4MkPg31TpyW0OrLtSpwKFt/HeT5i9ycAEq\n0CbToTp/RVG7NS3rcP00O/djU57t/9KhQu7RN0Qxsy0fnefpYELepNNxAvqiUdHjSSp7cfMC\nv+8mC/ZG0tqniKS+bM34A2y9Qg9/gDv7cGsD0GARx3IGxlZ0IUpDYgqONvePqsAnkHKKqs25\nmUq7ECo7ELqNGD/UV7B5glu/QE6PXb9abNHSvwdOKaz8kZg0Rm9lUQ9WL+PCj0zdwYgZtC7P\nsOdwLHbUZhl77JT0JuXLn0nJsHNpfuX6bmdrFfBho4qzzsUDW27Etnct2JeQFPmlT9DbgH+P\npeHrBmQ3ftgyYNaJGCtrxyPRN4IcbGJPv+Df7Ed7j24x134tXTxFKWMvggWnVoBhMn2gkMqW\nmmESUbTJ7q4+mYri3+O78HX9s9e5tKZXvRE7gY/ORk+o6GymqQEP4xeyeGHDmvfZEJ6ap3/R\nQnrs2vhyMJHj16jtzrbuBP+hmwZ7aQM1+tDsW/bLTAvLYSk9dsAzn2GlYvWb3K1UlXT+uIZD\nVRp6FbWBwgc7cWnGlWMsX8zy1Vzei9qKT97Uvf9UX26lsvo4+7azeDnHIhlUjUPfsPMawJxg\n/ori1eWc3Md3i9m+l/0rUN3miZ5k5qmVlXQ+VxN5hu++pn8gM6eQlskPJ9iylm++Zd0O/vkE\nRcvkf4tOqv+LAB8f0b08/imAiy3nPtalqblCVDIVx+sqqhJGdddzvYhOYeHfhG5i+RrOnaFW\nHPFpBVfb6cfFYyz5gi8Wc/kgdjb8NBVg4EgGNwToNJAxY+5R1ZVZyu31Z1IyAI+6b2afbIA+\no3QTNb46GVd4k/hT27MX6k7qcLdx4IRagDYrZdb5BCB651nAwau3ok2+cOrIvkP/3krNKrwr\ng7Lg1AowUKbGZ6BEVCpbeysV4Fytyt113Ovpro55GmUMieF+Rw/hF/IeslJSM7CysbGxsXlI\n+xPL6GgMdT+ntnvB9iq9qOfFf3NNEZMwFAsq7BzrU78cd/ZzMecf/QszSM6gy2dYF/XnnTYF\nTRZqH2xyPgSXphz6hx1zAVJOsSeSalPon9NrjTVfzqFVK/bGAMw+hGsb5gzl7r5bDGF0TZKO\nEpHnrKNksehrnNW6l93eZdky+lfPXaFWP4BbqUUn5TMcVzsOf6J7Oe8o9oG8XpfU80QnA5yf\njVbhhWG6FUoYVbasBNZepsJoRjfTtdj6sf7dIsJYvARve92ycwN8HNGU5taXD0AT90f2gkcj\n77uNHo09shci/7pVeBNtzkyOvL91Vc534GLoTeDqxuuAYrOnXfXABs3bdevYpqpvpaGTF6cZ\ncWi+BadWgIEyNT5DJaJSf9UrEDj33ajlu04kpWuund4zsd9awCVgwODCM/0NwHC/o4fwC3kP\nHdeeSEhISEhIuHnVlFf89S8ji0qBRb8V4Eh6ZNFvCfNkEbc7uevTLnT5iSkH+ak7wLSfAD5p\nW/TKVk508mPXJmq2Y3Bv2jxG6xY0bKx7N3I+WoWhz+TbpFwf9vcBSDpMvAbf2ixbmm8FJyuA\nf2KolucPo+a5/1DyeH+ArBROn+XyZS5e4Pev75mSinYV2LSP2DQ87QmLour/GBHF9KNsj2R4\nEPNDAZ6tVuqogOgVZGTRcVi+xkpjUU8sGEWb8vleWhnveT6aGN3EQPvy9ncb7b2dsheSLxcx\nqs+9dlPYA5z4ZCfrh2Q3rpx3OnshKSIJ2HnhDhB/es3RnK20GXfWfzHhVKzrkW/76z2LIllw\nagUYKFPjM1wiTy8LvWTb9f2fzox9suXYnG096vVfv3WBcTqODJfaQ/iFfBR52HP4e+hS6A0t\nB2/h1tkEIQmDsaAeO6DdF9has/FVtKBksvEKTg2o5VHs+tv+48NXsDrPB28S3BYPZ7oM5PAt\ngLgIgNquRW+YehbgxmJGj87388kJgMj83W9575+XEs6I7ji6UqcxT/Rn7hLcOt4nqWntAf6M\nIjWcW6k83x7/11Bb8fl+gA1XcaqPn3OpowJSwwGqOuVrVNlgV6jcN90NYjLu6CbcqV3Vdxut\n1LrfaeadjMKbuFR+q7mLHXB1+wvBY6cuXDx/Qv8ms4/rzltKpgLK+pg0wN6tzbr9Z2Jjru9Z\nPdPH1ho4++PodTHF9J7qmwWnVoBhMjUBwyUSc2Ttqs2Xcnao+98tIXz7mg1n9J9GUQyW2sP4\nhXwUvdaY6BW8tRRt3pFCGUwPITqZZ98xXWRC/yyrsFOXp4MfKac4FcOVT0hMp/en3KN3ycaT\nd77gbBRXT7Nq0f/bu+/4qOk3DuCf3O4eUErL3nvvPZWCLNnIFhTZ+EPBgSDgABGQrVJAQIYK\nArIRkCEbZO9ZRtkt3b327vL7447OKx00N8Ln/eLFK02T3vMkueTJN8k36Psm9v2B+hURmQBP\nXwC4E2t9Rk0BAKj9F0TRyr8PK6aaOGUA9Rpi+d8Y/T3OXIdej5sXsWpmJklVmQKFgOnHcfU7\niCI6F4bSC4U9cXka9HfwIBr1JuckKgCaAABIey5uQkK6O2Ds98ZtlbulytSHJz8abDJaLiur\nUhyEkggKt1WrRplvWjqwfNaHo8YGb7niXtxSo7sEuADi3vOXrl27duni5laVC2p13rXajV71\nQRkAomicv+GupBklkXFqaUiTqR1IlEhi9OlGQR9djUpQu1VYuudceHjErbPbuxT1MBmezx/e\nePY1W9xQKNk6csQN8nX08RbU9cd3A1GwLCadBoABvVDaD5N2olRXfFUzs/nJmcirsAMwsysA\nfLwfU5YDwFe1Mpzy2UZ8+inWhQBAwbLoMQhLN2FSNSQ8xoUw5B8EQcCy7almiToMhQJVVsKr\nIVzVuPlL2r+54mt8+CEiM+jSM/YCzj5DiemYNhqVS0AlAECilZtXUtEWQWFPnP0W8w9D7Wtp\nnBtQArEXcXgCTCIm1rFMmd2o8vWFQsA/q1ONfLDYSmFnP7q8lgdf4h4kn9zrn1qu8rgVcbMy\nDxDYfOLpLQvbN6ro6ap2zxPYesD4rbMtey6/enkBRWBgYGBgYD7v5G4FS/UqZx54ejizNZJL\nZJxaGtJkagcSJRKycexdvQFAtUnLu9UprhKEfCUa/bC2HwDRlDh/9HHJEkom2TpyxA3ydaT0\nwr/XMWUYVI9hXuy/rEK4D/43A+fXvNad9suRvO6xA1DhG7jPw97R0DyCV0MUy+BaKgCImDoV\nAffQYdmL5ydEnAoDAH8XeDVGRV+cH4dNndCuhOW3Hw6EKGJ8PUCBd8tg3p+Y9Bcmtrf8vVub\nMfhLqGthhpWzWwAQVBAExF6D+KINLPEJhnUCAKSopYxRuBcGhRaFXnSbMrwMPjqGVWoU+MLy\nIEjv9hh/EkM3QKFFjaR7+LIZlbYQggph649YPhh9qwJA4mN0tvbwRKas9T6aK7S+zYHVAJ6f\neZA08tlhy+Wegs2s9REDACjUuM/qxsm3D56aUNc80L60Z9zjsyeuRADwqVi7oo+lEwf9M0vj\nhNZPB5uQcWppSJGpJIFmRqJEwk9b+gT2rZZ834g2r+V+35i7N4CWuRL/S0iUmmNukK8ppTvG\nz8P4eQgNQVg0PH1ROMDeMZEkZNdiJ2jRtRji7yBSj3emvWzKPB3RLBAPfkXRGug1EO8PQKUA\nrLuF+v9DMS8A2LUC7mp0KINmbTF0EOoWxuJLqDgAnYoBwIwdKOONLzugTE28OwTdWqN0ByTo\nsHFdhs8WuJRBA388+BmNu+KLL/F+HxQqivMVoFUhZCJm/2yZ7OHPKFoU5d9KnrHXIACISUTP\nNpYxBT+EWolLESj4IVJ26JXdqP7YhuKe6F8TLTtiYE+UKYnYTnBTQ+WRhWUNAFD7A8B3n2Hy\nlxk2Vb4C17xdiulUAMIvfxNqfgpPNAQHXwMgCIpRZdM9vQ/Eh29v1qxZs2bNuozYbR5jSngw\ncfE1ABr3Gv383SJufB0UFBQUFNR73D7LPKJh8SeWe7urdyuS61lYJePU0pAiU5sFn5JEieSp\nYzk3Oz8t+UnMq6uXmge8ypSWLKFkEqXmmBvk6y6wCCpWYFUnYzLqoDjJvTkoNAoA7kdZLlwm\nSdM9b+JTTPwE63bg9gModChVGd3exyf9LBdJATw4inFfYedBPItFgVLoNhBfjUTSq3IS7mHC\nBPyxHXefIqAYqjXGhG8sPSGbmbtHTvk+Lv0djBqJ9f8gSokq1dFpCD7qjC86Y+YmeFXCg5MA\ncH8GCn4E9+qIOvniD5ng6YKoBFwJQ+kX5/SlfHE9HN+ewSeVU+X48qjSLAEA+rv4YCR270OU\nGh3ex09fwkODgM8QMgXI4JVixbwR6gp9KACY4tGjObacANxx6x4y7pohx68U2zeqRpvgywB8\nKrbs17F+2JGVy3fdAOBX48vb+z8GsLJG0aHXwwG03HJ5XcMA0RRTN3/B8zEJgqAK6j+sdoBw\nZOOyHRfCATT4+tjO0RUMsRdLBNZ9mmgUFJo3er9fr6jrhT2r1/57F4CLb7OQkE1u2XzsN8ed\npso4NakzfcV4kNPUMk0kTS5r63tmmkhi9OkyhRo/SjACKPPGO53qlwy7dmDJ6r2JoigIwlen\n7o8u5eUIqeVgHTnsBpkpfeR+34DWkE0HxfQ6kWNhR1l35DAUeVA7RZNA7Hm4VUKzrdjTOnc/\nKufvik14NKB2tbWpbyHXelRdf2F3kzw6ACuqFvzgWjiAN7Zf39AoAMC9rRMrd5+hN6Xatv3r\nDLuwa5qLQgBwadmwusOWGVJv/Gq3UgsO7nsnmwdRvMq7YuWbWtq/I0GmrxpSzl6omlkiSJdL\nVhK5uXF8vT6zo42pbmkQBKHVuHXrvmjlIKnlbB055gaZKbkVdsYofPoe1u3D4wy6CoqKkuRz\nyR5kdymWsqV7EBrUQXSKvgwWDgeAL6vaK6L0FBr/pcfPfP9R/0rFAlzVah//ou37f7z/0p6k\n42h6BdtMurTnlz5tmpQq5KfWuRcuVXvYxJ/PpTjYlOs3/8K24Hda1ff3dlepdH6FynUe9Pk/\nFw7n4EjzKmScWhpSZGoXEiVSvMNXV46sG949qGR+X61K5eETUD+ox4L1/+WgqssxiVJzzA3y\ntfO/hpj+Gx4qUK0Gata08o9khC12r7d949H8GxSqjwFvwUuNk9uxcg+qDcGJ+bnexUmOW+wc\nn81aEWyPqTkjpuaMpG2x89LBVB63DiEvH1iRPxZ2r71di/BNMC5cQYQBRcujywBMGJx8H2Hu\nYWHnjJiaM2Jqzkjawk6lRPd/sLKxJH+cHIzsujuh7Gr5Hlq+Z+8giIhIMp4aO/YzTzYmw+YT\nIiIiSja2HjaORoyVV8OR/PBSLNkIL8U6I6bmjJiaM8r9S7EhIcnDYgIGt8SFQvhyFKqWg1+6\nnkqLsE9B+WBhRzbCws4ZMTVnxNScUe4XdtlaSqwEZIT32BEREcnO8OH2joDsgy12ZCNssXNG\nTM0ZMTVnxDdPUG5hix0REZF83b4Cl8Lwd7H8GHsb387FhbuoVh/teqGq30tnJufDFjuyEbbY\nOSOm5oyYmjOSpMXuyXH07IvdlzH1DMZVBoC4yyhSHU/iLBMotJi1GyMb5OaHkr3J8ChLRET0\nuku4j4pNsfsyqjZCJR/LyIHt8CQOTYdi7yEEf488CoxuihC+KFZW2GJHNsIWO2fE1JwRU3NG\nud9iN70Oxh7DrH0Y/eKFE6YYuHlDKIqwS9CpAOD+HyjUHW/9hU1tc+1zyd5keJQlIiJ63f1w\nEV6Nk6s6APfnIN6AlrMtVR2AAl2RzxWHF9klQJIICzsiIiLZea5H0dQ9nqxZDwBf1Ew10kOD\nyMO2i4qkx8KOiIhIdvRG+HimGrPoOgQlKvimGqkQIBpsGRdJjYUdERGR7Lipcft48o+JT3A7\nEn7d4Zq6m7Pn8XCvauPQSFIs7IiIiGSnoi9CJuFutOXHTcOQaMQbg1NNc/9XPIlDlWG2j46k\nw8KOiIhIdhaNAoyo3ASzgjF3InqvB4CvUjTOnd+KOkMgipjXzF4xkhT45gkiIiLZKT8OU07g\ni3X433uWMb2CUdQTAIzRKFceN+7BJOLD31HR9yV/hpwO+7EjG2E/ds6IqTkjpuaMpHpX7Old\n2PgPYlWo1Rpd6lpGGiOg9UfFhvhkIno0yuVPJHtjYUc2wsLOGTE1Z8TUnJFUhR29fmR4lCUi\nIiJ6PbGwIyIiIpIJFnZEREREMsHCjoiIiEgmWNgRERERyQQLOyIiIiKZYGFHREREJBN88wTZ\nlMlkkllXdiaTCYAoivLrW4upOSOm5ozMqZn/lx92zmdj7KCYbCQxMVGv19s7CiIisil2vGxj\nbLEjG0lqqJPZ2XbSqZHM8gJTc05MzRklpSbLCxpkYyzsyKZkttsCIAiCXF9zxNScEVNzRkmp\n2TuQXKZQKFjb2Z7cjrJEREREry0WdkREREQywcKOiIiISCZY2BERERHJBAs7IiIiIplgYUdE\nREQkEyzsiIiIiGSChR0RERGRTLCwIyIiIpIJFnZEREREMsHCjoiIiOTiyTn8thonrkC0dyR2\nwsKOiIiInJSIbz9ApRJ4GAMAIctRuDp6vINaZdF0JAyvY3HHwo6IiIic06IO+OwnXA2DQgCA\ndv9DohZfz0Kf6tg/FzPP2zs+OxBE8XWsZ8n2jEZjXFycQiHDcwmTySQIgiAI9g4k9zE1Z8TU\nnJFcUzOZTC4uLkqlUqoPyO+O6BK4dxzeGuhvw60E3lyLrW8DIvzdoeiOB0uk+mhHJcOjLBER\nEb0WnsWh+lR4awAgZCaMJoyvBwAQUD0vnm20a3D2wcKOiIiInJMgJD8ksXgfBAGVfC0/GkSI\nBjuFZU8s7IiIiMg55XfDmQnQG2GMRPA15OsDDw0AJITi6CN4t7B3fHbAwo6IiIic0w8dEHUC\nxSqhQhGExeHTsQCwZTpqVUZUAgZ+au/47ICFHRERETmnTssx5wMoHuBGIrp+juHlAWDXcpx9\nhtb/w5Qa9o7PDvhULNkIn4p1RkzNGTE1ZyTX1CR/KjaJCCQtvIsHoSyJMv6Sf6hDUtk7ACIi\nIqJXk7IkLt/AbmE4ABZ2RERE5JzKlcvwVyo1vPxQqixad0LXFpBbY2iGeCmWbISXYp0RU3NG\nTM0ZyTU1yS/FvvEGLhzCg1gA0HnCxxURTxFrAICAAOijERYFAHUG4sDPUMvwAJTea5Fk9uxb\nja6tUMAPGjX8AlGjBb79GQmm5Al6loIgIEL/Sp/SuggEAVEJaYelVs0fggC9MavT50qyRERE\nUggegGd6NB+MY9cQG4HQB4jR47+deLMIigQhNBzPbuLbATi2BF/+Z+9YbYSFXWrfdkazXvjz\nAIpXRY/eaFYTT47js8Eo1RJP4+0dnEMKGQ8fH6y+Ye84iIjo9dN2JNzfwM6FqFXyxcVWBaq9\nga3ncW0Nem2AbzF8sgRNArFoun0jtRneY5fCoxX4fD28G+L4FpTwsIwUDZjVF2NWo9kknPvW\nrvHlhg2HEG+AJvdaxU3xeP48VYsmERGRbVx9juZjoEx3CVvpjob5seVjoDMAvFMUQ/+2fXR2\nwRa7FBbPhijip1+SqzoAggr/W4WCHjg/FZE2uVoqqSIlUKaM091DajKEL5k8smHl0n4+eYqV\nqdL3w68vZXblOu7RiUlDelYtWdjX2690pbojJv/0LDFV9TmgqJ+bNXrb3nQq19SkyAtAbOih\nL97vVqVkYV8vn8AiZVp3H7L2UKhkSViX66mFbG5jdX2Z+RcfJnFCybjWUspKamaJMRe2vxDq\nDGe5+ue7Jk+ePH3uEXsHkhtUCty5aP1Xt6KSh+/EQOlqm4jsjg9PpPBeOQRfRvBlDCyT9lcr\n5+J2JEaPhZsaPUthzXWEReGncfjpT9yPQJES6PgBpg5NddJgjMB3X2DFRtx6iLyF0KQDxk9A\nWS/Lb1sXwfY7iNTDQ5NqOI0SPrj5HOHx8NZaxvi6IDweP1/Ce2UtY4aUx4+XsPc+mgRm/rn1\nAnHkAeIN0L5otHt+DqM+wdYD0GvQoA2CF6JxQUS2xJM/AGSSbClfXA9PjjY0GgFuGS3dHD88\nYUp8NLRhzRXnw1KO1HlX23xxdz0vrdVZokPWNaw18FpMYsqR3mU7nTy8LL9GAQCiPr933iiD\nlV1wWHSMNpuFb47vepZrapLkBcSEbq5budfNuFQvfxQU6v4LD8/rnfGTcRkF6TCphWxuU777\nvow+0d2//6Ob87MXpMOkBvmutZQWvlXqo72WUnVpyJNueXNSQNjy4YlF3cuN3nzHq9jU0PMj\npP4syR+eaFcUW+5h1TH0qJ5q/Nov0O1rtF6NLd0RcQ7FaiPfF7j8mVRhOBIWdins7YNmv8Kl\nBIJ/RrdmUGXwBTPXOl3LYpsJ3VrBLRarVuJZPAZtx6JWlmlMMWhSEv8+RLl6qFMe9y9h92Go\n8mHnaTTJD2S5sJtbDyOPYPsdtCoEAJGH4NUAACovwplBlmkKeOChHlGxcFVl/rlpCrvYiyhe\nC4/j0Kg1irhg3w48C4T6DlRtUxV2GSW75hfcWInxu9BvMurlQ5+BcM3w4n6OC7t/P63Tas55\nAEXeeO+THtUv7Vk+Z+VhAHmrTgo5+JG1OUzvlQ5YdT9aEITm743rUt3/3LZFCzZeBFCi2+qz\nS9sDiA/bnKdQd0GhHjZ0cJqZv546LaM1n5Ec75HlmpoUeQGYUbfwhHPPABRrOWhklxph57dM\nnb8lURSV6jz77t2o5q520tTCL/48dVnau1Rj7u9Yuv4agJLdl51Z0sVJU4N811qSpye/KtI4\n+S4dhy7sRP31UweXzPxs9vpzAGRS2EWfRMnGeBSLGi3RoBq8dXj+CId24sRt5G+Oa9sRvQSF\nh8KowtF7qOknVRgORaQkpkSxa2UREAFRm0d8s7P4zVzx0DnRaEo1WY+SIiD6Nhcfx1nGRJ0R\ntSrRo2byNFMbioD44XIxadajv4papeheTUw0iaIoBhUWATFSn3Y4jYe/iIDYbIPlx387i4Do\noRFdSlr+cnyIqBDEQmOy+rl1A0RAjDe8yKWECIiLjlt+1N8Xa/iJgJi3S1aTvTlGBMRfrma6\ndA0GQ1RUVEx2RYeXcVUD0HrUehQZbR73aSlv89a77UFY+jkeXZtq/m2hVkuSRn5aMQ8AhdL1\n9NOImJiYuyd6AdD5vJHteKyJioqKjo7O9mxyTU2avCLDrmgUAgAXn1bhLyJa06W4ecbmv110\n3tSsxPb8Vuv8bgDcA9veep7tb43jpCb7tRYd+egtP1dBEGq4W07Ll4Y8yW5SZjncjWTZ9k7l\nXVSpzqu9ik2V7uOSREVFGQyGTA8QryTikjiwrahWWg7fgKjQib3GiVEJoiiK92aJLTuJmzI/\nSMkG77FLQVDh9zPY/RuG9UVJN/z9Jz4bgfqV4BGIgeMRnrrLj+DF8NNZht0rw98V+vvJv516\nHJ4NML138t1stXthUBlEn0JIRDZC8u8LTy1Ofmf5cdYp6IpiTAXEXcejGAC4PhUmEe/3ycnn\nGiOw7jbyD8KgmpYxmkCs/8JKGC9PVkqxT9dfiU0E4FNhrPuLK91vDyhhHph3ITz9LM8v7jQP\nVPi4SdLIHqPKAjAZY7+9HgHg0e6rAFzydhBNMTcu/nfo+OkncVnuAiaXyDU1ifLSRx5MMIkA\n8lQdrnmxedd83/JnHx16mvuZpCNRaultHdNm28MYQaGbviM4n0163uJaSynra+3s3C5bnsQW\nbvfTexnfheIgjLFxiVCoVCqVSvq3e9mYZ1kEb0LMMxw7iG3b8O9RRETh16kwtwcXGI2/16Ft\nKXtHaTt8Kjad5t3QvBsAPL2FvfuwaztWrceSr7FxN0L2w+3FhYMG+VLNpUjRfh59Es/1CCiH\nX5akmsZNAQAnnqGEd5ajEdAoP7YcQlg8fHU48BDFv0e/h/jyFHaGom8pzN8HAO+WyMnnPlqB\nRCOa9kk1suAQqEenjeIlyUpMH255jsmnanITuk81H/NA6L9PUC9/mllML25eThml8GKHfnPf\nY1TKc3fzfQCiam+jkmNPPYoFoFB7dhgyJfjrQTpbnezINTWJ8tK4VZw5cyYA7zLlk6aJu2/p\nhMglv0uuJZAxiVJLM0vk9UXvLLkMoOKwdX2Le8AmuNZSyuJaS4g68vakQypd0TXB3c40GCdF\n8Lmo6brz5oJUH7nfN6C1naORgtoLterbOwiHwMIuBb0egiq5K5C8xdClGLr0xw/3EFQb+45g\nwmnMqGX57Ut6DIm7CgAPgjEo2MpvQ+OyF9WExtiyAvsfolU8nsTh08YoVBDqrzD7MPqWwl93\n4VYJge45+dy4ywBQPPWJpqCCNt1WkYvdo2ST/tkz84Auny5ppM7PEnPM7Zj0s3iXqwHsBXD+\nu91Y38s8ctWsS+aB6JBoALtvRAJ4fmntqRdzmRIj188ZdTHM87+fuuV6FlbJNTWJ8lK5Vhg8\nuELKuURTzIzJZ8zD3ToVzr0MMiRRaqmZxnecrpZM0gAAIABJREFUYBRFtVuFPyY1yr3YM8G1\nllIW19ry3v0eJRjbzF9f2U19RpLYiXKCl2KTmODqgkL9rfxGVxC/9AeArVeSR76k0UpTAABq\n/wVRtPLvw4rZi6vKFCgETD+Oq99BFNG5MJReKOyJy9Ogv4MH0ag3OYefqwkAgLT7NRMS0l25\ns1/3KImRlqfS1J7JN1kr1JazbUNkYvpZPIqMq+WhBXB35/tBQ8b/HDx/VLfqU89Zdu6iQQTE\n9c/iAei8Gvx5+ErYs/t713ztr1ECuLpy0J/Psll555RcU5Mmr7RMic++6lHnl1uRAEp2mTes\noHuuJmGdDVJ7fPTjxbciAdQY/0shre1OqLjWUspKas9OTxu1655nsX6r+pWWNH7KhDEaH3dD\nUT+4uFj/9/phi10SBfK54vEfePwz8qXbFG7dAoDqWTu/9GoIVzVu/gK0SzV+xdf47ykmTYNn\nuqdfX0JbBIU9cfZbzI+D2tfSODegBMafxOEJMImYWCeHn5uvLxRf4J/VQOPkkQ8WWyns7Efl\nbtlE9SnucTQZLfe4qDytPFInKNxWrRpVqcP0eJN4YPmsA8sBwL24Z/TNSAAuAS6AuPf8JQAq\n17z5vDUAarUbveqDlS3mXBRF4/wNdzsNtMWeWq6pSZNXKtEh+wZ1emfT5ecASnf8/MCS/rme\nhVU2SG358N8BKNV5lw5O1+mSlLjWUso0NdEUM6LTDEFQf/3XVLWzdQsqNx81wg+noc2H2vVg\nw3MhR8YWuxRmtIVJj1qdcD71Lb2Xd6DzBig0mFY9gznTUODdMnj6Jyb9lTzu1mYM/hJLjiLT\nx/uNUQgJwd2HyWOGl0H0Kay6gQKjLV3l9W4PAEM3QKFFjaQbR7L5udpCCCqEBz9i+WnLmMTH\n6Gzt4YlMWes1LVfo8uY1D8Q9SG5t0j+1XApxK2L9huXA5hNPb1nYvlFFT1e1e57A1gPGb51t\neUDEr15eQBEYGBgYGGgufcxK9bJ0qfX08JNcz8IquaYmTV7JTqyeXKVqu02XnwsKbfcJv55Y\n+Zl7+k7npSF1agmRByZfCgfgX296YdseorjW0nh5ajf/6LPxUYxboU7aw5tWrly5cuXKwy+6\nr/937W9/bAqRKhlKb8kluFfF3RDs34O//7by7/XDFrsU3lmDE08wazsq50eFmigWAIUBd6/i\n1DVAiZn7kPULBzN24O8K+LIDVtVAg1qIvo31OyG6Yuu6zJ88ePgzin4E9+qIOmkZ02sQPjqG\nmESMbGMZU/BDqCfjUgQKfwKXFCsxu5/7xzZUqof+NbG8LYq44J8t8OwNt2CosnzLttofAL77\nDPcrYfRn2WuMzAKtb3NgNYDnZx4kjXx22HJNpGAz/4xmLNS4z+rGyc+FnJpQ1zzQvrRn3OOz\nJ65EAPCpWLuij6V7Uv0zyxm81k8Hm5BralLklTRywxcde838G4DGo8KMtRvebRiYq7FnQtLU\nANzd9o1RFAE0+LIJbItrLb2XpBb5dyiA6Du/vf/+b2nmWjxm+PrSv3RtVySXwqeXMsUhKgHv\nzIGt9ttOgS12qc3cjb0r0DMIESH4ezN27EWkDv3+h2N3MTo7j9toAnH2HMYNgCEUvy7G0Zt4\n610cu4mmATmJKv9AS9/F/S39P0HpgSKeADCk5yt9rmt5XDyPfu1wdT/+3IPGo3B0LhKMltv1\nsiJwBLrWw71NmDYH8YbMp88m17xdiulUAMIvf2N5V49oCA6+BkAQFKPKWnm+OD58e7NmzZo1\na9ZlxG7zGFPCg4mLrwHQuNfo5+8WceProKCgoKCg3uNedPcvGhZ/YnnYoHo3G+2R5ZqaFHmZ\nR15fOcBcH2i9am8+t8/G9QGkTM3s+GzL7fkfVfSVMA1ruNZSytZaI3syxgCAyQle42ZLfPPE\n6+3IYSjyoHaK+65iz8OtEpptxZ5cfh4+x2+e2DeqRpvgywB8Krbs17F+2JGVy3fdAOBX48vb\n+z8GsLJG0aHXwwG03HJ5XcMA0RRTN3/B8zEJgqAK6j+sdoBwZOOyHRfCATT4+tjO0RUMsRdL\nBNZ9mmgUFJo3er9fr6jrhT2r1/57F4CLb7OQkE1u2ezPJcddxss1tUzzSpPa2vqeL88LAER9\ng/z5T0cnAAhs0bdrRZ+Un1gwaOTQxmk7rXCa1F5ont/3aJRe414z/FGGbxizY2rZ3RoBp1lr\nOUkttRVVC35wLRwO/uYJACm6O5HJmyfq5sd5fzw8kfltTq8NFnavtyJeCFUg/HHyV2JGU3y0\nD/tC0ThHjYsZy/m7YhMeDahdbe21VF25aj2qrr+wu0keHVLsUt/Yfn1DowAA97ZOrNx9ht6U\natv2rzPswq5pLgoBwKVlw+oOW2ZIvfGr3UotOLjvnVJeyKacvytWpqllmlf61DLNK+bh4nwl\nRmb0idWnHD3wv+w9b+44qZkZ9SGevuUBeBad9OCC1fdcZTlIaVLLwdboLGstB6mlwcIuI5IX\ndrGX0LIF7pbApJGoXA4+6Z59LFFCqo92VLwU+3pbPgKmCFRshknf4ofv0aclPt6P6kPRKJer\nuleh0PgvPX7m+4/6VyoW4KpW+/gXbd//4/2X9iQdR9Mr2GbSpT2/9GnTpFQhP7XOvXCp2sMm\n/nwuxR65XL/5F7YFv9Oqvr+3u0ql8ytUrvOgz/+5cDgHpc+rkGtqUuQV/3S/rcJ/GSlSM4sL\n22Ie0PmUkzaHDHCtpZTFtUb251Yehx/g3r8Y2A21KqFkybT/Xj9ssXvt7VqEb4Jx4QoiDCha\nHl0GYMJgaHK/4s9xi53js9mptu0xNWfE1JyRXFOTvMVuRGaNjnPnSvXRjoqFHdkICztnxNSc\nEVNzRnJNTfLCjtJhdydERETkPCIiAMDTC8KL4ZfwsukNNo6AhR0RERE5D29vAHgaizwuluGX\neP0uS7KwIyIiIufRowcAaFQA0Lu3fWNxQLzHjmyE99g5I6bmjJiaM5JrarzHzvZkeJQlIiIi\nej2xsCMiIiJn8+wWdm7Bjn/wIM7Kb+OjcHYPapeyeVj2x8KOiIiInIiIsW/DvwRatUVQcxT0\nwZhlAHDpTzSuCi83KBVw8USVFjh+3d6h2gEfniAiIiLn8VtPTN8AQYmGLeHvgosHMbM/ShbC\n2J6ITkCBEijqikQT8uRD1Yb2jtUOWNgRERGR8/h4KwQldt5Ey8IAABEjq2BoCwgCNp5H+wp2\nDs/eeCmWiIiInMejWPj3f1HVARAwaSoA5B/Mqg4s7IiIiMiZJJrgWT/VGK+mAODVwB7ROBwW\ndkREROQ8RBEK11RjLD/y7jKAhR0RERGRbLCwIyIiIpIJFnZEREREMsF3xZKN8F2xzoipOSOm\n5ozkmpok74oVBOiKo6JvqpEnTlgZCeD48dz8aGfAwo5shIWdM2JqzoipOSO5piZVYZd1r1+R\nw0dIiIiIyHncu2fvCBwaCzsiIiJyHgUK2DsChybD62JERERErycWdkREREQywcKOiIiISCZY\n2BERERHJBAs7IiIiIplgYUdEREQkE+zuhGxHjI02iiaZ9VFsEhSi0ShAlFleYGrOySQIprgI\nWaYmKtWioJVlanLdIE0mE5Rqk1Zr70CkkssdL+cSvnmCbCQhIjzu2gV7RyEBjQ4JcQAAuXUZ\nz9SckmAwPT4HZLN3fmcgeBUU1HnMg3YOJdfJdIMUXNyEQiUEQZDf1miW+y/VyA1ssSMbUQgA\nIChVUMrqlBSGBFEUBaUKKtl9m5iaExJjYyCKgkYHpdreseS2xFgofQSVCirZpSbTDVJ4saZk\n1hIJc2Oko5LVNkQOTgAEpUJQymqrM5mMMAAKhUJeeYGpOSej+RRKoVKo5Xb9SxSVgAiFIL+1\nJtcNUlQIkFkj5AsKhcJhazu5FdFEREREry0WdkREREQywcKOiIiISCZY2BERERHJBAs7IiIi\nIplgYUdEREQkEyzsiIiIiGSChR0RERGRTLCwIyIiIpIJFnZEREREMsHCjoiIiEgmWNgRERER\nyQQLOyIiIiKZYGFHREREJBMs7IiIiIhkgoUdERERkUywsCMiIiKSCRZ2RERERDLBwo6IiIhI\nJljYEREREckECzsiIiIimWBhR0RERCQTLOyIiIiIZIKFHREREZFMsLBzTlGHIQhp/ykU8MqD\nekFYvCfVxNX8IQjQG+0UKxEREdmIyt4B0CvQFUdQ5eQfTQaEXsPRnTiyA5d24Ps37RcZERER\n2QELO2fm2wbr56YduXsq3vgMP3TE5Ei4qgBgwyHEG6BR2j5AIiIisiUWdrLT4hMU+hZ3IvEg\nGiW8AaBIiQwn1idAq7FZaLnFZIxctmDe0m3/XnkQ7p4nf8OmQZ+Mfrecu/rlc53btWbayo2H\nL9+JNGmLl6nyTq9Bo1pVsE3ALyFFLrGPT0+dvfyvw2fuPYvRefpWqVb33f4fdK6eT+JUUpFu\nHdl9PUqUWtTtQ9MWrdl07HLokyidl1+Nmg2HDP2gVQlPKVNJy2SMXr7096W7T115FOXhk6dB\ng/rjBnco5/ayw8Sg9gP+CE9IP/7x/pVaIe3IxPi7e049NQ9Xqlk1UJ1uCslIutPQRx7+btlp\nF6/6H/WtIk34LyNFanFPL0yfvXT9wVN3w+LzBhR+s83bE4d0yaNygnu39M93TZtzyMXnzY9H\n1LV3LHYjiKJo7xgo+6IOw7M+AofjfroWOwAV/HDxKa6HWwq7eoE48gDxBmiVANCzFNZcR+wV\ndOuNrScADYqXwttD8e0HUL7Yzz4/h1GfYOsB6DVo0AbBC9G4ICJb4skflglWfIP5q3DhBgxK\nlK6G9z7B8LdeHrIhMjz26gVBoxGUr3Q6YTI8G9at669XI1KO1HmW27RjSV2PDIvUXbOHv73o\ncJqRLYf8uH5YrVcJBoApUS8mJAoajUKd7RJZilxiH++t23rsrdS3VAoKVb/Jq+Z2zLjEtxpe\nTlOTbh3l1np0tNSenP21Xr/ZjxJNKSdQKN2/WbVhWAWfbEVojHlqenpZ0LkrNLpszWgyPB8x\naNyvN6JTjtR5FNv4+8S6GVUJYmLBZgOijFYOIlYLu59GDx97Mtw8HLxpaVfv7C18UVRC6y9o\nNAp1dlOTdqcRPLLth3seeBX8373tvbIVWHKEjrRBRt//u1HH8dfjDCl/612i5fG13+ZXZ6+2\nEzVa+BdSCIKgtNElo0Xdy43efMer2NTQ8yOk/iyTyeTi4qK0VWpZ5wQFOGWTiMexUGiRz/Vl\nUzVthL3P0W8YhvXBs2uYPhSDt1t+FXsRZetixTaUb4SOTXFxPcpUR1h88rzfBKHv57gFvN0L\nXdvi3nGMaIuppyTMKYXDs4aZ92KFG3ZZMHXCyA5VAMRHXuo5cGVGszy7HNw5+AgA7xJNpk2a\n8uOEEaV1KgC7fxp1LCbRNmFbJUUuPw6ZYq7qijboMnPKhPF9mqoFQTQZVnz5/qlYQ0Z/1vHz\nyuI0UpMotVHDFj5KNAkKTfd3RwdPmziqVSkAJmP0lOE/2CAps8M/TjNXdYXrtJz3xfsjWpcG\nEB91q9eobRnNEh95NsooCgrl0G5Baf6lP9Y9vbQuqaqzMal2GmLCjQtHx/+v54d7HtggC6sk\nSM00pu/k63EGQRBa9Bi0YMonQ1qWAPD8xq5W4/fZKKscEPXX/9vzWe+6ozffsXco9sdLsTIi\nGhF6DTOG4mks3l+LjE/XAOBGJdzcDD8dAEwZgHyNsWYcglsDwMD2eBSLRccxqCYAJISiflWc\njEdey8dgym541MSdI5YmwKiTyFMb343FJ39LmZ75wxNH/XYLgNa94tEFn7grBLTt4Hqm2dTb\nkU8vztsf3auxu5WsF45ZaRJFlbbAnt+nl9IqAbxZxjv44GMAjxNMcJM8auskyMWofvT1tQgA\nLl4NTv74qUYA0KHCkw49t98zGp5/eeTxxuaBzpiXeR3Zfz1Kk5o+6uim8HgABRt+E/y/ZgC6\ntw7a/2/jUzGJMU82hyZODMxmM0mOUjN8uPE+AK1bycPf9XdXCHiziev596fdjXl69bcDMa0b\nuVlptIsNOw5A617x2xF9MvnzpvgR4zYLglDNRfmfrU4wXny2JGvt3zHdOu26FWc0pZ/XdiRI\nLSbm91WPYgEUbDRlw/jWAPB2V69OLaZefX572/hrk/ebZ3EoB/rUevuvy3EGu64LR8LCzpmF\nzoMwz8r4r9bi886ZzLtksaWqA+BVH/ndEHoPAIwRWHcb+QdZqjoAmkCs/wKFR1p+NMVCb4Sr\nP5Lut/CogeMnYLTFtz02fNeVeAMAn5ID3RWWKz0duxSa+v0FAPOvRTauljfNLAb93Zl3ogD4\nlh6RtEvyq9LxUzvcDJOKFLnEhv2XYBIB5CnfS/PiQliNnoWx/R6AR/+FQ/rCTqJ15AjrUaLU\njIbwymXLAKjQtrRllEJTVKM8FZMoKDQeSlvciBb3/OiVeCMAn2IdklLr0M5/2oKbABbcjGlU\nyTv9XI+OPwDg4l1LNOlv3b7/KF5RskRhP62VMvTcb99vDU8o3PiDgbd+/S82Ov0E0pFqg4yL\nT4SgUioB0WCn8k6K1O4dPGgeKP9e8hXnHv2LTf3slMkUP+12VHAZK1uCfRlj4xKhUKkUgGgw\nsGMvXop1arri6Ngxxb/2qFcBgoDvxuNiZpc86vql+jGpSnu0AolGNE19/l1wCJLaDBRuaBaI\nsC0o0wgTpmPHQUQmoko1VK8M6ekjLPeF+JT3TRrpU95yg/mDE2HpZ4kP35UoigC8S/ntWvld\nnZYt8lStX7b9gPEr99v3/E6KXDSupWZ8Pm7G5+O+HJh8O138I715QJc3e3cm5YxE68gR1qNE\nqbn6BB1cu+rg2lU/tylg+VNnVm+J0AMo1OgzD4UtCrv4yLPmAZ8yyY9r+JRxNw+Eno60Ote9\nf58BEJXnm779QbV+XwQN/rx00OC+83fHp14lCTFXuyy6otL4rfqivhTBv5xEa63pgr/CzxwL\nP3Ps4cGFUob/MlKkZkq03DGZcrMTXmyEN449y90UckXTdecjIiIiIiIe391s71gcAlvsnJnV\n7k7WD0GnH9EpGJc/ftm8GV3cibsMAMVTX9YSVNCm2FR2nMW0L7Hsd0wZCwAKDZq+je/mokbq\nYlEC+ufPzQO6PMmXGHS+LuaBmHtx6WdJjLtuHrjzz4dv/2k5Pt2/eXb2tx8euDV93/jmEob7\nUlLkotKVfL9nyZSziKa4GXOumIe7BQXkagbWSbSOHGE92mDzu7xiyvBNZ09cumUUxeJN+2yf\nlckzSblFHxllHtD6pEjNR2seiA2NtzIPsOdeHIDnt46cfjHGZIjduGbJ5QiXY58l13C/Tpj3\nKNHUetzYSjrlmdyPPRNy2mmkIUVq3iXLA8cAXPj5CBa2NU+waunNl/xNcjRssZOdtxfCTY07\ni3I4uyYAAG7HpB5rQkKK9m2VLz6fg6sPcfcSVi9C3zex7w/Ur4hIK70e5K7EKMvdOSr35EJT\nobacoSZGW7l3xxBvySU+PLJkk54/zpw+c3QP83P7p34btybM+hHLBmyQi8nw/OtR3ZfdiwZQ\nImj80PwvfZ4ml0iUlyOsRxussudXTh29eNMoigAeXjq151pUbidhnSHa8gVXuyffU6FQW1rs\nEmOsXt4SNzxPBKBzL/PHkjmPd/+8+5ue/moFgKvbF26IsOwNnl3d8OGxZ56BTVe8Jf39ndbI\naaeRhhSpeQQOqumuAXD3wMQ2X8xZ9Pvq0SO6TLtiqSBFa09Ak6Nhi50cuWvwJCSH8+brC8UX\n+Gc10Dh55IPFyYXds434/ghqfoDORVCwLHqURY9BKFkT40/iQhjq5X/V4F9K5WY56iREJD8F\naTJabtlRu1vZnpVqy0g3vzbH532kEgA0b+pzu/rEI6JoWrj+bo+BpSSNOSNS5xJz//igoWM3\n34gEUPqNwfu/6yhNHmlJlJcjrEcbbH6VR/5w8J2w/w5sGTt/feyj88P79K707/rKLpLvqJWu\nltT0kSlTsxQBajfrd9Du/m02AJXOI5+HCkDNRm1XdDrw5m/3RNG0YO/Tjh0CRZN+1Md/CYJy\nysxeNuy0LhU57TTSkCi1lbP6VBm8JN4kHli/7MB6AHAr5B5zNxqASz6thPlQLmGLnRyJIkwJ\nSMjRrUfaQggqhAc/YvmLqyuJj9H5i5R/HVOnYsR4JD+CJOJUGAD4u+Q85qzR+Vj69Ip7knzS\nrA+PNQ+4FbASgFLrbx4o/GZ31YtDS8EWXcwDT/97Lk2kmZM0l5ObFlZtO3TzjUhBoek+Ytqx\nWe+72eRWLUiWlyOsRxtsfq75ClcuX7X/4M839y8JwKAP/XhnaG7F/xI6bw/zQPzT5HZ3/XPL\n3ZmuAVbvzhQC/XwC/XzMVZ1ZydYFzQNPz0UBuLVrzqYwvZt/Xc3Zk6u2HVi17cDRF32FHNx9\ncN2BJ7meSHpy2mmkIVFqgfWG/hc8oV3NUp46lbtPvqAuH2yZYOm72K9a9npVJLtgi50cmc/v\nn8SigHtOZv9jGyrVQ/+aWN4WRVzwzxZ49oZbMFQeAJCnI5oF4p9fUfQ8mlSHmwmHt+H8I9T/\nH4p55WYW1mi9awNbADy/lHxIePZiP1ugbtpHwABoPesBawAY41NcThItRxetr91evCFdLhtn\njei9+BAAjXvJ7+fNHVDTpu+ckCgvR1iPEqX2/OYvHy68CqB0jzGf1shj/lXx1gWw5BqA8IuR\n6JD7uaSh86wI/Avg+bXkqiXsrOVCcMGaVr7acWEhJ+/EAvApXrKCp6UzFH2EparQeasBRN4K\nAxD98OCQbw6mmX3pD8Ebiwzv3EjyG3PltNNIQ7rUCtVuv6p2+6Tfn/qhp3mgXbEcHVPItthi\nJ0dvBgJAx4k5nN21PC6eR792uLoff+5B41E4OhcJRmgsj+xhxxl8OhBuT7F2GVb8AaE4pizF\nvu8hfZOQq0+rololgPAbP4eau+kXjYt/DwEgCIpRxT3Sz6LzalDDTQ3gzs6FT160Mu6b97N5\noGw7WzxPYJVEudzY+Lm5qtN6VNq0dbmNqzpIlpcjrEeJUlNon6/dtmPtth2Lf9iRNOOe4Gvm\ngTyVJD9fAuDiXa+oRgkg/Na6UPNzkaJx8cYHAARBGFHESieBEffXvTXiq7dGfNV33kXLKNG4\ndN4t82C1N6xUFXYhp51GGlKkFh/xb/Ne/Zv36t910hHzSFPik0m/3wagcavQN6/kl2Xo1fGV\nYpTOkcNQ5EHt0sljYs/DrRKabcWe1jn+q7n1SrF9k7u2/f0mAJ/S9fq+UTXs9OYVB+8C8Ks4\n7Oaad83TrOzwxvDbEQBaLN6ytqbf6Z/7N5pzDoBXsfrvtq4ScfPfJdvPAVDril868pv/q70A\n8VVeKZZpLmkSAZBJLkpDozqNT8cmAgis36Fr6VRvGi3QuPeQ2tk43OY4NYnWUS6uR4dKTTRF\nN6vX8mRMIoBKzTq2q5z//vm9y3ZfBqBQemw/+He9zN77mVKOXym2f8bYdhvuA/ApUblv0zJh\n5/avOPYIgF+5btd/7gBgVZ8hI+7GAGgxe/bvVXwM8ffKtP70qcEkKFQtW7esG6C7cPzAn2ee\nAXDxqnjzr09crV39//WdwcPuRsO2rxTL/S9aio1NH30ib93BAOzySrFcTy2fQl+/TrPzcYmC\noGzV+Z3a+YSjf2/YcS0SQP0xv+0YUDLjWKyw8SvF9JH7fQNaA3jNXynGS7GUTvcghCoQ/hhJ\nh5OFwwHgy6p2DCpJo09/7Hys87rbUeFXD8++aunGSetedunC3knTiEaDwWgEYD4hrTJo4bB/\n357/35OIW4dmLThknkahdBs7b8ErVnWvKNNc0iSCzHKJfbLJXNUBCD20cfahVB9X3eetbBV2\nOSbROnKE9ShFaoLCffWcQTXe/ynKaDr3z4Zz/1j+jiCoek9YlK2q7lU0HPlZp/8+/vNObPiN\ns7NvWLq107oVXTK9jXnYZDSZ8zI/GanSFdw8pknD7/YaTIa/t2xPeu2MWhcwa8Eoq1WdveT6\nF83G8b+EBKm5/DG9d9WRv+hNxu1rV7x40ST8q/Tc0C97L5sme3GgDZQcxfIRMEWgYjNM+hY/\nfI8+LfHxflQfikYOcQFCoc6zZMOf09/rWKmgn6tK5ZO3QLvO7+7dsbSJT4ZnuoLCZeovG3/5\nqG/9kgU8tCp3rzyNWnRctfqvT+pKfn/Py+V6LnHhJ2wYfoYkWkeOsB4lSi2gzqALf8wY9Gad\nwj4eaoXKyyd/kxYdly7bNL+z7Z6+VKi9Fy+b8V2fZhUDfVxUSh9fv3ZtO/zz+5eNvTKsLMu1\nHXR2zgc965Xx99CplGo//4Jvd+y86/dveha2Rcc6WSennUYaUqRWsOnwC79+07tprVIBvmqt\na+GilYaOnHR2xRgXRyrW6SV4KZas2bUI3wTjwhVEGFC0PLoMwITB0LzSaUBuXYp1NK9yKdbB\nMTVnlONLsY4vx5diHZ9cN0gbX4q1MV6KJafS8j20fM/eQRAREVH28FIsERERkUywsCMiIiKS\nCRZ2RERERDLBwo6IiIhIJljYEREREckECzsiIiIimWBhR0RERCQTLOyIiIiIZIKFHREREZFM\nsLAjIiIikgkWdkREREQywcKOiIiISCZY2BERERHJBAs7IiIiIplgYUdEREQkEyzsiIiIiGSC\nhR0RERGRTLCwIyIiIpIJFnZEREREMsHCjoiIiEgmWNgRERERyQQLOyIiIiKZYGFHREREJBMs\n7IiIiIhkgoUdERERkUyo7B0AvV5Ekwkw2DuKXCWKAGAyiUZ55QWm5pwsqRlEQ4K9Q8llokIj\nADCJ8l1rstsgRQ0AERDsHUiuM5lM9g4hQyzsyFYEBQAYDKK9A8ldoigCEE1GJDju9zxnmJpT\nMpoAiIl6+RV2ULkJOogmExLklppsN0il2lzSOXIZJD+CeXsisgFDVAREGX69jXFxShcXe0ch\nCabmhERDxBOZpgajPkHl4SvHBiDZbpCCqN97AAANLElEQVQmQal0dbN3FFJRKpX2DsEKFnZE\nREREMsGHJ4iIiIhkgoUdERERkUywsCMiIiKSCRZ2RERERDLBwo6IiIhIJljYEREREckEOygm\nG0k0Js5YPSM2LtbegWSJCPGZ/n4B1wKCM/SYJUKMSrifz8U5ogVEveG+r7aA8/RGJipM911V\nzhKwaIp/plQ4TbTGuEiVxt/eYWSVMT5W6eJMHemZEg0KF3dnCViEQqHV2juKrNLpdG3btnXA\nruxY2JGNzFwz89M+n9o7CiIiotyxcePG9u3b2zuKtFjYkY3ExMYA8Ojg4V7W3d6xZM6IGK0i\n0l3l6apyij7TYzyVkTqlp07pBNGqEJNXFalReqoVThAtAJ0QU0AdqVB4KuAMAScYEaYVlO6C\nwtXeoWSBXkSsm6ByEZQ6e4eSOdEowOglqDSCUmPvWLJEVKgEtY+gVEHhcK1KVmi08M4rAILC\nCW4SO3bs2Ny5c+Pi4uwdiBUs7Mim3Mu6BzYLtHcUmYs2PFQrIvPpPPy0+e0dS+YSTQ+9lJHe\nGg8fjRNEqxAfBqoiXdUebioniBaAKx6W1kYqlR5qpRMEbIqOFu+rldp8CpWfvWPJnBibID5z\nU+p8BK2PvWPJnJhgEvU+Cp2bQuth71iyRBSV0PoLGo1C7Qx1s0YL/0IKQRAc7+Kmc3GCupiI\niIiIsoKFHREREZFMsLAjIiIikgkWdkREREQywcKOiIiISCZY2BERERHJBAs7IiIiIplgYUdE\nREQkEyzsiIiIiGSChR0RERGRTLCwIyIiIpIJFnZEREREMsHCjoiIiEgmWNgRERERyQQLOyIi\nIiKZYGFHREREJBMqewdArwvRJAKIvhQdilB7x5I5oxgj3oGxZFSE2mTvWDInmmKMIQgoFeXi\nDNEqTTFHbqF42SiNygmiBaAVYzbeQLnyUSqFEwRsijdeOiGWL2VUqiLsHUvmTHGmS5cSy5cM\nUKpc7B1L5owGXLoRW75kEaVKa+9YssQI5aU74RVKl1Ko1PaOJXMmlfpi6OMK5csrVU5QmRw9\nehSAyeSI+wQnWHwkD3ev3QUQ9VdU1F9R9o4lq54gEoi0dxRZdcapooWTRQtnC/iJvQPIlvP2\nDoAoJy5evGjvEKxgYUc2ElQraBmWdR7cuXyN8vaOJXMXT15c99O6HkM6V6rpBNGeO3FxzcJ1\nfYd1rlrLCaI9c/zisvnr3h/RuUZtJ4gWwMljF3+eu27kyM516jhBwEePXpwzZ92ooT3q1Kpk\n71gyd/T4udkL1oz6oG/dmlXsHUvmjpw4M/vH5aOGDKxbs4a9Y8mSIyf+m70weNSwIXVr17Z3\nLJk7cuz47PkLRo8eXbduXXvHkrkjR4788MMPFStWtHcg1ohENvH7778D+P333+0dSJYwWuk4\nV7SiswXMaKXjXNGKzhYwo80tfHiCiIiISCZY2JGNuLi4JP3v+BitdJwrWjhbwIxWOs4VLZwt\nYEabWwRRFO0dA70WjEbj7t27W7RooVQq7R1L5hitdJwrWjhbwIxWOs4VLZwtYEabW1jYERER\nEckEL8USERERyQQLOyIiIiKZYGFHREREJBMs7IiIiIhkgoUdERERkUywsCMiIiKSCRZ2RERE\nRDLBwo6IHJAxIcFg7xiIso5bLDkKFnZka3e39ShVZ6m9o0jr6sZZbRpXz+PmU7n+m1NW/pfB\nVKYN339Yp3IpT5178fI1Ppi8Um+n7r2zFi0ARN/ePahDfT9PXZ6CpbuNXfDcYIeIsx5tkpX9\nKvgU6Cl1YFZlOVrT5jlj6pUr7K7VeOcr3nXMnPt6o+2izEAOFrVtON1Sze6StOMWC9nuEBxl\nf5sRxzyWAYBIZEOG+HtdCrj7lFxg70BSeXrqW41CKNd99JLVy8b2ryEIijH/hKaf7NjkpoKg\n7Dpm2up1v834rK9OIVQfudNhoxVFMT5sT1lXdZ5q3WYuXvPjtOE+KkXFDzY6bLRJ7m4fA8A1\nbxfbRJhS1qP97+uWgiC8+d64pX+sm//t8ECtMk+VYQYbh5taDha1bTjdUs3ukrTjFivKd4fg\nIPvbjDjmscyMhR3ZSMzD4D6dWxfz1gJwtC/D5yW83QPfizOafzJ+XtbXPeDd9JPV9dQGNlmR\n9OOmrsWV2gJGG8WYLIvRiqL4Z8eiWs/6N+IsR8bjU6orlG634216oMx6tGb6yOPlXNVVA1zt\ncpjMarQmfTlXdZH2K5NGhPzVH8CnN57bJk6rsruobcbplmq2lqR9t1hRvjsEB9nfpufIxzIz\nFnZkI7GPV40fP378+PEtfXQO9WUwxIeoBKHO7PNJY2792QrA4Uh9mikL61Sleu9P+vHk+KqC\nQhNn2z1N1qMVTfHFdKoKIw4nz6u/d/r06WeJJtuEKmYrWgvj+Hr+Rd/+8e+gwrY/TGY9Wn3E\nAQAdjz9KGpMQ/R+AN7bfsVGs6WR/UduI0y3VbC5Je26xoqx3CI6wv7XKYY9lSXiPHdmIi1/P\nKVOmTJkypY2Pzt6xpBL3bL1BFCu1Dkwak6dmIwBrn8almXLOO2Vvrev/675LsQlx14+sfe+H\niyXeXqiz7Xco69HGh+24FW+oOLiUMf7xkX//OXX5jlFdoEqVKr4qwQGjNTszt8P0SyV3rxpk\no/hSy3q0arfKly9f/qlK3qQx4ReXA6hfzssmkVqR3UVtM063VLO1JO27xULWOwRH2N9a5bDH\nsiQqewdAZGeG+FsASrkkfxdULqUB3IpN+4xbh0XHhv5XuE/T8n0AAD5lB97+bYDN4jTLerQJ\nUUcBuOz6qmjNeffiDQDcCtSau37rgFp5YStZjxZAVMiaJmN2fHnwfnGd8qbNQkwh69EKSs8y\nZTyTfgw/v6H9mwvzVh0xsbAn7CRbi9qWnG6pZj1gu2+xkPUOwRH2t07KAapfkiNT4sMzL1y4\nEmnvcJJZCUw0ARCQ9rTVaDSlGfPjgDoLLrt/NGvJtt07ls39zP/u8ppdp6WdyGGiNRnCAPz6\n6aaxvx16FhN35+K+LnluDm7a6Fa8hI8Zpg04y9GKhucDG71fbMiGT2r5SRdeGjmONvlX+vtz\nP+pasGrn0Mq99h+cabumj/SyH7yNON1SzVrAdtlirXDsHUJa2dkYbL+/lQ222JEkokPnVa36\ntXk4b/n1Ty50tG88SdIHptIVB3A9LjFpGkPcdQCF3dSpZrz/w5Dl5wZuuzs9qCAANH8zqKbo\nX+/TcVcGTy/j42jRAhBU3gAaLNg6on1pAL7lGs/bMmVZoaEfnXy8rkGAbQK+tTOr0V6Y/db6\nJz5Lm5u2bNkC4PTjOGPCgy1btrgXrN+kio0Wb9ajNQvZNf/tdz6+aCj28cKtEwe1suEVLSuy\nvmHYWHYDs/tSzWLAdtlicxwt7LRDyHG0dtnfyoe9b/Kj187M4t4OdcOpIe6mShAaLLqcNCZk\n61sA9j5PdT/vg0NtAOyPSB5piL8DoMnq67aLNcvRiqIYH74TwMArYSnnBdBkje0Cznq0hz4o\nZ3UHVab/vw4YrSiK93aMd1EINftOuRNn305OLLIVvC053VLNYsCOsMVmPVrR2XYIDrK/fTlH\nO5YlYWFHtuaAX4axxb28in2c9LjVjOp+bv7vpJkm6t4sAD3/uJk0JvSfUQA+uhwm2lZWojVr\nn8el5Dtrkn68s3kggKkhkdLHmCzr0aZkr2cMsxityRBZ3V1TrPMiW8aWqZwtahtwuqWagyVp\nry1WlOkOwXH2ty/hgMcyMxZ2ZGsO+GV4dHSSUhAajJy2fe+OmZ8ECYLw4Y575l+d++69tm3b\nnohKEEVxcosCSo3/B1PmrNu4bv7UUUV1Kr9ao2zfsJDFaEVRvLdzjEJQtHhv4qo/1y+YNqqA\nVlmgxRSHjTYlex0mXxKtmCLgiNsTALScMuvH1LY9jbN9zFkM3o6yuA04zlLNwUZrx8JOrjsE\nB9nfvoQDHsvMWNiRrTnml+HMmikNyhbQqTQBJWuPX3Y0afy+HiUBbAmLE0XRlBi28LP+tSqW\ncNe6FStXvdeYWQ8T7NOrUlaiNTuxcnKjCoVcNLqi5Wr0GTcv3IZ9VuUg2iR2PExmFK2YIuC7\nO9+0ehmu3enHdok5yUuCt6+sbAMOtVSzu9HacYsVZbpDcJz9bUYc81gmiqIgig729jUiIiIi\nyhF2d0JEREQkEyzsiIiIiGSChR0RERGRTLCwIyIiIpIJFnZEREREMsHCjoiIiEgmWNgRERER\nyQQLOyIiIiKZYGFHREREJBMs7IiIiIhkgoUdERERkUywsCMiIiKSCRZ2RERERDLBwo6IiIhI\nJljYEREREckECzsiIiIimWBhR0RERCQTLOyIiIiIZIKFHREREZFMsLAjIiIikgkWdkREREQy\nwcKOiIiISCZY2BERERHJBAs7IiIiIplgYUdEREQkEyzsiIiIiGSChR0RERGRTLCwIyIiIpIJ\nFnZEREREMsHCjoiIiEgmWNgRERERyQQLOyIiIiKZYGFHREREJBMs7IiIiIhkgoUdERERkUz8\nH3/F9YnfIZqhAAAAAElFTkSuQmCC"
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
    "correlation_df<-cor(abaloneAGE1[,3:10], method=\"spearman\", use=\"pairwise.complete.obs\")\n",
    "correlation_df\n",
    "\n",
    "# graph correlation specific columns\n",
    "corrplot(correlation_df, method=\"color\", addCoef.col = \"black\",col = terrain.colors(n=10, alpha = 0.8), type = \"lower\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "0bdc5ce8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:38.617409Z",
     "iopub.status.busy": "2022-12-07T02:32:38.615753Z",
     "iopub.status.idle": "2022-12-07T02:32:38.650259Z",
     "shell.execute_reply": "2022-12-07T02:32:38.648220Z"
    },
    "papermill": {
     "duration": 0.051162,
     "end_time": "2022-12-07T02:32:38.652814",
     "exception": false,
     "start_time": "2022-12-07T02:32:38.601652",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "               Length Diameter Height Whole.weight Shucked.weight\n",
       "Length           1.00     0.99   0.83         0.93           0.90\n",
       "Diameter         0.99     1.00   0.83         0.93           0.89\n",
       "Height           0.83     0.83   1.00         0.82           0.77\n",
       "Whole.weight     0.93     0.93   0.82         1.00           0.97\n",
       "Shucked.weight   0.90     0.89   0.77         0.97           1.00\n",
       "Viscera.weight   0.90     0.90   0.80         0.97           0.93\n",
       "Shell.weight     0.90     0.91   0.82         0.96           0.88\n",
       "Rings            0.56     0.57   0.56         0.54           0.42\n",
       "               Viscera.weight Shell.weight Rings\n",
       "Length                   0.90         0.90  0.56\n",
       "Diameter                 0.90         0.91  0.57\n",
       "Height                   0.80         0.82  0.56\n",
       "Whole.weight             0.97         0.96  0.54\n",
       "Shucked.weight           0.93         0.88  0.42\n",
       "Viscera.weight           1.00         0.91  0.50\n",
       "Shell.weight             0.91         1.00  0.63\n",
       "Rings                    0.50         0.63  1.00\n",
       "\n",
       "n= 4177 \n",
       "\n",
       "\n",
       "P\n",
       "               Length Diameter Height Whole.weight Shucked.weight\n",
       "Length                 0        0      0            0            \n",
       "Diameter        0               0      0            0            \n",
       "Height          0      0               0            0            \n",
       "Whole.weight    0      0        0                   0            \n",
       "Shucked.weight  0      0        0      0                         \n",
       "Viscera.weight  0      0        0      0            0            \n",
       "Shell.weight    0      0        0      0            0            \n",
       "Rings           0      0        0      0            0            \n",
       "               Viscera.weight Shell.weight Rings\n",
       "Length          0              0            0   \n",
       "Diameter        0              0            0   \n",
       "Height          0              0            0   \n",
       "Whole.weight    0              0            0   \n",
       "Shucked.weight  0              0            0   \n",
       "Viscera.weight                 0            0   \n",
       "Shell.weight    0                           0   \n",
       "Rings           0              0                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "cor_2 <- Hmisc::rcorr(as.matrix(abaloneAGE1[,3:10]))\n",
    "cor_2"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4dbb319f",
   "metadata": {
    "papermill": {
     "duration": 0.010905,
     "end_time": "2022-12-07T02:32:38.674587",
     "exception": false,
     "start_time": "2022-12-07T02:32:38.663682",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Recipe for Data Prep"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "e4c10d9b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:38.699910Z",
     "iopub.status.busy": "2022-12-07T02:32:38.698452Z",
     "iopub.status.idle": "2022-12-07T02:32:38.718813Z",
     "shell.execute_reply": "2022-12-07T02:32:38.717186Z"
    },
    "papermill": {
     "duration": 0.036175,
     "end_time": "2022-12-07T02:32:38.721735",
     "exception": false,
     "start_time": "2022-12-07T02:32:38.685560",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# grouping variable names into types\n",
    "  \n",
    "outcome <- c('Rings')  #continous & numeric\n",
    "\n",
    "id <- c('ID')\n",
    "  \n",
    "continuous <- c('Length', 'Diameter', \"Height\", \"Whole.weight\", \"Shucked.weight\", \"Viscera.weight\", \"Shell.weight\") #numeric \n",
    "\n",
    "nominal <- c('Sex') #categorical"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "b3f3b9a4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:38.747363Z",
     "iopub.status.busy": "2022-12-07T02:32:38.745821Z",
     "iopub.status.idle": "2022-12-07T02:32:38.765014Z",
     "shell.execute_reply": "2022-12-07T02:32:38.763415Z"
    },
    "papermill": {
     "duration": 0.035217,
     "end_time": "2022-12-07T02:32:38.767928",
     "exception": false,
     "start_time": "2022-12-07T02:32:38.732711",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# converting nominal variable to a factor\n",
    "  \n",
    "  for(i in nominal){\n",
    "    \n",
    "    abaloneAGE1[,i] <- as.factor(abaloneAGE1[,i])}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "daedc9ba",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:38.793231Z",
     "iopub.status.busy": "2022-12-07T02:32:38.791733Z",
     "iopub.status.idle": "2022-12-07T02:32:38.857771Z",
     "shell.execute_reply": "2022-12-07T02:32:38.855968Z"
    },
    "papermill": {
     "duration": 0.081627,
     "end_time": "2022-12-07T02:32:38.860549",
     "exception": false,
     "start_time": "2022-12-07T02:32:38.778922",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Recipe\n",
       "\n",
       "Inputs:\n",
       "\n",
       "      role #variables\n",
       "   outcome          1\n",
       " predictor          8\n",
       "\n",
       "Operations:\n",
       "\n",
       "Log transformation on all_of(continuous)\n",
       "Dummy variables from all_of(nominal)"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "blueprint <- recipe(x  = abaloneAGE1,\n",
    "                    vars  = c(outcome,continuous,nominal),\n",
    "                    roles = c(rep('predictor',8),'outcome')) %>%\n",
    "  step_log(all_of(continuous),offset = 0.001) %>%\n",
    "    \n",
    "  # One-hot encoding for all categorical variables\n",
    "  \n",
    "  step_dummy(all_of(nominal),one_hot=TRUE)\n",
    "\n",
    "\n",
    "\n",
    "blueprint"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "6641ee3a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:38.886397Z",
     "iopub.status.busy": "2022-12-07T02:32:38.884814Z",
     "iopub.status.idle": "2022-12-07T02:32:39.064085Z",
     "shell.execute_reply": "2022-12-07T02:32:39.061963Z"
    },
    "papermill": {
     "duration": 0.195028,
     "end_time": "2022-12-07T02:32:39.066921",
     "exception": false,
     "start_time": "2022-12-07T02:32:38.871893",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 11</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Rings</th><th scope=col>Length</th><th scope=col>Diameter</th><th scope=col>Height</th><th scope=col>Whole.weight</th><th scope=col>Shucked.weight</th><th scope=col>Viscera.weight</th><th scope=col>Shell.weight</th><th scope=col>Sex_F</th><th scope=col>Sex_I</th><th scope=col>Sex_M</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>15</td><td>-0.7852625</td><td>-1.0051219</td><td>-2.343407</td><td>-0.6635884</td><td>-1.489435</td><td>-2.282782</td><td>-1.890475</td><td>0</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><td> 7</td><td>-1.0469691</td><td>-1.3242590</td><td>-2.396896</td><td>-1.4850103</td><td>-2.297598</td><td>-3.005783</td><td>-2.645075</td><td>0</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><td> 9</td><td>-0.6329933</td><td>-0.8651224</td><td>-1.995100</td><td>-0.3886080</td><td>-1.356736</td><td>-1.948413</td><td>-1.555897</td><td>1</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><td>10</td><td>-0.8187104</td><td>-1.0051219</td><td>-2.071473</td><td>-0.6597124</td><td>-1.530165</td><td>-2.162823</td><td>-1.857899</td><td>0</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><td> 7</td><td>-1.1056369</td><td>-1.3625778</td><td>-2.513306</td><td>-1.5798791</td><td>-2.402405</td><td>-3.206453</td><td>-2.882404</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><td> 8</td><td>-0.8533159</td><td>-1.2006450</td><td>-2.343407</td><td>-1.0427047</td><td>-1.951928</td><td>-2.544657</td><td>-2.111965</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 11\n",
       "\\begin{tabular}{lllllllllll}\n",
       " Rings & Length & Diameter & Height & Whole.weight & Shucked.weight & Viscera.weight & Shell.weight & Sex\\_F & Sex\\_I & Sex\\_M\\\\\n",
       " <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t 15 & -0.7852625 & -1.0051219 & -2.343407 & -0.6635884 & -1.489435 & -2.282782 & -1.890475 & 0 & 0 & 1\\\\\n",
       "\t  7 & -1.0469691 & -1.3242590 & -2.396896 & -1.4850103 & -2.297598 & -3.005783 & -2.645075 & 0 & 0 & 1\\\\\n",
       "\t  9 & -0.6329933 & -0.8651224 & -1.995100 & -0.3886080 & -1.356736 & -1.948413 & -1.555897 & 1 & 0 & 0\\\\\n",
       "\t 10 & -0.8187104 & -1.0051219 & -2.071473 & -0.6597124 & -1.530165 & -2.162823 & -1.857899 & 0 & 0 & 1\\\\\n",
       "\t  7 & -1.1056369 & -1.3625778 & -2.513306 & -1.5798791 & -2.402405 & -3.206453 & -2.882404 & 0 & 1 & 0\\\\\n",
       "\t  8 & -0.8533159 & -1.2006450 & -2.343407 & -1.0427047 & -1.951928 & -2.544657 & -2.111965 & 0 & 1 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 11\n",
       "\n",
       "| Rings &lt;int&gt; | Length &lt;dbl&gt; | Diameter &lt;dbl&gt; | Height &lt;dbl&gt; | Whole.weight &lt;dbl&gt; | Shucked.weight &lt;dbl&gt; | Viscera.weight &lt;dbl&gt; | Shell.weight &lt;dbl&gt; | Sex_F &lt;int&gt; | Sex_I &lt;int&gt; | Sex_M &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 15 | -0.7852625 | -1.0051219 | -2.343407 | -0.6635884 | -1.489435 | -2.282782 | -1.890475 | 0 | 0 | 1 |\n",
       "|  7 | -1.0469691 | -1.3242590 | -2.396896 | -1.4850103 | -2.297598 | -3.005783 | -2.645075 | 0 | 0 | 1 |\n",
       "|  9 | -0.6329933 | -0.8651224 | -1.995100 | -0.3886080 | -1.356736 | -1.948413 | -1.555897 | 1 | 0 | 0 |\n",
       "| 10 | -0.8187104 | -1.0051219 | -2.071473 | -0.6597124 | -1.530165 | -2.162823 | -1.857899 | 0 | 0 | 1 |\n",
       "|  7 | -1.1056369 | -1.3625778 | -2.513306 | -1.5798791 | -2.402405 | -3.206453 | -2.882404 | 0 | 1 | 0 |\n",
       "|  8 | -0.8533159 | -1.2006450 | -2.343407 | -1.0427047 | -1.951928 | -2.544657 | -2.111965 | 0 | 1 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  Rings Length     Diameter   Height    Whole.weight Shucked.weight\n",
       "1 15    -0.7852625 -1.0051219 -2.343407 -0.6635884   -1.489435     \n",
       "2  7    -1.0469691 -1.3242590 -2.396896 -1.4850103   -2.297598     \n",
       "3  9    -0.6329933 -0.8651224 -1.995100 -0.3886080   -1.356736     \n",
       "4 10    -0.8187104 -1.0051219 -2.071473 -0.6597124   -1.530165     \n",
       "5  7    -1.1056369 -1.3625778 -2.513306 -1.5798791   -2.402405     \n",
       "6  8    -0.8533159 -1.2006450 -2.343407 -1.0427047   -1.951928     \n",
       "  Viscera.weight Shell.weight Sex_F Sex_I Sex_M\n",
       "1 -2.282782      -1.890475    0     0     1    \n",
       "2 -3.005783      -2.645075    0     0     1    \n",
       "3 -1.948413      -1.555897    1     0     0    \n",
       "4 -2.162823      -1.857899    0     0     1    \n",
       "5 -3.206453      -2.882404    0     1     0    \n",
       "6 -2.544657      -2.111965    0     1     0    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Apply the transformations and processes in the blueprint to the abaloneAGE1 dataset\n",
    "\n",
    "prepare <- prep(blueprint, \n",
    "                training = abaloneAGE1)\n",
    "\n",
    "baked_abalone <- bake(prepare, new_data = abaloneAGE1)\n",
    "\n",
    "head(baked_abalone)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "2bc32001",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-07T02:32:39.093155Z",
     "iopub.status.busy": "2022-12-07T02:32:39.091578Z",
     "iopub.status.idle": "2022-12-07T02:32:39.204760Z",
     "shell.execute_reply": "2022-12-07T02:32:39.203058Z"
    },
    "papermill": {
     "duration": 0.12929,
     "end_time": "2022-12-07T02:32:39.207510",
     "exception": false,
     "start_time": "2022-12-07T02:32:39.078220",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd3wT9RsH8OeyuwelhZaW1YJAsTJklCVbylaGyJShDBmCSBEQFRQRoYAyBBFE\n8Scgoi0WRRAQkCGrskE2pWy6R9rk+/vj2lDa3jVtRi/Xz/v10leTXO6eu3zz4UnyzYVjjBEA\nAAAAOD5FWRcAAAAAANaBxg4AAABAJtDYAQAAAMgEGjsAAAAAmUBjBwAAACATaOwAAAAAZAKN\nHQAAAIBMoLEDAAAAkAk0dgAAAAAygcYOAAAAQCbQ2AEAAADIBBo7AAAAAJlAYwcAAAAgE2js\nAAAAAGQCjR0AAACATKCxAwAAAJAJNHYAAAAAMoHGDgAAAEAm0NgBAAAAyAQaOwAAAACZQGMH\nAAAAIBNo7AAAAABkAo0dAAAAgEygsQMAAACQCTR2ABLGsubPn/8wx1jWdQAAWAMyzfbKdWPX\n0kPHcdwzrx3If2VUTS+O47xqRvEXG7lpOY7rsve2+KriY7ds2LDhp9+LWcyBGLPvjOna0MtZ\no3V2SzKwAjdxHMdx3MzrySVdZ+nuWMDN3ztxHKd1a1TqNVhSiZlDwnLxR39f8EFkZGTkjI+W\n/Lr/sun6tbUrcBznWf1jWxfwpJJCw9tuBwFKxIqZRrKLNWSakDLPtI+re3L56Fw9qtVvPmbO\n14k5Tx4mO2eOQw/+ct3YWdGJGWMHDRr05vtxZV2I1VyPHrIy9kRSFtegaQNlWRdTDkVP6xLY\npMs7Hywmoi/fn9ytVXC7yVvLqhj5DW8wh8wed2Ra2TI/07LSkq+fPrTyvRF120032LdIE4ce\n/GjsinHg7uPU1NSfW1Uu60Ls7cHBO0Tk6j/+0O6/XJVcWZdTvmQ82NR7we9KXc1v/zxARFt/\nW11RrdyzuM8P9zPKujRweMg0ZJr9mZNpXiErUlNTU1NT714/vXRCGyJK2Dd/cOwN/tZyO25L\nAY1dMVr4ebm6uvbal0BE+uR/p7/WtYafp0at9Qms3WfMnAvpOUT0TqB795P3iCjhUET+99KP\n/O/TTk3reLponD0qNG738lc7rphuOr3105ZhNd0q1nx57LLji5tyHFeh9lr+JmelguO4V8/d\nWTa+p6+7jv/IIP323rF92gb5uKtVGq/K1SMGTz2ZrCciZkji37ue8Of/2gVXUCg0lWo0nv2/\nM2k3/+jRLMRF6xQY8tzMNX8L7Z1Qhb9/NnflvrtElJ16fNasWTezin7VlH77j36t67o5udRt\n0n7qF9vzXV90tQUk7PlIp1QolLr3tt8kIpbzeFnkkNAgX53WrXqdJlMXbXryNjzL2TDnjWb1\nqupcPJv3nHA+PbuYh83sSizcBZFjSHkPZf+TRyNfaefjrvOsVL3j4Hdv6Q15+yS4v8nX1hsZ\n86zx0cDW9YjomdbDlrYMrVo16Nezj4vdZZHVitdDAsNSaHgTETNmRI2M8PVw8qpco89biwp8\nvAXSlD/TqISxJjLaqYSxhkyTbKaRDWLNnEzjOK2Li4uLi4tvUL3xS/ZMqOpORNsnfM3fmn/c\nWmvwCFVbePAXm6sF/skuY6wca+GuJaKQwX9m5jO/uicRedZYxC/T0FVDRC/uiWcsZ0A1dyJS\n6Xzr1qvtqVIQkWfIsBzGYufN7uPrTESu/v1mzP6cv+PhBT34I6x28/PUKImI41QTt15jjF3Z\nOJq/SanVEZFXoAsRedf6mr+jk4Ijonoj6/PLJOYYjTmJL1RwIiKl2iOoWiC/gHfdSMaYMScx\nd1Ucxyk0/N8KpXMtFzXHqRUcR0Qcp1hxO7Xw7otUOLWKW/5B8ndyVv47GvS5/yS4Oas4TuGi\nyn15ELHgOF+SULWmO864lpR6K6aaTkVEg1YcZ4wxZnz/BX8iUrsENmnWkD+89V5dw29x+8Tn\n846YExFpvbVEpHFtKP74mlNJSXfh6SEhdgxND6VnDVci0ihy3yEIHhhb7P4mXo0kIrVL/ejj\n54noXHp2/v36upY3EXlU+6jInRZZrWg9gsOyyOHNHwTPUB8iUuetqsG0f8QfEbC1EmYaK1Gs\niY/2EsXa46zHyDRpZlqxD3TpYk080z6q5pF/tPBOLWpCRAqVZ4bhqSKt9w+iYLWFBn/xuZr/\nn2zxB9EO0NgVrXAIpt3bwN/0vztpjLH0u7sqVqzo4+Pz/b10xljMc75EVLlZ7r+R2WlnvNUK\nInpu0rosIzPoH77fJZCItO7NMnPS+HXWGr4q1WC8cWhNBbWSCiWgyil45hdrY7b9rDeyxMtv\nqVQqrVPlf5OyGGN3Dr1BRBynzDQ+GcdVey18rDc8vvAL/6+sT9jkm6nZabcPBWiVRNT6u0sF\n9l2kwiwjY4wdnhRKAt2DKUGcKnQ6cCvFoE9cOrQWEam0VRL0BpFqTXecdu7Yi5VciKjVtGh+\nnQ/PRBKRSlfjeGIWYyzxwgZ+RxbfTMlK2qdVcETU9eNfMwws/th3/lqlOSFoTiUl3YX8Q6LY\nY8g/lD4Nxp97kG7QP573gj8R6bw6ie8vY4wZ9cPreJlG47CZiw5dTjTtl0hjJ75akXqMBrFh\nWWB4mw6Ce9UBJ+6kZqclTK5fgYjcAqeKPyJgayXKNMaY+bEmPtrFxw8rFGv3/0OmSTHTzDmM\npYw10UwrsrG7809XfuGTqfr8RVrrH0TxtMw/+M3J1fz/ZJc5NHbmhqA++TD/VHSuXLffyCmr\nN/527eGT13wF/uW7e6w/ESmUzglZBv4aU4Au+mcW/8e+pNy7/9K1auEEbL7ibIFqM+5f+2tH\n9Feffzog3I9fA/9mHv/3yAuP+MXqOKuJqEPsdf7iQF8XIgpfea7A2kQqXJ2QyswLwbY/XuGv\nyU47xXEcEY3/77FItaY7Vq3lTkQatybZec+Bg+Pq8ukwM091nYqImiw6dS2mIxFpXBtk5S38\nW7+a5oSgOZWUdBdYviFR7DHkH8peR+7wt16P7UBEaue64vvLL5yTcWXO6z18dLmTvDmFtufU\n9fxNIo2d+GpF6km++YnIsBRq7F7YdJm/eHpJUyJy8R1kziMCtlPSxs78WBMf7eLjhwnEGjJN\naplmzmEsdayJZFqRjd3do934JQs0diL7UqLBI15t/sFvTq4W/ie7DKmEUqD8qD1s//m1LUwX\nV4R4j/2viJlMarcm+76aMX7el4cvnd301dlNXy3kFNqWfd+J2fCBR6F5uKmX7xKR2iWskib3\n/XAnrxf5P47eOUhECqVzS/fcN4prtPejX68XWEPVF/yeXGD6T0Z1fm/t3hzS1QprEBZaj/6+\nW2B5D3XuhvhS+Df2TRcLE6nw3zRzZ3vUCct9BaZyDq2qVV7LzLl0O51qOBdb7fWLyUSkTzky\nIvr6Nz2rElHy2WQiyny8Y+7cHfmXTDqV9PDhfSLSerbT5O1MzR4BtOkyFcuM41bqXSCzj6Gz\nuzpvE0+ebiL7y/+h1FWf+eUv05fcUDlVHfVaxzXrdv6yYMiobh1WtxabO1zsaoXq0accJTOG\nZQE6X11utVp8y1BCzMw0KkmsiY/23nqzxs+TWEOmSTLTyJaxVtJMu3/gPhEpVJ61nNQlPQjm\nDB5z0tL8JZ/6J7us4csTJfD8a3MOXbyXcP7wmoXv9X6hHjNm7ds4Z+iu+MJLulavSETZaf/e\ny849DWPm49wBUd+7FhEZDekn8p4kdw49LLwGRb4BeGvn4Olr9ihcm526//j88QOrPij9uY7M\nqZB/iWOOc3G5/1rkZJy/kWUgouDKzuZUW7n1O9/1r0lEG4cM4AtwC3Ejogp1vivwyuP81y10\nfjoiykrak503J/XRieK/Q0DmHbdS7wJZdgxF9peI4rdv/uabb6L/eaBQexDR5GWxXzXzI6I9\nKy5ZsloRKl11MmNYgvyYGWvio93M8WOKNWQaSTLTyGaxVopMW7v4PBG5BU1werpPsdbgMT8t\nzVlSIfSCoyygsTPXpXV9QkJCQhsPdwp+fvjkD7bsPMh/6pH4MMu0jCEzk//Dq85Md5XCaEjr\nOmOjgYjlJH429B0i0rg1erNBpI9aSURD392sZ3T/1OZhv1wT3/SdneeJSKH2CfTQkDFz/ZTN\nlu+OSIXD/FzMXMmh0eOO3stgxrQ1E18yMqbSBr0b5G5Ota99M6Pv6g0+amVW8sGuHxwiouDR\n7Yko+dqHhx5kEpE+6WSnJo0bNGjw0fnHAV3bE5E+5VifhX/kMHp0YduwFefNKc+cSkq9C2TZ\nMRTZXyK6ET172LBho8Y+2a5WpSAipwCnJ6tgOVlPyzYWs1oRrv7jix2WpuENsmF+rImPdnPG\nT37INJJkppHNYs2cTGMsm4+yx3cufflOx4VXk4joxSUjSnEQzGFOWvKDv9S5WmbM/MhWlvgI\nqz1sf/4rlwd7UVHzUdLvb/VSKYhI6xUU1iCsqreWiFS6aoeT9YyxfUNqEZFSXaFz99f5O+6f\n25k/wlqvKj5OKiLiONWELdcYY3unN+dvUru4EZGTt5YKTUZ59fxDU0l3j0zml9dVCAzw0qld\nKvAX41L1pikFU67kTkSt66wmoq6HcidADBKYjyJeITNvPgoRcZzSI+9juN5L48Srzf8NMsbY\nX1PCiEih9t79OJMZsyc1qkhEKme/pq1aBDipiKjqi+9mGxkzZr+cFyhqV3ci0nhoyIz5KOZU\nUtJdYE9P9RA/hgUeyvg9L1LeZBSx/WUs5eZXGgXHcVzXcZFENG5MTzXHcZxq+Y0UljfHrrDw\nlefEVytWj+iwLDy8C8x3ObcynDDHTgJKlGmMsRLFmvhoL1GsIdMkm2nFHsbSxZp4pvFz7Aqr\n3OqdnLx9fzK52VqDRzQtnxr8JclVKUBjV4IQvHdk45BuLav4uKsUCmcPv2ZdBv9yJm9S6sOd\n3RvWdFarvKtFmFa1b93c9o1D3JzUWlfPBm16r/otd6Y5M2Z/+/6Ixs8EqnVubQZ/cvCz50m0\nsWOMbfl4ZHCAt0vFah37TT0Zv0fJcUTUaNZxS0JQrELzQnDAsg/bN6jupNHVatjmnRU7i622\nQAjmZPxX00lFRIGdVzLGDFnx88f3Dankpda41ajTeNL89Sl53xvPfHB81qg+zwVXVuvcno94\nY9uPbcwJQXMqKekusEIhKHIMxRspkf1ljMV9G1nTTWMKOJXOf+wXB/ibxBo70dWK1yMyLAsP\nbzR20lTSTGMljDWR0V7SWEOmSTbTxA9jqWNNJNMKNHYaJ9eguk1ff3/1o+wnkZi/SGsNHpFq\nCwx+83NVCjjGJHAyvfLEqE/49n87iKjOSwOauGmIaGO3aq/8ej2ww283/uhc1tWBhBgy7+zf\nvfuFiFdXxu7v1baZn86GX1DAsARLYPyAOeyZaeUZGju7M2b0CPKNiU/1CO40fnDLx5f2rNyw\nmylclp65Oa62Z1kXB9LCDEkKlee59OxnnGz8BXYMS7AExg+Yx36ZVp6V9VuG5VFW0ukZw3vU\nqOSpUihdPCuFRwzecOB2WRflkPhPAYS0WnexrAu0gsTERINdNoRhCZbA+LEKZBpYDu/YgQMz\nZCZci08XutXJN8jfzdzTHAAAlDlkGlgOjR0AAACATOA8dgAAAAAygcYOAAAAQCbQ2AEAAADI\nBBo7AAAAAJlAYwcAAAAgE2jsAAAAAGQCjR0AAACATKCxAwAAAJAJNHYAAAAAMoHGDgAAAEAm\n0NgBAAAAyAQaOwAAAACZQGMHAAAAIBNo7AAAAABkAo0dAAAAgEygsQMAAACQCTR2AAAAADKB\nxg4AAABAJtDYAQAAAMgEGjsAAAAAmUBjBwAAACATaOwAAAAAZEKwsYtaF30rJduepQAA2B+y\nDgDkhGOMFXlD89q+Ry5nNu/Su1+/fn1f7lzZWWXnygCgRAwGQ2xsbGZmpuWr0ul0ERERSqXS\n8lVJH7IOwEFZK/RklniCjR0RxZ/et2XLli1btuw/l9Ky60v9+vXr07ujn5NM9hxAZrZt29a9\ne3drrS0mJqZbt27WWpvESSrrivy3ymg0XrhwITIyUqPRlElVABJkxdCTU+KJvTYNCG01IbTV\nhNmLH1w8vOKT6RMGRUxUebbu/nK/VwYO7/OChrNbkQBQvIyMDCIaMmRIWFiYJeuJi4tbv349\nv7ZyQlJZt3v37h49ehR5k0KhmDlzpl2rAZAwq4Se/BJP9EMHpj99YEdMTExMTMzhi8kN2r3U\ns2d33e2/l4+LWPD9ostbR9urSAAwV1hYWKdOncq6Ckcjpaxr27ZtdHR0gXfsDh48GBUVFRIS\nYs9KABwCQq8AwcZu4tCeMdt+v5VVoV237oNnrdnUrUMVNzUREQ0d91Yrt4AJRGjsAMDhSS3r\nlEplkZ8uRUVFKRQ4jwEAFEOwsXvoVn/+DzMj2jd2URT8HELn2X7nrl02LgwAwB6QdQAgJ4Kv\n/777Ym77wMyfN17gL25eufav0w9z76Op3LZ1A3tUBwBgY8g6AJATwcbu6ubxfvXarfjlCn/x\n/I6vOz4X8ObGq/YqrCCDwRATE7P5aRs3bvzwww/1en1ZVQUAjs6mWXfjwMZJQ3s/Xz8koJKv\nj59/cGjjXsMmbf77hlVWDgBQmOBHseNHrxm8+czXL9XiL876ad+gX8fUHTzmi/6/2au2p+Cb\nYgBgC7bLukvfjqozfHO3oSOGTuwd4OOpJEPSw4TTR/eObxeyY9Wp1UNqWVw7AEBBgo3dvuSs\nXZ2q578msO1YfXIL25dUNHxTDABswXZZ98aE7ybuvLKwTeWnrh0xdtrYJf6tXl89ZI/lmwAA\nKECwsRsR6DZt6a6d776YN52Y7V02xTVgqJ3qKgTfFAMAW7Bd1p1Ky572rHfh6z1qvZSTPsfy\n9QMAFCbY2L2/Y2XLJr38vm3Qon4Nd2XmpZN7j97yXn14k1W2euPAxkWrfjhw/PTt+0lZTOVZ\n0T+0ccuBr0/uGx5klfUDAJjJdlk3t0Wl1we/t+WL6Y2reZquTIk/tfidVyo+/57l6wcAKEyw\nsXMPfuVEfKttm34+fOZKulHVt22/DQNeqp57eieLYN4JAEiH7bJuxK9/nOzTv2mNBe6VggIq\neKg4Y9LD29duPwrt/PqO38dYvn4AgMIEGzt90qmPP1x25kbu1/7jr1/5+48fiWjz5s0WbhLz\nTgBAOmyXdSrnOiti/51/4/SBY6cTHiTqmcqjYkD9RuGhQR6WFg0AIECwsZvXqu1SY7Nxr7Rw\nVVt5BhvmnQCAdNgu63juQaFdgkJtsWYAh2YwGGJjYwt8J7JEDh48aMV6ZEOosWNR5x5vfbCl\nrYfW6pvEvBMAkAwbZh1hPjGAsO3btwudxQwsIdDYsWxnBZdpYLbYJOadAIBU2DLrMJ8YQERG\nRgYRDRkyJCwsrHRriI6O3rt3r1WLkgOBxo7T/L7sjU7hr85fPLn5M1Wd831CERAQYOkmMe8E\nACTCllmH+cQAxQoLC+vUqVPp7hsXF2fdYuRBcI7ds6OWE9HQLlsLXM+YdV7aYt4JAEiB7bIO\n84kBwP4EG7vU1FTbbRXzTgBAImyXdZhPDAD2J9jYubi45P3JiDihxUoB804ATCz/XpgJviBW\nOrbLutLNJy5ySPAPrtFotGJ5ACBLgo0dsaxVM0ZErY+9eDvRYDQu6971Wtvh8956WWVx7mHe\nCYAJvhdW9myWdaWbT7x7926hIXHmzBlLawIAuRNs7P6e1vrtTZ5RizfMHdyDiML7t107aVB4\ngu+RBa0s3CTmnQCYWP69MBN8Qax0bJd1vJLOJ27btm10dHThd+yioqLq1atnlZIAQMYEG7uJ\nK0++H3d/RHX3RUM5Imow6O0/w9U+z46lBacs3CTmnQAUYMn3wkzwBbHSsV3WUanmEyuVyu7d\nuxe+PioqSqGwySmUAUBOBBu7q5mG57yeOmOnzqeRQf+h5ZvEvBMAkA7bZR3mEwOA/Qk2dpH1\nvSfN/OHo50P5i0b9g6Wjh/s8G2mFTWLeCQBIhu2yDvOJAcD+BBu7cdt/iG3Sy2frvJysnLat\nm58/ejQnuMvW3eOtstVSfDyBeScAYAu2yzrMJwYA+xNs7Jx82+26knDwz93nLl7JVLgGz/uq\nQ4t6SmtssnQfT2DeCQDYgu2yDvOJAcD+hE93QsQpXMI7dAvvYOVN4uMJAJAUG2UdfhcbAOxP\nsLEbM6bo3FmxYoWFm8THEwAgHbbLOvwuNgDYn2Bj5+rqavqbGbNuXji0JfZoi9dnW75JfDwB\nANJhu6zj4XexAcCeBBu7BQsWFLjm0saRoSOjM5a/56Sw6Izs+HgCAKTDdlkHAGB/YnPsCqj5\n8qfZA3we5RgDNBZNLMbHEwAgZdbKujciOl3MyBa6dffu3ZasHACgSIKNncFgyH+RGdL3rxuv\ncQ+3MOlM8PEEAEiB7bJu9oIZc8cN+PJA2qefYJIJANiJYGOnUhW8SaFyH7vqHxvXAwBgV7bL\nOv96bRZtWb7Kf+yUKVMsXxsAgDkEG7tbt24VuMbdt7KbGmeMAwBZsWnW6Sr0fHPkAausCkA6\nivyRz5LifxQUrE6wsevTp4/I3Toti/mgoU/pNol5JwAgHbbLOiIi4hYvK/jlDABHt337dqEf\n+YQyJ9jYzXites+x0R0GjOrctK6HIu3ckR1fbtjVe+7nnau4EJFLck6pN4l5JwAgHbbLOgC5\nysjIIKIhQ4aEhYWVeiXR0dF79+61XlGQS7Cx+3XutmFbT6/pXi338thJ4/u+ETbhzPrLSyzc\nJOadAIB02C7rAOQtLCysU6dOpb57XFycFYsBE8F5JN8npL3Wxj//Nf5tRqXcWGeVreoq9Hxz\n5ECrrAoAwBI2zToAADsTfMfupYpO0xbu2PdBt7zWj+1cNFnnWfre/GmYdwIAkmDjrCuxIqel\n89PMjUZjGRUFAA5D+Jcntn3asEVvvx9bRISHunOppw/G/nVeP/u3s/YsDkCarPKNMB6+F1bm\npJZ1u3fvFpqWfubMGTsXAwAOR7Cx82k49lL8C9+t3XzkzJXHBmXTfu9+PGhk8+quQsvbGl7F\ngnTgG2FyIrWsa9u2bXR0dOGsi4qKqlevXllVBQCOQuwnxbTedUdMmT2CGFHZ/2AiXsWCdFjl\nG2E8fC9MCiSVdUqlsnv37oWvj4qKUihwJlEAKIZwY8eyVs0YEbU+9uLtRIPRuKx712tth897\n62VVGeUeXsWC1Fj4jTAevhdW9iSWdQAAlhBs7P6e1vrtTZ5RizfMHdyDiML7t107aVB4gu+R\nBa3sWN4TeBULALYgtawDsCn8aITsCTZ2E1eefD/u/ojq7ouGckTUYNDbf4arfZ4dSwtO2bE8\nAADbQtZBuYIpwrIn2NhdzTQ856XNf43Op5FB/6HtSwKAssR/G8lar8h1Ol1ERIRSqbTK2mwB\nWQflCn40QvYEG7vI+t6TZv5w9POh/EWj/sHS0cN9no20V2EAUDbOnz9PRFFRUVFRUVZZYUxM\nTLdu3ayyKltA1kE5hB+NkDHBxm7c9h9im/Ty2TovJyunbevm548ezQnusnX3eHsWBwD2l52d\nTVb6zm9cXNz69ev5dwgkC1kHAHJSdGPHjGnfx1zdeCH+0r695y5eyVS4Bs/7qkOLetL9NAWg\nODircIlY5Tu/0oesAwCZKbqx4xQu66aMS+rYb3KHbuEd7FwSgE1gyjAUhqwDKOesNatYOvOJ\nBT+K/WnH0t4vj6z80Vvh9arqVE/OJ+Ln52eXwgCsDGcVhiIh6wDKMyvOKpbIfGLBxs636RtE\ndKDzpgLXM8ZsWxGALeGswlAAsg4cBU5BZwtWmVUsqfnEgo1dYmKiPesAACgTyDpwFJhPYjty\nmlVcRGNXsWLFrZfjW3p4ENGuXbsatmnnhd/WgTKCbzyA7SDrwLHgFHRgjiIauwcPHmTnfQbR\noUOHPxMz23poCy8GYAd4hQq2g6wDu7Hip6g4BR2IE/woFkAK8I0HAJABvEYFuymbxu7GgY2L\nVv1w4Pjp2/eTspjKs6J/aOOWA1+f3Dc8qEzqAZ4VP/c0Go2nT58ODQ1VKBTFLy3MKq9QeXid\nCvaHrCtbVsk0q6QZH2X4FBXsoAwau0vfjqozfHO3oSOGTuwd4OOpJEPSw4TTR/eObxeyY9Wp\n1UNqFXmvIp+f/FOFPwmNEAk2K5Jd1bFjx+bPn2/hSmzBKj3Z9evXsSo7l1TOm2lHzDqr5Il0\nViLZTLOEhU8rqzzBJbISiZRh+d2tiyv8lX6O44ZGzqquUxLR+++/b/qbN3v2bAs32c7LqcHP\nVxa2qVzg+kenlvi32pqZuKfIe+3cubNjx45F3jRnzpyZM2cKbU7kjgBgBxI5t1NhyDoAsCKJ\nZF0RjV3z5s1F7mD5VwsralTf3U3r7FVwkrIh66bWrUGO/kGR9yryxajRaLxw4UJkZKRGoxHa\nHN6xc+hVSbAk2a/KiiWRlM7GXhiyrjDpvNmGlWAljlIGTzpZV0RjZ2tftq3yscvALV9Mb1zN\n03RlSvypxe+8svzaGwkHJti5Hp5er//kk09q165tlX/M7MloNJ46dap+/fqo3G4cuvJi+wOw\nFjtnnWOFmAM9iVCqjThQtQ6WnMzustPOju5SX8FxnpWr1gt9Nqx+aDV/byIK7fz6vyl6+9fD\nmzNnTlk/FAB2MmfOnLJ6opUrds46hBiATTlKcpbBlydUznVWxP47/8bpA8dOJzxI1DOVR8WA\n+o3CQ4M87F+MSUhICBG99dZb4p/OSNDBgwejoqJQuT05euX8aAdbs3PWOVaIOdCTCKXaiANV\n61jJWWbnsXMPCu0SFFpWWy+Mfyu4efPmffv2LetaSiwqKgqV25lDVy79Dz7kxG5Z53Ah5kBP\nIpRqIw5UrQMlp2NUCQAAAADFQmMHAAAAIBNo7AAAAABkAo0dAAAAgEygsQMAAACQCTR2uZyc\nnEz/dyyo3P5QOUiQYz24DlQtSrURB6rWgUqlMvnlCWkyGAy7du1q3769FH4PpERQuf2hcpAg\nx3pwHahalGojDlStA5VKaOwAAAAAZAMfxQIAAADIBBo7AAAAAJlAYwcAAMoBJdYAACAASURB\nVAAgE2jsAAAAAGQCjR0AAACATKCxAwAAAJAJNHYAAAAAMoHGDgAAAEAm0NgBAAAAyET5bezS\nbv0xuFMjTxett3+NXhMX3cs2Fljgr4EhXD7PTT9WJnUWVmzlOenn3urbIaiCS/X6zaev+adM\nihSRfndd7SZLi7xJssecJ1K5ZI+5OYVJ/LCDkLv7vuzYoIazVlu5ep3X3vu2YBAQkZRGpgNF\nrsNlrEg0kZQOLM8hgrTYSqR2VJ/Cyidjdldf5zqDPzly/ub5f7Z193ep2W9zgUWWhXg9/1n0\n0Txnb6WVSaUFmVH5p+GV/MInHz57de+WOc5K5cLzj8uk0iLdv3picrifR7WPirxVosecMVZc\n5ZI95uYUJuXDDkJyMq9V06n6fvLDuRu34/78Jkir6vfLtcKLSWVkOlDkOlrGikcTk86BZYw5\nTpAWW4mkjmoB5bSxS4lfwimcbmXl8BfvHhmg0gYWWOZFb92UK4l2L60YxVaelfSXguM23k/n\nL25uExDY8Rd7Vylg74BnXV1dnbVKoWe1NI85K65yyR5zMwuT7GEHEY8ujlK71DfmXYwOrxzU\naUeBZaQzMh0och0rY4sNVSaZA8scJ0jNqUQ6R7WwcvpRrEoX/OmCLwI0Sv6iIdOgUPvkX4AZ\nUncnZv0X2buyl7Nv1ToDZ65LN7KyqLSgYitPubFK6VS7n48Tf7HRxFoP4zbau0oBrb+PS0lJ\nObakaZG3SvaYU3GVS/aYm1OYlA87iHAP+vDC6T84IiJihpTfbqYGvFi5wDLSGZkOFLmOlbHi\n0URSOrDkOEFabCWSOqqFqcq6gLKh8454e3Lu32nx+4f02dZ4wq78C2Q+/l3PSFN/9KGob++e\n+X3MS2+0yqh5bGGrMqj1acVWnnb9jsq5jumiW7BXTvpZe1ZYapI95sWS7DE3pzDHPezlnFJb\nqXo1IqKOrcMvnzuRVW/c+Qn1CiwjnZHpQJErs4yVzoEtlnQObLGVSPyoltPGjscMKd/Pf3vK\nB+ueH7tk+9xm+W9y8umVmZml0aiJqKr/8E2rv6s7ahItlMrsSJHKGWMccU8ucxxjOfaur1Qk\nfsxFSPaYm1OY4x524H0wb17ClaOfvDlj6KJBP019Lv9NUhuZDhS5sslYqR1YEdI5sMVWIvGj\nWl4+ir29twv/1RWdR0v+moy7e3uGBr2zLXnF39djokaruAL3UPKPGa9is6bZ6afK5J3Wklbu\nWq1SdsYF08XUK4/VzgVfx9tH4cqLI5VjTiUsXjrHnJ6u3LzCJHTYQVz+Bzfr4e1bCRlEFN6i\nzcuDp2xaG/7bJ+8WWL4MR6YDRa5jZawD5WpJS5XOcDWjEmnHZhnO7ytLhoyulVzC31qvNxZ9\n+43YUa06v2+6ePXnTk7eEXaqTVxxlWcl7iGi6IcZ/MXozoFVOmy1X3lmOLcyvMiZs9I95nmE\nKpfsMTenMOkfdijS6aim7lXfM128+nO7wg+chEamA0WuA2asUDQxSR3YPNIP0mIrkeBRza+c\nNnb348aodNWPnTptcubsJcbYn19/+U30TcZY5qPf3FWKgQt/un7nzsm9G5p7aCOWninrqhkT\nrpzlK35eU7/ALh9deZByZu+KChr1Z5I59Qav8LOar1yyx9xEqHIm4WMuVJj0hzqIS7+32Vmp\nevurHTfu3Dtz8Kf2Pk4Np+znbzI9uEwyI9OBItcRM1YkmqRzYE0KVCvB4SpSiUP8a1VOG7t/\nP32+wDuXaue6jLGRlVyDXvyDX+bGjuVdWjbwcXUKqt1g9MdbDGVasIlQ5Sxf8frUf0dHNHbV\nqrz86729+kiZ1luEwhlkqlyax9xEpHLJHnOhwqQ/1KFY5378uEXdKk5qrX+NugOnrkgz5L7F\nlP/BlcjIdKDIdcSMFYkmJpkDa1KgWgkOV5FKHOJfK44xCX0uDAAAAAClVl6+PAEAAAAge2js\nAAAAAGQCjR0AAACATKCxAwAAAJAJNHYAAAAAMoHGDgAAAEAm0NgBAAAAyAQaOwAAAACZQGMH\nAAAAIBNo7AAAAABkAo0dAAAAgEygsQMAAACQCTR2AAAAADKBxg4AAABAJtDYAQAAAMgEGjsA\nAAAAmUBjBwAAACATaOwAAAAAZAKNHQAAAIBMoLEDAAAAkAk0dlC+XNkwf2+SvqyrAACwGsQa\n5IfGTlaSrr7t5NXB/OVT4xdqXOqVYkN3D3dzD3ynpPcqUXk5Gec5jjufkVPSrQjJTrk47+3X\n+731wciefWd8vi2HERE1ctN2O3zXWpso4NVA79H/JRqz73AcdyIt20ZbAZC9EkUHYu2dQHcu\nj9bVu3HHAVvjHvHL61MOchx3J9torQLy4xPPFmuGEkFjBw6OGcxbKqVbcIN9iueGPVehy4TB\nV5cNfmHuPzbdIhFlZ2ZlM1bKrQBAeWZGzojE2rPTfrt27dq1a9eO7936UvVbfZuE/ng7jYhU\n2qqfffaZm5IrfuU5Je4+zU+8lCybdJbAQ2MnQ4e/HFejoptbpZpdhsy6m/fKLGH3is6NQly0\nai+/wJ6jP8ks9LTaM6+7s0+rf5L0GXf/GtmtdWAFZ2//4GHT1+jznqcPjm/o2KSeh4tP43Z9\nt99KFa9BZHOFyyu2tuTLMX1bhbrpNN7+z4ycs5kR8W+DXYt5v5KLTqV1r99uyInU3LfEiqw/\n9fbSvZlhsZ+OfbaCrmrTF5dHj7734xqR+guvRGSL6bf/7N0qzF3n+myH1//3YcOQAX8R0cRn\nqvzyKOO7xtU7rjxPRI/+3RBeq5JO51G/7eCTePcOoORKER2OFWsknGwljTWNV+WqVatWrVq1\nXqM2767a91lTGt/3ByIyZN99++23UwxMqEK+gN2LhrjptGpnz65v/e/ekbVNg311Tp6Ne73F\n37HIYvInXpELGLKucRyXdGF963qVXt4Tb+6jDqXAQEYSr0zhFE6+TUYdOHX15N5N4RV0wQO2\nMsaYUV/bWR0xb/PNO/cvHv+tiZum165bjLGUW5+pnesyxk6ve0Pj/My2m6lGQ1pXP+em4z8/\ndy3h3JGYrpVdGk3bxxjLSjrgp1G2f3vN6atXtn892UmjcKsyVbAOgc0VXZ7Awtnp54joXHq2\nIft+uIe28ailp6/GH9nxZU0n1UvrLxn0CURUuWafAxcSHt080b+K6zMjDzDGhOpPvb1Mqan0\nb4p+7yvBn91KMVXa0FXT9dCdguUXtRLBLWY/au2l6zzz+8vxV39ZNIjjuOBX9vLr6ePjPPzi\nI/6OAcF9DlxIeHzrRL8qrnXHHrTaQw5QDpQoOhw31hhjReZMSWNtahW3xp/E5a/93omhSk2l\nLCPTpx4nogS9QajC3ALaTL14J+nczgUcx3kH9Drw3/3bZ2MDtMp+/9wVKoblJZ7QAjmZV4mo\nQ71eW/Yfv5ORY9UBAk9BYycriVemENFPD9L5i/F7hivVPmkGozH70cqVKx9lG/nrv6rlHb7y\nHMtLwFs75jgpVatOPmSMPTwzVuPWKCt3QXbn0Cta93DG2Omops4V+xnyNvRNG3+RBBTaXJHl\npWY9LHJhUwLePTpI7VI/KSd3gZMfNXILmMinz5hj9/grT3zY0KfuVpH6GTNEvhCg83m2c033\nASt/TkjL5hcosrErciVCW7x3bJjWo2Ve+WyYn0uRjd2bx3PveGzGc77PxQgdOgAorETR4bix\nxvL6qgI5U9JYK9zYpd/bQEQnUvWmxk5od/gClt1O5a9/1kXTddct/u/51T1brbsoXExu4gkt\nwDd2bxy+K3SEwVpUdnxzEOxB5VSzdwUn/u+KjcYasr/+O1nfwdNr+MAOP3695OTZCxfOHo+9\n9Pj5vOUN+luNe33hqmCH4tNGhXk/On46O/1sgG9F/lZmzNCn5hDRra23fBrNNX1y33xETXpX\nsAZOJbi5wuUdTHcRWph3Z+d5l0oj3PMmhVTt3yz9wx+JIomodw13/kq1u5r/Q6h+IsW8P690\n2vTV5+9O/+ODwVUmOE1Y/seiEc8WWb/wSorY4u3tp1z8xqjypqz0r+Wxv6h1vpx3R5UbnnQA\nJVai6HDYWFvMXyyQM9aINS73PzN2h4gauObmm5uSq13N1fS3aDG5xBfoHeJRVHlgTZhjJz/5\nnrycioi0Ci477WTTwHrzok9VrN10zKwV62p7mxZhxszRW/6Jmd7w+4FDE3OY2kPt5j/+fp4H\nD1ONhkwi4lRc/hWb2poiiWyucHmKjDjhhfkSiStwr7xpxa6FpgAL1U9ExGna9h87qYlv5JFb\ne1f3W/JGy6uZRU9PFllJ4S0a9cb8O8UJzEr2UOG5BmCJEkSHQ8caFcoZy2Mt7c5OpcavjvOT\nHRTdnadwT0eaWDFmLOCrQRLaHA6x3ORk/LftUe6z6OGJ5SpdjeZumjv73rmg6ha3bc3bY4Z1\nbtUw2fBkHq9KFzz7xcDnZ0bXNxzoERXn3aBj2r0Npq9c3Ppt/It91xJRlZeqPDi21vR9p5Pr\nrojUILK5wuVVPzlTaGGeX7uQtLtrUw25G7+19aCTT2+hTQvVf23LwPAesbkLcYoWQ5Y4U9rx\n1KLP/CS0kiJV6lA9/d63pij96UKS0JIAUGolig7EWgE/TPitYqO5mnwtmsjuiCs2HkuUn2AL\naOxkaGT3t49euHX24M/9Xvq23uivVRw5B1bXp53ce/mBPvnur59PnHg5Me364/x3Uagr/bC6\n18FZPa56TXq1UnLT3h8e++/O5ePRfV9ZrescTkTBgxe6Jm6MmL7+Ynz83o2zh+96LLBxIipm\ncwXKcw8qpraKDRY/x53tMGHVpdv343Z/3ee9Ex0/fkto025VphZZv0e9Ssd2zzqb9z3Wuwfn\nZmmCO3npiCjjXkJ8Pok5TGglRfJr+nndnL97z91y8/7t35aN2Jimf/Ks4uj+rTSDAWc8AbCC\nkkZHeY617KR7fKBdPHXws/EdJv1t+HzzAPN3R4RYPHJ0/1aac+W3zc9PsImynuQH1pR4ZYpr\n5TcWjuteyV3n7h/Sa8yClNzJuTkLR3ep5KnzrlK7/7TVh1f0c1KpR158ZPr6GGOMGbMHV3EL\nGfpLxoP9wyNa+nvqKgTUfG32N6aZxfF/ftG2cR03ja7G871+Pz5D7OtjApsTKK/ohU2zjBlj\niRd+eqlFXRetpkqt50Z8uNGYN8P37+QsfnunFzflv8rAGBOo3/DZoCY671otAl3rd3rBy8lv\n5tZrjLGGrpoCz4jhFx8VuRKRLSae/+XFRiGuHgFdhi+J7RRYb/wh/vqfRrZ0UinbLN1NRMdT\n9fyVcZ80xpcnAEqkRNHhuLHGhHOmRLE2tYqbKdA0zh4N2/fffPwhf4cn34oVqLBAAS3ctVOu\nJPJ/Lw/2arXuonAxuYnXdsW5IhfgvzxhSkKwHY7hBKpQbtw5d3jd673/G7P2vR7tg1yt8yUG\nfcrBbzbdGDWiP39xQU2v7fOP/dmnhlVWDgAgzhaxBg4NgwDKkUp1mka82PFCp9ZWjD9OoZs5\nduDDKvXfaht0bueXs2/mbOsQYK2VAwCIs0WsgUPDO3ZQSqnxUYPf/Kvw9SqnGpu/X2j/esrQ\njdilQ6d/fvLKfe8az46a+WVk3zplXREAlBKSDRwdGjsAAAAAmcC3YgEAAABkAo0dAAAAgEyg\nsQMAAACQCTR2AAAAADKBxg4AAABAJtDYAQAAAMgEGjsAAAAAmUBjBwAAACATaOwAAAAAZAKN\nHQAAAIBMoLEDAAAAkAk0dgAAAAAygcYOAAAAQCbQ2AEAAADIBBo7AAAAAJlAYwcAAAAgE2js\nAAAAAGQCjR0AAACATKCxAwAAAJAJNHYAAAAAMoHGDgAAAEAm0NgBAAAAyAQaOwAAAACZQGMH\nAAAAIBNo7AAAAABkAo0dAAAAgEygsQMAAACQCTR2AAAAADKBxg4AAABAJtDYAQAAAMgEGjsA\nAAAAmUBjBwAAACATaOwAAAAAZAKNHQAAAIBMoLEDAAAAkAk0dgAAAAAygcYOAAAAQCbQ2AEA\nAADIBBo7AAAAAJlAYwcAAAAgE2jsACSPZc2fP/9hjrGs6wAAyINckio0dtTSQ8dx3DOvHch/\nZVRNL47jvGpG8RcbuWk5juuy97b4quJjt2zYsOGn34tZzIEYs++M6drQy1mjdXZLMrACN3Ec\nx3HczOvJJV1n6e5YwM3fO3Ecp3VrVOo1WFKJmUPCcvFHf1/wQWRkZOSMj5b8uv+y6Xpzxq2Q\nEhUvvrD8xrx0IJpEIJqE2CeahHJpY0t/juO07k1N1+zsUZ3jOIXS6V52bgt4elFTjuMUCtWp\ntGxLqrVbCJd6u2UVnmjsrOnEjLGDBg168/24si7Eaq5HD1kZeyIpi2vQtIGyrIsph6KndQls\n0uWdDxYT0ZfvT+7WKrjd5K1lXdRT5DfmZUl+DxOiqQyJ5FKL954nIn3KkUMpev6azUcfEBEz\nZq5ISOWvOf39NSJyqTSqvova7rVLiO2elWjszHLg7uPU1NSfW1Uu60Ls7cHBO0Tk6j/+0O6/\nXJVcWZdTvmQ82NR7we9KXc1v/zxARFt/W11RrdyzuM8P9zMsXHO5Hc/yU24fSkRTWRHPJb/w\n9xQcR0RfXksmIpaTuOFeukLlTkQ7tue+NbX2SjIRVev/WlntgoWk/6RDY2eWFn5erq6uvfYl\nEJE++d/pr3Wt4eepUWt9Amv3GTPnQnoOEb0T6N795D0iSjgUkf9N+CP/+7RT0zqeLhpnjwqN\n27381Y4rpptOb/20ZVhNt4o1Xx677PjiphzHVai9lr/JWangOO7Vc3eWje/p667jP2tIv713\nbJ+2QT7uapXGq3L1iMFTTybriYgZkvj37Sf8+b92wRUUCk2lGo1n/+9M2s0/ejQLcdE6BYY8\nN3PN30J7J1Th75/NXbnvLhFlpx6fNWvWzSxDkXdPv/1Hv9Z13Zxc6jZpP/WL7fmuL7raAhL2\nfKRTKhRK3XvbbxIRy3m8LHJIaJCvTutWvU6TqYs25Zg+ZmE5G+a80axeVZ2LZ/OeE86nZxfz\nsJldiYW7wBM6jPxD2f/k0chX2vm46zwrVe84+N1bekPePgnub/K19UbGPGt8NLB1PSJ6pvWw\npS1Dq1YN+vXsY3P2WmTN+cczT2Qo5q7NmBE1MsLXw8mrco0+by3iB6TQmAe7KXU0ieQSIZqI\nSC7RJPJAly6axHNJ7droNT9nIjr+3TUiSru7Js1grDnwIyK6vCaOiHIy//sjMYuIur9Z21RJ\nkfFSbP35iT06+UwJdOc4ru6Yg/zF+q4ajuNq9tlNRMT0/loVx3E9dhTzcBfITymGJyv3Wrhr\niShk8J+Z+cyv7klEnjUW8cs0dNUQ0Yt74hnLGVDNnYhUOt+69Wp7qhRE5BkyLIex2Hmz+/g6\n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\nyb3iRfnQ6kk5/fFSrM8n+2+4sSLkW2mFGzNhvgmhsUuL3eskERGRlVPFBo0aVHK2IiKJvPLF\nN0rG2OnhNYhILHXp0nM8Y+zM4i78e2zl5OuqkBARx0mm7sn+9XvInJb8q1IbOyJSOFvpSbeX\nl2bwE8tdKvg4yaU2LvzD0BRlidOt0AqLkm5ExHFiB6vskyH6rArVX23uS8MYY//MbEBEIqnz\nydcZTKP6sIkbEUmsPZq3aeWjkBBRpa6fqjSMaVTvedhkby5beyKSOciKkm5FqaS4q8Dy7TP6\nN6OedNOzysnPfpCJOI7jun8wm4g+mPSulOM4TrLuaTJjbPvYxtriJfJ/T5ZqO/Ng/g8ty7dX\nf1Yne3XEcmsicqhkk/vVXTkXfDn5VHaSiojIscbQVLXGSO8dv0M1/TqUf/iui4Kf+PMnbxhj\nOxq7Z6/aT3ez31Q9Y+VbcT17mf5NlGdfFp5iRZ/+3GOIPkSfqaKPl/nmgoTjiEgs84pVqnOt\nd1E/tLpSTn+8FOvzyfKFGys030op3PJPbLx8E0Jjxxh7dWnn8B6tfV3tJSKRtYNHi27D9t3O\nOeE0/ljPxtWspRLnyoH8M6e3Lu7YtLqdQmpl69jonT4b/37w7zAa1c8LxzR9q4JUbvfOsK/P\nf/s26U43xtier8b6+TjbuFXuNOCjG9Gn+Isim8y/Zki66a+wKOk2eO0XHRtVUcjkNRq/8/H6\nY4VWmyfdstLvV1NIiKhClw2MMXVm9NIp/at7OklldlVrNf1w6bbknDMVMuKuzR/Xr6Gfl1Ru\n93bghAO/v1OUdCtKJcVdBZbvI6F/M+pLN72rHPrz7Gp2Mm0ES+Tek9ec1b4Dp376ulebxm4O\nNmKRxM7Jq3nH/kG7LmoH1b9Xp8efG9H5bU9HubWjV8+J315Y2yL3q0yj+nXplLdreMmlUq8q\ntXqNW3A3VcX+e7+GUnzv8mTfqff9iEgktolTqRljt1e14Af9Iy7t34+f7rHyvjW697LCNlHe\nfVlgiht9enKPIfoQfaaLvmzzqjoQkc87v+Z5vqgfWh0pp7+w/Culf3Plb+wKzbdSCbf8Exsv\n3zjG/vNH98ozjTLm51+PEFGtvoOb2cmIaGePyoP+elIh4O+nR7uYuzqwFOqMF2dOnmwX+P6G\ng2d6t2/hkXOZGBQF9jILhDcFigLRp5/l7Edo7HLRpPeq6B4cneLg13nKsNav753asOMkE9ms\n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\nw0GCG1zrAAAAAElFTkSuQmCC"
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
    "par(mfrow = c(4,2))\n",
    "\n",
    "H3b <- hist(baked_abalone$Length)\n",
    "\n",
    "H4b <- hist(baked_abalone$Diameter)\n",
    "\n",
    "H5b <- hist(baked_abalone$Height)\n",
    "\n",
    "H6b <- hist(baked_abalone$Whole.weight)\n",
    "\n",
    "H7b <- hist(baked_abalone$Shucked.weight)\n",
    "\n",
    "H8b <- hist(baked_abalone$Viscera.weight)\n",
    "\n",
    "H9b <- hist(baked_abalone$Shell.weight)\n",
    "\n",
    "H10b <- hist(baked_abalone$Rings)"
   ]
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
   "duration": 9.551051,
   "end_time": "2022-12-07T02:32:39.340825",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-07T02:32:29.789774",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
