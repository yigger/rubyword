require "spec_helper"
module Rubyword
  describe Document do
    before(:each) do
      @document = Document.new
    end
    let(:section) { @document.section }
    subject(:text_obj) { 
      Element::Text.new(@document, section)
    }

    context "Add A Simple Text" do
      it 'should return nil' do 
        text = text_obj.save(nil)
        expect(text).to eq(nil)
        text = text_obj.save('simple', nil)
        expect(text).to eq(nil)
      end

      it 'should return queue object' do
        text = text_obj.save('sample text', 'text')
        expect(text.class).to eq(Queue)
      end

      it 'should return hash' do
        string = 'sample'
        text = text_obj.save(string, 'text')
        expect(text.pop.to_s).to eq({size: 'normal', text: string, style: nil}.to_s)
      end

      it 'should output xml' do
        string = 'sample'
        text_obj.save(string, 'text')
        build = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
          text_obj.write(section, xml)
        end
        result =<<-EOL
        <?xml version="1.0" encoding="UTF-8"?>
          <w:p>
            <w:r>
              <w:t xml:space="preserve">sample</w:t>
            </w:r>
          </w:p>
        EOL
        expect(remove_whitespace(build.to_xml)).to eq(remove_whitespace(result))
      end
    end
    
  end
end