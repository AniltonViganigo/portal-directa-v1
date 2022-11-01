*** Settings ***
Resource        keywords.robot
Resource        setup_and_teardown.robot
Resource        locators.resource
Variables       variables
########################################
Library         Collections
Library         MyLibrary
Library         RPA.Browser.Selenium
Library         OperatingSystem
