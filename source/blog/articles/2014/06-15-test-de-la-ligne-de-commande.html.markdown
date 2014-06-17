---
title: Test de la ligne de commande
date: 2014-06-15 21:36 CEST
authors: Guillaume
tags:
---

Like Middleman itself, the blog extension is focused on individual files. Each article is its own file, using any template language you like. The default filename structure for articles is {year}-{month}-{day}-{title}.html. When you want to create a new article, place it in the correct path and include some basic frontmatter to get going. You can set the blog.sources option while activating :blog in your config.rb to change where and in what format Middleman should look for articles.

## Generating Articles

As a shortcut, you can run middleman article TITLE and Middleman will create a new article for you in the right place with the right filename. You can pass --date, --lang, and --blog options to this command.

If you want to use your own template, you can set blog.new_article_template to the path (relative to the project root) of an ERb template that will be used by middleman article. This template can use the instance variables @title, @slug, @date, and @lang to generate your new article.
