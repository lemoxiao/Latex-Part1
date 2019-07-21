# Professional Graphical Resume

This project is a **LaTeX template** to create a **professional graphical resume**.
Honestly, it is inspired by many graphical resumes that I found on the web.
All of the objects in the project are for the **public benefit**, so you can easily customize it to create your own template.
Any contribution to improve this template would be greatly appreciated.

I put _my own resume_ on this template as _an example_ and you can add yours too.
To do so, you can use following class and packages, which I will describe later:
1. resume.cls
2. resume.sty 
3. jresume.sty 
4. switch.sty
5. sleekprogressbar.sty


### 1. resume.cls
This is a document class extended from _article.cls_, in which default vertical and horizontal spaces are discarded.


### 2. resume.sty
This package is a set of general layout commands to generate a professional graphical resume.

##### Commands and environments:
* **\trim{text}:** Trim the _text_.

* **\setfontsize{size}:** Change font _size_.

* **\twopart\[partition type]{first content}{second content}:** Split current space into two vertically separated parts and put the _contents_ into the parts.
    * _partition type:_ Must be either _sidebar_ or _equal_.

* **\align\[options]{content}:** Align _content_ according to _options_.
    * _options:_ Can be _vertical_ or _horizontal_.
        * _vertical:_ Must be _top_, _middle_, or _bottom_.
        * _horizontal:_ Must be _left_, _right_, _center_, or _justify_.

* **\header{image url}{title}:** Create a nice header with the given _image_ and _title_.

* **\skill\[location]{title}{percent}:** Draw a shiny progressbar with the given _title_ and _percentage_.
    * _location:_ The location which it is placed on and must be either _sidebar_ or _mainbar_. 
    * _percent:_ Must be between 0.028 and 1.

* **\education{university}{degree}{field of study}{start date}{end date}:** Generate a short sentence about your education.

* **\project{title}{duration}{description}:** Generate a beautiful section about your project. 

* **\experience{company name}{position}{duration}{description}:** Generate a beautiful section about your experience.

* **\reference{name}{position}{company}{email}{mobile}:** Generate a block containing reference's information.

* **\mobile{phone number}:** Generate a clickable-callable _phone number_.

* **\email{email address}:** Generate a clickable _email address_.

* **\linkedin{name}{url}:** Generate a clickable LinkedIn profile _name_ by the given _url_.

* **\contactitem{title}{description}:** Generate a general contact item.

* **textbox{width}{height}:** Create a text box with the given _width_ and _height_ and with a predetermined margin.

* **rsection\[font size]{title}:** Create a nice section with the given _title_.
    * _font size:_ _font size_ of the _title_.

* **rsectioncmd\[font size]{title}:** Create a nice section with the given _title_.
    * _font size:_ _font size_ of the _title_.

##### How to use the package:
You can use this package with _gray_ or _cream_ option as a theme.
```LaTex
\usepackage[cream]{resume}
```

##### How to use the commands:
```LaTex
\trim{ Hello world }

\setfontsize{11}

\begin{textbox}{20pt}{40pt}
    Hello world
\end{textbox}

\begin{rsection}[font size = 12]{Hello Section}
    Hello world
\end{rsection}

\rsectioncmd[font size = 12]{Hello Section}

\twopart[partition type = sidebar]{Hello world}{I love \LaTeX}

\align[vertical = middle, horizontal = justify]{Hello world}

\header{/Users/vesalian/personal-image.jpg}{Java Developer}

\skill[location = mainbar]{Java}{0.9}

\education{Oxford}{Bachelor of Science}{Software Engineering}{September 2003}{September 2008}

\project{Our company project name}{Sep 2008 - Sep 2010}{This is dummy}

\experience{Google}{Java Developer}{Sep 2008 - Sep 2010}{This is dummy}

\reference{David}{Java Developer}{Google}{david@email.com}{+1 123 123 1234}

\mobile{+1 123 123 1234}

\email{david@email.com}

\linkedin{David}{http://ir.linkedin.com/pub/david/24/609/34/}

\contactitem{Address}{Boston, The USA}
```


### 3. jresume.sty
This package is a set of customized commands, base on resume.sty, to generate a professional graphical **java** resume.
Some font sizes and spaces are preset in this package for your convenience.

##### Commands and environments:
* **\jrcaption{title}:** Writes _title_ with font size 12.

* **\jrsubcaption{title}:** Writes _title_ with font size 11 in bold face.

