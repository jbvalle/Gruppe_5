<div id="top"></div>

<!-- PROJECT LOGO -->
<br />


<div align="center">

<img src="./doxy/images/logo.png" width="20%" height="20">

<i>Requires GCC Version 9.x.y or below! This project generates a seat tracking system, which registers all people occupying a possible seat. Additionally a coverage system is applied for a customized distribution, and a neighbour tracking register is implemented for displaying all direct and indirect neighbours</i>
<br />
<br />

</div>

<hr>

<!-- ABOUT THE PROJECT -->
## About The Project

<strong>1 Part: (SOLVED)<br /></strong>
* Implement a user interface<br />
* For this purpose the GTK3 Framework has implemented<br />

<strong>2 Part: (SOLVED)<br /></strong>
* Generate a seating pattern using costumized rows and columns <br />

<strong>3 Part: (SOLVED)<br /></strong>
* Assigning a seat after user input <br />

<strong>4 Part: (SOLVED)<br /></strong>
* Saving the entered Student ID and its seating position <br />

<strong>5 Part: (SOLVED)<br /></strong>
* Requesting and display all direct neighbours relative to a user defined student ID<br />

<strong>6 Part: (SOLVED)<br /></strong>
* Requesting and display all indirect neighbours relative to a user defined student ID<br />

## Pattern generation
### 25% Coverage has been implemented using following algorithm


<img src="./doxy/images/25cov_pattern.png" width="40%" height="40">
<img src="./doxy/images/row_col_deter_25cov.png" width="40%" height="40">

<hr>


<!-- GETTING STARTED -->
## Getting Started

### Installation

* 1. Build Program from root directory
   ```sh
   make build
   ```
<hr>

<!-- USAGE EXAMPLES -->
## Usage

* Run Main Program (from root directory)
   ```sh
   make run
   ```
* Test Program using Gtest (from root directory)
   ```sh
   make test
   ```
* Generate Coverage Data (from root directory | REQUIRES `MAKE TEST` COMMAND)
   ```sh
   make gcov 
   ```
* Access Coverage Data through html (from root directory)
   ```sh
   make report
   ```
<hr>

## Documentation

* Access Doxygen Documentation (from root directory)
   ```sh
   make doxy
   ```
<hr>
