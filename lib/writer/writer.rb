module Rubyword
  module Writer
    class Writer
      PARTS = {
        'ContentTypes'   => '[Content_Types].xml',
        'Rels'           => '_rels/.rels',
        'DocPropsApp'    => 'docProps/app.xml',
        'DocPropsCore'   => 'docProps/core.xml',
        'DocPropsCustom' => 'docProps/custom.xml',
        'RelsDocument'   => 'word/_rels/document.xml.rels',
        'Document'       => 'word/document.xml',
        'Styles'         => 'word/styles.xml',
        'Numbering'      => 'word/numbering.xml',
        'Settings'       => 'word/settings.xml',
        'WebSettings'    => 'word/webSettings.xml',
        'FontTable'      => 'word/fontTable.xml',
        'Theme'          => 'word/theme/theme1.xml',
        'RelsPart'       => '',
        'Header'         => '',
        'Footer'         => '',
        'Footnotes'      => '',
        'Endnotes'       => '',
        'Chart'          => '',
      }

      def save
        # zip打包下载
        
      end
    end
  end
end