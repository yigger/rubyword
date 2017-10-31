# Footer

## Options
+ text_align: 'left' | 'center' | 'right'
+ nums_type: 'number' | 'roman', Desc: when you need page numer as a footer, the text(first param) must be nil

## Example
```
Rubyword::Document::generate('hello.docx') {
  # insert footer with page number
  add_footer nil, text_align: 'center', nums_type: 'number'

  # insert footer with roman number
  add_footer nil, text_align: 'center', nums_type: 'roman'

  # insert footer with string
  add_footer 'hello', text_align: 'center'
}
```