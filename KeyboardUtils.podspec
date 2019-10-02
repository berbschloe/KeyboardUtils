Pod::Spec.new do |s|
    s.name = "KeyboardUtils"
    s.version = "1.1.0"
    s.summary = "A collection of keyboard utils that makes listening to its notifications much easier."
    s.homepage = "https://github.com/berbschloe/KeyboardUtils"
    s.license = "MIT"
    s.author = "Brandon Erbschloe"
    s.platform = :ios, "9.0"
    s.source = { :git => "https://github.com/berbschloe/KeyboardUtils.git", :tag => s.version.to_s }
    s.source_files = "KeyboardUtils/**/*.{h,m,swift}"
    s.swift_version = "5.0"
end
