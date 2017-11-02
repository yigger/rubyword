require_relative '../lib/rubyword'
filename = File.join(Rubyword::TEMP_PATH, 'test.docx')
Rubyword::Document::generate(filename) {
  # Generate the directory structure
  title_directory font_size: 24
  section {
    # insert title
    title_1 "It's a title", ignore_dir: true 
    # insert subtitle
    title_2 "It's a subtitle"
    # insert title
    title_1 'Database'
    # insert subtitle
    title_2 'MySQL'
    # insert No.3 title
    title_3 'NoSQL'
  }

  section {
    title_1 'section1 title'
    title_2 'section2 title'
    title_3 'section3 title'
  }
}