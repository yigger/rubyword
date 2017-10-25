require "spec_helper"
module Rubyword
  describe Document do
    before(:each) do
      @document = Document.new
    end 
    describe "Initialize Document" do
      it "return a document class" do
        expect(@document.class).to eq(Rubyword::Document)
      end

      it "return a section" do
        expect(@document.section.class).to eq(Rubyword::Element::Section)
      end

      it "add mutiple section" do
        section1 = @document.section
        section2 = @document.section
        section3 = @document.section
        expect(section1.section_id).to eq(1)
        expect(section2.section_id).to eq(2)
        expect(section3.section_id).to eq(3)
      end
    end
  end
end