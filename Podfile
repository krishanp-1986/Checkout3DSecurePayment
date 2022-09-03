def commonPods
   pod 'SnapKit'
   pod 'SwiftLint'
end

def testingPods
   pod 'Nimble'
   pod 'Quick'
end

target 'Checkout3DSecurePayment' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  commonPods

  target 'Checkout3DSecurePaymentTests' do
    inherit! :search_paths
    use_frameworks!
    testingPods
  end

end
