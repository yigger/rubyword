# Table

## Example
```
Rubyword::Document::generate('hello.docx') {
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
```