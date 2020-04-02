# install first tools:
#
# apt-get install texlive

pandoc -V papersize:a4paper \
  -V geometry:"top=3cm, left=2.9cm, right=2.5cm" \
  -f rst -t latex \
  -o $1.pdf $1.txt 

