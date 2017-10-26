# List

# Options
+ level: Number

```
Rubyword::Document::generate('hello.docx') {
  section {
    list 'list-1', 1
    list 'list-second', 2
    list 'test3', 2
    list 'test2', 1
    list 'test2', 1
  }
}
```