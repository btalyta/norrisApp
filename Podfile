# Uncomment the next line to define a global platform for your project
# platform :ios, '13.0'

def test_pod
   pod 'Nimble'
   pod 'Quick'
   pod 'Nimble-Snapshots'
   pod 'Cuckoo'
   pod 'OHHTTPStubs/Swift'
   pod 'SwiftLint'
end

target 'Norris' do

  use_frameworks!

  pod 'SwiftLint'

  target 'NorrisTests' do
    inherit! :search_paths
    test_pod
  end

  target 'NorrisUITests' do
   inherit! :search_paths
   test_pod
   pod 'KIF'
  end

end
