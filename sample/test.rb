require_relative '../lib/rubyword'

rubyword = Rubyword::Rubyword.new
section = rubyword.addSection
section.addText('xixi')
# rubyword.save

# openXMLPrefix = 'application/vnd.openxmlformats-';
# wordMLPrefix  = "#{openXMLPrefix}officedocument.wordprocessingml";
# overrides = {
#   '/docProps/core.xml' => "#{openXMLPrefix}package.core-properties+xml",
#   '/docProps/app.xml' => "#{openXMLPrefix}officedocument.extended-properties+xml",
#   '/docProps/custom.xml' => "#{openXMLPrefix}officedocument.custom-properties+xml",
#   '/word/document.xml' => "#{wordMLPrefix }document.main+xml",
#   '/word/styles.xml' => "#{wordMLPrefix }styles+xml",
#   '/word/numbering.xml' => "#{wordMLPrefix }numbering+xml",
#   '/word/settings.xml' => "#{wordMLPrefix }settings+xml",
#   '/word/theme/theme1.xml' => "#{openXMLPrefix}officedocument.theme+xml",
#   '/word/webSettings.xml' => "#{wordMLPrefix }webSettings+xml",
#   '/word/fontTable.xml' => "#{wordMLPrefix }fontTable+xml"
# }
# puts overrides.keys[0]
# 10.times.each do |r|
#   puts r
# end
puts Rubyword::XmlBuilderHelper::numbering