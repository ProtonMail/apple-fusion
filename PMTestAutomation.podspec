Pod::Spec.new do |spec|

    spec.name         = "PMTestAutomation"
    spec.version      = "1.0.2"
    spec.summary      = "UI test library that simplifies XCTests syntax, reduce test flakiness and improves test reporting."
    spec.description  = "Login module for ProtonMail that shows the login UI and gets the login user data"
    spec.homepage     = "https://github.com/protonmail"
    spec.license      = "ProtonMail"
    spec.author       = "Denys Zelenchuk"
  
    spec.ios.deployment_target = "10.0"
  
    spec.source       = { :git => ".", :commit => "" }
    spec.source_files  =  "PMTestAutomation/**/*.swift"
    spec.frameworks = 'XCTest'
    spec.dependency 'SwiftOTP', "2.0.3"
    spec.static_framework = true
  
  end
