Pod::Spec.new do |s|
  s.name         = "HYScanningView"
  s.version      = "0.0.2"
  s.summary      = 'A custom view which can scan qrcode and barcode'

  s.description  = <<-DESC
                  HYScanningView is custom view which can scan qrcode and barcode. User can implement scanning in his app
                  DESC

  s.homepage     = 'https://github.com/hillyoung/HYScanningView/'

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { 'hillyoung' => '1666487339@qq.com' }

  s.platform     = :ios, "7.0"

  s.source       = { :git => 'https://github.com/hillyoung/HYScanningView.git', :tag => '0.0.2' }

  s.source_files  = "Classes", "HYScanningView/HYScanningView/*.{h,m}"

end
