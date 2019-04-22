#Robot Framework and Python Coding Exercise


## Robot Framework

These instructions will help get a copy of the project up and running on your local machine for development and testing purposes. 


I've previously created Robot Framework test environment with docker. It can be found <a href="https://hub.docker.com/r/rharley77/robotframework_ff_chrome">here</a> and includes all of the prerequisites listed below.  


### Prerequisites


RobotFramework<br>

### Libraries Leveraged

Selenium Library<br>
String<br>
Collections<br>




### Installing

How to get a development env running locally

Install Robot Framework

```
pip install robotframework
```

Install the Selenium Library for Robot Framework

```
pip install --upgrade robotframework-seleniumlibrary
```


Install the Chromedriver and add it to Path

```
brew install chromedriver
```


## Running the tests

Test will run with Chrome by default. This can be changed in the `${BROWSER}` variable in the  `Launch.robot` file

```
robot -d results  Central/Launch.robot
```
### Viewing Test Report and Log

The Robot Framework test results can be found in the results directory.  Results are displayed as a log, report, or as xml. The logs and reports provide a detailed view of the test suite. They also allow you to drill into the each test step which is helpful for test debugging. If there is a failed test Robot Framework includes a screen shot of the point of failure.

```
results/log.html
```

```
results/results.html
```


## Python Coding Exercise

The coding exercise can be found <a href="https://github.com/rharley77/BR_Robot_Framework_Exercise/blob/master/CommonWordsFunction">here</a>
