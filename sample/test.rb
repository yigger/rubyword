require_relative '../lib/rubyword'

rubyword = Rubyword::Rubyword.new
section = rubyword.addSection
section.addText('xixi')
rubyword.save
# def test
#   <<-STR
#   <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
#   <Relationships
#       xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
#       <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/>
#       <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/>
#       <Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/custom-properties" Target="docProps/custom.xml"/>
#       <Relationship Id="rId4" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
#   STR
# end
# puts test
# puts Rubyword::TEMP_PATH
# include Rubyword::XmlBuilderHelper
# puts Rubyword::XmlBuilderHelper::content_types