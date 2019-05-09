# Posting new books

1. **Use MD posting template or use DOCX posting template and either contact the administrator or convert it to MD by your self using the ps1 script in docs**
1. **Only use formating that is already existing in the templates**
1. **Never forget to include an apropriate header - example is down below**
1. **If the category or authors name is already used in the category or tag block, use the existing one**

```
---
title: <book name>
layout: post
categories: [SV-20-21|SV-CZ-19|SV-20-21|CZ-20-21]
tags: [<author name>]
---
```

# Converting docx to md

### prerequisites:

- [pandoc](https://pandoc.org/installing.html)
- [powershell](https://github.com/PowerShell/PowerShell/releases)

### steps:

1. make sure that the document name is in lowercase separated by '-'
1. fill queue folder with docx documents
1. execute **docxToMd.ps1**
1. that is all

# Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/Feelav/LittleRatura/edit/master/README.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1

## Header 2

### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/Feelav/LittleRatura/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
