require "spec_helper"
module Rubyword
  describe Document do
    before(:each) do
      @document = Document.new
    end
    let(:page_num) { 2 }
    describe "Add pagebreak" do
      subject(:pagebreak) { 
        pagebreak = Element::PageBreak.new(@document)
        pagebreak.save(page_num)
        pagebreak
      }

      it "save page break to PageBreak Object" do
        expect(pagebreak.numbers.size.to_i).to eq(1)
      end

      it "check the numbers pop" do
        number = pagebreak.numbers.pop
        expect(number).to eq(page_num)
        expect(pagebreak.numbers.size.to_i).to eq(0)
      end

      it "Write pagebreak xml" do
        build = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
          xml.send('w:document') {
            xml.send('w:body') {
              pagebreak.write(nil, xml)
            }
          }
        end
        result =<<-EOL
          <?xml version="1.0" encoding="UTF-8"?>
          <w:document>
            <w:body>
              <w:p>
                <w:r>
                  <w:br w:type="page"/>
                </w:r>
              </w:p>
              <w:p>
                <w:r>
                  <w:br w:type="page"/>
                </w:r>
              </w:p>
            </w:body>
          </w:document>
        EOL
        expect(remove_whitespace(build.to_xml)).to eq(remove_whitespace(result))
      end
    end

  end
end