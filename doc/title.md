# Title

## Options
+ ignore_dir: Boolean. Desc: Doc will ignore add this title to TOC

```
Rubyword::Document::generate('hello.docx') {
  section {
    title_1 "It's a title", ignore_dir: true 
    title_2 "It's a subtitle"
  }
}
```