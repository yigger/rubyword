require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'doc-information.docx')
Rubyword::Document::generate(filename) {
  information({
    company: 'ruby word',
    creator: 'young',
    title: 'example word file',
    description: 'this is a example docx',
    subject: 'how to create doc info',
    keywords: 'remark',
    category: 'category'
  })
}