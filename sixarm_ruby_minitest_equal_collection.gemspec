# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name           = "sixarm_ruby_minitest_equal_collection"
  s.summary        = "SixArm.com → Ruby → Minitest → equal_collection assertion & extension"
  s.description    = "A Minitest assertion & expectation to compare two collections, such as enumerations or arrays, in any order, and with output that shows the difference"
  s.version        = "1.3.0"

  s.author         = "SixArm"
  s.email          = "sixarm@sixarm.com"
  s.homepage       = "http://sixarm.com/"
  s.licenses       = ["Apache-2.0", "Artistic-2.0", "BSD-3-Clause", "GPL-3.0", "MIT", "MPL-2.0"]

  s.signing_key    = "/opt/keys/sixarm/sixarm-rsa-4096-x509-20180113-private.pem"
  s.cert_chain     = ["/opt/keys/sixarm/sixarm-rsa-4096-x509-20180113-public.pem"]

  s.platform       = Gem::Platform::RUBY
  s.require_path   = "lib"


  s.files = [
    "Rakefile",
    "lib/sixarm_ruby_minitest_equal_collection.rb",
    "lib/sixarm_ruby_minitest_equal_collection/minitest/assertions/equal_collection.rb",
    "lib/sixarm_ruby_minitest_equal_collection/minitest/expectations/equal_collection.rb",
  ]

  s.test_files = [
    "test/sixarm_ruby_minitest_equal_collection_test.rb",
    "test/sixarm_ruby_minitest_equal_collection_test/minitest/assertions/equal_collection_test.rb",
    "test/sixarm_ruby_minitest_equal_collection_test/minitest/expectations/equal_collection_test.rb",
  ]

  s.add_dependency('hashdiff', '>= 0.3.7', '< 2')
  s.add_development_dependency('rake', '>= 12.2.1', '< 13')

  s.add_development_dependency('minitest', '>= 5.10.3', '< 6')
  s.add_development_dependency('yard', '>= 0.9.9', '< 2')
  s.add_development_dependency('simplecov', '>= 0.14.1', '< 2')
  s.add_development_dependency('coveralls', '>= 0.8.21', '< 2')

  s.required_ruby_version = ">= 2.2"

end
