require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'table.docx')
Rubyword::Document::generate(filename) {
  section {
    table {
      tr {
        th 'id'
        th 'name'
        th 'age'
      }
      tr {
        th '1'
        th 'young'
        th '66'
      }
    }
  }
}