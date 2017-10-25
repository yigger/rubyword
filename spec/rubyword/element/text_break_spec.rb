require "spec_helper"
module Rubyword
  describe Document do
    before(:each) do
      @document = Document.new
    end
    let(:page_num) { 2 }
    describe "Add TextBreak" do
      subject(:textbreak) { 
        textbreak = Element::TextBreak.new(@document)
        textbreak.save(page_num)
        textbreak
      }

      it "save page break to textbreak Object" do
        expect(textbreak.numbers.size.to_i).to eq(1)
      end

      it "check the numbers pop" do
        number = textbreak.numbers.pop
        expect(number).to eq(page_num)
        expect(textbreak.numbers.size.to_i).to eq(0)
      end

      it "Write textbreak xml" do
        build = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
          xml.send('w:document') {
            xml.send('w:body') {
              textbreak.write(nil, xml)
            }
          }
        end
        result =<<-EOL
          <?xml version="1.0" encoding="UTF-8"?>
          <w:document>
            <w:body>
              <w:p/><w:p/>
            </w:body>
          </w:document>
        EOL
        expect(remove_whitespace(build.to_xml)).to eq(remove_whitespace(result))
      end
    end

  end
end