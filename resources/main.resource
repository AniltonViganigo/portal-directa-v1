*** Settings ***
Resource        keywords.robot
Resource        setup_and_teardown.robot
Resource        locators.resource
Variables       variables
########################################
Library         Collections
Library         SavePDFFile
Library         RPA.Browser.Selenium
Library         OperatingSystem
