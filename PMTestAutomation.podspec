Pod::Spec.new do |spec|

    spec.name         = "PMTestAutomation"
    spec.version      = "1.0.0"
    spec.summary      = "UI test library that simplifies XCTests syntax, reduce test flakiness and improves test reporting."
    spec.description  = "Login module for ProtonMail that shows the login UI and gets the login user data"
    spec.homepage     = "https://gitlab.protontech.ch/apple/shared/pmtestautomation"
    spec.license      = "ProtonMail"
    spec.author       = "Denys Zelenchuk"
  
    spec.ios.deployment_target = "10.0"
  
    spec.source       = { :git => ".", :commit => "" }
    spec.source_files  =  "PMTestAutomation/**/*.swift"
    spec.frameworks = 'XCTest'
    spec.dependency 'SwiftOTP'
    spec.static_framework = true
  
  end
