Pod::Spec.new do |spec|

    spec.name         = "pmtest"
    spec.version      = "1.0.2"
    spec.summary      = "UI test library that simplifies XCTest syntax, reduces test flakiness and improves test code readability."
    spec.homepage     = "https://github.com/protonmail"
    spec.license      = "ProtonMail"
    spec.author       = "Denys Zelenchuk"
  
    spec.ios.deployment_target = "10.0"
    spec.osx.deployment_target  = '10.15'
  
    spec.source       = { :git => ".", :commit => "" }
    spec.source_files  =  "pmtest/**/*.swift"
    spec.frameworks = 'XCTest'
    spec.static_framework = true
  
  end
