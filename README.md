This is a public repository I created showcasing my skills and knowledge in Robotframework. This is a Robotframework git repository that includes the testcases from https://automationexercise.com/test_cases that has been developed from scratch. This is entirely for practise purpose and whoever wanting to learn can use it too. In addition to that if there's any suggestion and improvement you believe I can make here, feel free to email me here msbajracharya.salona@gmail.com
This repo is still on developing phase as I keep on adding the test cases or improve the existing ones. 

It is written in Robotframework with selenium library.

**Pre-requisite**
-  IDE of your choice, but I suggest Visual Studio Code or Pycharm.
-  Chrome or Firefox browser
-  Chrome or Firefox driver depending on which broswer you will use to automate. It should match with version of browser you have. Driver can be downloaded from- For chrome https://chromedriver.chromium.org/downloads or For firefox https://github.com/mozilla/geckodriver/releases
    

**Getting Started**
-  Robot Framework is based on Python, so you need to have Python installed on your machine. You can download Python from the official website: https://www.python.org/downloads/
-  Once Python is installed, you can use the following command to install Robot Framework using pip (Python package installer) from the normal comman prompt or from the terminal of the IDE: ```pip install robotframework```
-  Robot Framework can be extended with various libraries. Since this repo is using selenium too, you have to install additional libraries. For example, to use Selenium for web testing, you can install the SeleniumLibrary: ```pip install robotframework-seleniumlibrary```
-  Clone this Repository in your machine
-  Make sure the driver for chrome or gecko is replaced with the one that's already in the repo, it might be updated or might not match the browser version you have. The driver naming should be same.
-  Open the repo from the IDE you installed
-  There's a file in resources/config.robot which is indicating the variable for URL, path to the driver, and file to upload. If you choose to put the driver and file somewhere else, change the path here. However the url should remain same bacause this repo is entirely based on the test cases for that website


**To Run the code**
- To run specific robot file ```robot .\tests\test_suites_01\TestCase1_register_user.robot ```
- To run all the tests from the folder test_suites_01 ```robot .\tests\test_suites_01\Test* ```
