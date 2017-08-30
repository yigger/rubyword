require_relative '../lib/rubyword'

rubyword = Rubyword::Rubyword.new
# section = rubyword.addSection
# section.addText('xixi')
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
default_setting = {
  'w:zoom' => { 'w:percent' => '100'},
  'w:defaultTabStop' => {'w:val' => '708'},
  'w:hyphenationZone' => {'w:val' => '425'},
  'w:characterSpacingControl' => {'w:val' => 'doNotCompress'},
  'w:themeFontLang' => {'w:val' => 'en-US'},
  'w:decimalSymbol' => {'w:val' => '.'},
  'w:listSeparator' => {'w:val' => ';'},
  'w:compat' => '',
  'm:mathPr' => {
    'm:mathFont' => {'m:val' => 'Cambria Math'},
    'm:brkBin' => {'m:val' => 'before'},
    'm:brkBinSub' => {'m:val' => '--'},
    'm:smallFrac' => {'m:val' => 'off'},
    'm:dispDef' => '',
    'm:lMargin' => {'m:val' => '0'},
    'm:rMargin' => {'m:val' => '0'},
    'm:defJc' => {'m:val' => 'centerGroup'},
    'm:wrapIndent' => {'m:val' => '1440'},
    'm:intLim' => {'m:val' => 'subSup'},
    'm:naryLim' => {'m:val' => 'undOvr'}
  },
  'w:clrSchemeMapping' => {
    'w:bg1' => 'light1',
    'w:t1' => 'dark1',
    'w:bg2' => 'light2',
    'w:t2' => 'dark2',
    'w:accent1' => 'accent1',
    'w:accent2' => 'accent2',
    'w:accent3' => 'accent3',
    'w:accent4' => 'accent4',
    'w:accent5' => 'accent5',
    'w:accent6' => 'accent6',
    'w:hyperlink' => 'hyperlink',
    'w:followedHyperlink' => 'followedHyperlink'
  }
}

# puts default_setting

puts Rubyword::XmlBuilderHelper::font_table