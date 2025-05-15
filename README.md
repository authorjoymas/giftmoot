# Giftmoot Site

## Setting up

1. open file explorer in the location you want to have the project folder
2. right-click and open with git bash
3. paste in to the console `git clone https://github.com/authorjoymas/giftmoot.git`
4. this should create a folder named giftmoot
5. open the folder with vscode
6. open a terminal using ``` ctrl + ` ```
7. to set up, type in `npm install`
8. to run a local page preview with auto reload `npm run dev`

## Creating New Content

- Add a Markdown page to /content

## Creating Repeated Content
- Add a Markdown page to /content
- In settings.yaml add list entry with filename to either topContent (to prepend it tothe main content) or bottomContent to append it.
- The topcontent and bottom content can also be overriden in the yaml for a single page

## Front Matter Content

You can add css stylesheets to /styles if you want to insert them into a particular page you can do so using a yaml frontmatter for the markdown page.

```yaml
 ---
  css: default.css
  background: file or css
  topContent:
    - file.md
  bottomContent:
    - file.md
 ---
```

## Custom Markdown

### Advanced Images

A standard image is specified like so
`![My Image](image-src)`
You can add a url link to an image
`![My Linked Image](image-src)(link.html)`
You can set the size of the image as a percentage of the width
`![My sized Image|20](image-src.png)`
You can align the image
`![_|My sized Image](image-src)` Centre aligned
`![<|My sized Image](image-src)` Left Aligned
`![>|My sized Image](image-src)` Right Aligned
Or do any combination
`![<|My left aligned sized image with a link|50](image-src.png)(link.html)`

## Footnotes

A footnote link is done like this[^footnote] or like this [^1]
then add the footnote description at the bottom liket this
[footnote]: a footnote using an id with letters
[1]: a footnote using an id with a number
