# Text

## Style
+ font_size: Number | 16
+ color: Number | 996699
+ bgcolor: Number | 996699
+ underline: Boolean | true
+ blod: Boolean | true
+ all_caps: Boolean | false
+ italic: Boolean | false
+ text_align: 'left' || 'center' || 'right',
+ spacing: Number 200
+ indent_left: Number 100
+ indent_right: Number 200
+ indent_between: Number 200

## Example
```
Rubyword::Document::generate('hello.docx') {
  section {
    text "hello world"
    # add some style
    text "hello", { font_size: 62, color: '996699', blod: true, text_align: 'center' }
  }
}
```