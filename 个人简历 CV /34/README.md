Minimal-Resume
================

Minimal-Resume is a one-column and clean resume template for professional usage. It supports XeTeX. XeTeX is a TeX typesetting engine that can be [thought](http://tex.stackexchange.com/questions/3393/what-is-xetex-exactly-and-why-should-i-use-it) of as standard LaTeX (pdftex) with support for Open Type Fonts. The demo PDF is included in the project.

##Why yet another resume template?

There is no shortage of resume templates, and a moderate number of them are really good. Nonetheless, Minimal-Resume sports a number of unique features:

* It is one-column with consistent design decisions.
* Much easier on eyes, and with minimal description text, easy for fast reading.
* The font sizes and the whitespaces are carefully crafted.
* Workplaces and timestamps are highlighted instead of section titles.

## Installation

For novice TeX users, it is highly recommended to use [Overleaf](https://www.overleaf.com/), a fascinating online TeX editor. Using it is as easy as clicking on the "Open as Template" button from [this Gallery item page](https://www.overleaf.com/read/pbmdkzjfvjkw). Disclaimer: I am an external [advisor](https://www.overleaf.com/advisors) to Overleaf and often [advocate](https://www.overleaf.com/blog/267-overleaf-advisor-of-the-month-ratul-saha) for TeX and Overleaf. 

To use presento in your local computer, install XeTeX and the compulsory packages listed below. These mostly come as part of the popular TeX engines like [MiKTeX](http://miktex.org/).

Compulsory packages:
* `fontenc`, `fontspec` (supports for custom local fonts)
* `microtype`, `srcextend` (font rendering)
* `enumitem` (custom lists)

## Fonts

The fonts in use are [Montserrat](http://montserrat.zkysky.com.ar/en) by Julieta Ulanovsky and [Crimson Text](https://github.com/skosch) by Sebastian Kosch.

The fonts used are under SIL Open Font License which means they are free to use and redistribute under the terms of the respective licenses.

The fonts and their usage are already baked into the template. However for custom use (by experts only), the following LaTeX commands (without any arguments) are provided: `\montserratfont`, `\crimsonfont`.

##Custom environments

The custom environments are self-explanatory from the demo.

* `\personal{}` includes the name, address and contact details.
* `\chap{Chapter Title}{Chapter Details}` invokes a chapter, such as education or work experience.
* `\subchap{Subchapter title}{Timestamp}{Subchapter Details}` executes a subchapter, such as a particular work experience along with the timestamp and details.

## Concluding remarks

The design is largly influenced by the book [Typography for Lawyers](http://www.typographyforlawyers.com/) by Matthew Butterick (with his permission, of course).
