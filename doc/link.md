# Link

## Example
```
Rubyword::Document::generate('hello.docx') {
  section {
    link 'baidu', 'http://www.baidu.com', text_align: 'center'
  }
}
```