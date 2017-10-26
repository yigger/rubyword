CHANGELOG
# Version 1.1.0 - 2017-10-26
+ add paragraph feature
```
section {
  text 'hello'
  p(text_align: 'center') {
    text 'i am '
    text 'a boy'
  }
  text 'welcome to my home..'

  p {
    text 'This is a '
    text 'apple, yellow apple', bgcolor: 'yellow', text_align: 'center'
  }
}
```

# Version 1.0.0 - 2017-10-21
+ Support for setting the properties of the document, such as: title, subject, author and other information
+ Support for generated TOC for the title
+ Support for setting header and footer
+ Support for insert title which is different attributes, such as: title, sub title, etc.
+ Support for insert blank lines and blank page
+ Support for insert multiple images 
+ Support for insert multiple lists 
+ Support for insert hyperlink 
