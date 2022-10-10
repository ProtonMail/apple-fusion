Pod::Spec.new do |spec|

    spec.name         = "pmtest"
    spec.version      = "1.1.0"
    spec.summary      = "UI test library that simplifies XCTest syntax, reduces test flakiness and improves test code readability."
    spec.homepage     = "https://github.com/protonmail"
    spec.license      = "ProtonMail"
    spec.author       = "Denys Zelenchuk"
  
    spec.ios.deployment_target = "11.0"
    spec.osx.deployment_target = '11.0'

    spec.source       = { :git => ".", :commit => "" }
    spec.ios.source_files  =  "pmtest/iOS/**/*.swift",
                              "pmtest/Common/**/*.swift"
    spec.osx.source_files  =  "pmtest/Mac/**/*.swift",
                              "pmtest/Common/**/*.swift"
    spec.frameworks = 'XCTest'
    spec.static_framework = true
    spec.pod_target_xcconfig = {
        "ENABLE_TESTING_SEARCH_PATHS" => "YES" # Required for Xcode 12.5
    }
  end
