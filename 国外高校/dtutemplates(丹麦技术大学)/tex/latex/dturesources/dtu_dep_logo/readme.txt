 
To convert the eps files from portalen to pdf use: 
for i in *.eps; do epstopdf $i; done (recommended)

To reduce the file size of the eps figures:
for i in *.pdf; do pdftops -eps $i; done

...or all in one go:
for i in *.eps; do epstopdf $i; done; for i in *.pdf; do pdftops -eps $i; done