* **\jrsubsubcaption{title}:** Writes _title_ with font size 11.

* **\jeducation{university}{degree}{field of study}{start date}{end date}:** It is the same _education_ command in _resume.sty_ with preset spaces.

* **\jproject{title}{duration}{description}:** It is the same _project_ command in _resume.sty_ with preset spaces.

* **\jexperience{company name}{position}{duration}{description}:** It is the same _experience_ command in _resume.sty_ with preset spaces.

* **\jreference{name}{position}{company}{email}{mobile}:** It is the same _reference_ command in _resume.sty_ with preset spaces.

* **jrdescription:** This environment justifies its content and sets the font size to 11.

* **jrsection\[location]{title}:** It is the same _section_ command in _resume.sty_ with preset spaces.
    * _location:_ The location which it is placed on and must be either _sidebar_ or _mainbar_. 

##### How to use the package:
You can use this package with _gray_ or _cream_ option as a theme.
```LaTex
\usepackage[gray]{jresume}
```

##### How to use the commands:
```LaTex
\jrcaption{Hello world} 

\jrsubcaption{Hello world} 

\jrsubsubcaption{Hello world} 

\jeducation{Oxford}{Bachelor of Science}{Software Engineering}{Sep 2003}{Sep 2007} 

\jproject{Conversion}{May 2003 - May 2004}{This is dummy} 

\jexperience{Google}{Developer}{May 2003 - May 2004}{This is dummy} 

\jreference{David}{Java Developer}{Google}{david@email.com}{+1 123 123 1234} 

\begin{jrdescription}
    Hello world
\end{jrdescription}

\begin{jrsection}[location = mainbar]{Education}
    Hello world
\end{jrsection}
```


### 4. switch.sty
This package provides some useful **conditional** commands.

##### Commands and environments:
* **\xifthen\[comparison type]{test}{true}:** Perform _true_ statement if _test_ is passed.
    * _comparison type:_ Must be either _number_ or _string_.

* **\xifthenelse\[comparison type]{test}{true}{false}:** Perform _true_ statement if _test_ is passed, otherwise perform _false_ statement.
    * _comparison type:_ Must be either _number_ or _string_.

* **\xifequal\[comparison type]{first}{second}{true}:** Perform _true_ statement if _first_ is equal to _second_.
    * _comparison type:_ Must be either _number_ or _string_.

* **\xifequalelse\[comparison type]{first}{second}{true}{false}:** Perform _true_ statement if _first_ is equal to _second_, otherwise perform _false_ statement.
    * _comparison type:_ Must be either _number_ or _string_.

* **xswitch\[comparison type]{variable}:** This environment provides switch-case statement and you can use _\xcase_ and _\xother_ in the environment.
    * _comparison type:_ Must be either _number_ or _string_.
    * _variable:_ Variable that you want to test.
    * **\xcase{value}{command}:** _command_ will fire if _value_ is equal to _variable_. 
    * **\xother{command}:** _command_ will fire if none of the _xcase_ commands are fired.

##### How to use the package:
```LaTex
\usepackage{switch}
```

##### How to use the commands:
```LaTex
\xifthen[comparison type = number]{1 >= 0}{Hi}

\xifthenelse[comparison type = string]{\equal{David}{Ben}}{Hi}{Bye}

\xifequal[comparison type = number]{1}{1}{Hi}

\xifequalelse[comparison type = string]{David}{Ben}{Hi}{Bye}

\begin{xswitch}[comparison type = string]{David}
    \xcase{David}{Hi David}
    \xcase{Ben}{Hi Ben}
    \xother{Bye}
\end{xswitch}
```


### 5. sleekprogressbar.sty
This package provides a nice shiny progressbar and has just one command.

##### Commands and environments:
* **\progressbar\[options]{percent}:** Draws a shiny progress bar and has two argument.
    * _options:_ can be _width_, _height_, _color_, or _color difference_.
    * _percent:_ Must be between 0.028 and 1.

##### How to use the package:
```LaTex
\usepackage{sleekprogressbar}
```

##### How to use the commands:
```LaTex
\progressbar[width = 30pt, height = 1.5pt, color = red, color difference = 50]{0.4}
```

### Contact
Unauthorized use prohibited and needs author's permission.
Please do not hesitate to contact me at _momeni.vesalian@gmail.com_ if you have any questions.

Good luck!
