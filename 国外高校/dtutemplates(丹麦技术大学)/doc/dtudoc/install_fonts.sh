#!/bin/bash
#
##########################################
# A helper script that installs additional
# fonts on a Linux machine. 
##########################################
#
# The script has not been tested that much
# and still seems quite hacky. However, it
# should give you an idea about what you 
# have to do to make some of the DTU fonts 
# available in your Latex distribution.
#
# Written and maintained in 2011-2014 
# by Jorrit Wronski (jowr@mek.dtu.dk)
#
##########################################
# Functions to be called later on
##########################################
SEP="<-------------------------------------------------->"
#
function testInstalled {
  APP="$1"
  command -v "$APP" >/dev/null 2>&1 || { echo >&2 "Cannot find $APP - aborting. You can try installing it by running
  sudo apt-get install $APP"; exit 1; }
  return 0
}
#
function checkSystem {
  testInstalled wget
  testInstalled unzip
  testInstalled cabextract
  testInstalled wget
  testInstalled git
  testInstalled tar
  echo "Install lcdf-typetools if you have trouble with \"mmafm\"."
  testInstalled mmafm
  testInstalled fontinst
  testInstalled updmap
  testInstalled texhash
}
#
function getFile {
  PKGFILE="$1"
  PKGLINK="$2"
  if [ -f "$PKGFILE" ] 
  then
    echo "$PKGFILE exists, skipping download."
  else
    echo "Downloading $PKGFILE"
    wget -q $PKGLINK
  fi
  return 0
}  
#   
function nonfree {
  APP="getnonfreefonts"
  command -v "$APP" >/dev/null 2>&1 || { echo >&2 "Cannot find $APP. 
  You might be able to install it by running:
  wget http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts; sudo texlua install-getnonfreefonts"; exit 1; }
  #
  THEFONT="$1"
  getnonfreefonts $THEFONT
  return 0
}
#
function verdana {
  mkdir -p "$INST" "$TEMP"
  pushd "$TEMP"
  echo " "
  echo "$SEP"
  echo "Installing the Verdana font, check "
  echo "http://www.ctan.org/tex-archive/fonts/verdana"
  echo "for more details."
  echo "Downloading package and ttf for Verdana: "
  getFile "verdana.tds.zip" "http://mirrors.ctan.org/install/fonts/verdana.tds.zip"
  unzip -q verdana.tds.zip -d $INST
  getFile "verdan32.exe?download" "http://prdownloads.sourceforge.net/corefonts/verdan32.exe?download"
  cp "verdan32.exe?download" "verdan32.exe"
  cabextract -q "verdan32.exe"
  rm fontinst.exe
  rm fontinst.inf
  rm $INST/fonts/truetype/ms/verdana/put-your-verdana-ttf-files-here
  mv Verdanab.TTF $INST/fonts/truetype/ms/verdana/verdanab.ttf
  mv Verdanai.TTF $INST/fonts/truetype/ms/verdana/verdanai.ttf
  mv Verdanaz.TTF $INST/fonts/truetype/ms/verdana/verdanaz.ttf
  mv Verdana.TTF $INST/fonts/truetype/ms/verdana/verdana.ttf
  mkdir -p ~/.fonts
  cp $INST/fonts/truetype/ms/verdana/*.ttf ~/.fonts/
  popd
  # Append the new font name to the array of installed fonts
  MAPS+=("verdana")
  return 0
}
#
function minion {
  mkdir -p "$INST" "$TEMP"
  pushd "$TEMP"
  echo " "
  echo "$SEP"
  echo "Getting FontPro from GitHub"
  TMPFONTPRO="$TEMP/FontPro"
  if [ -d "$TMPFONTPRO" ]; then
    echo "Updating the FontPro repository"
    pushd $TMPFONTPRO
    git pull -q
    popd 
  else
    echo "Cloning the FontPro repository"
    git clone -q https://github.com/sebschub/FontPro $TMPFONTPRO
  fi
  echo "Downloading the font files from Adobe."
  #backupLink="http://get.adobe.com/uk/reader/otherversions/"
  #
  #PKGFILE8="AdobeReader_enu-8.1.7-1.i486.tar.gz"
  #PKGLINK8="http://ardownload.adobe.com/pub/adobe/reader/unix/8.x/8.1.7/enu/"$PKGFILE8
  #PKGFONTDIR8="Adobe/Reader8/Resource/Font"
  #
  PKGFILE9="AdbeRdr9.4.2-1_i486linux_enu.tar.bz2"
  PKGLINK9="http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.4.2/enu/"$PKGFILE9
  PKGFONTDIR9="Adobe/Reader9/Resource/Font"
  #
  PKGFONT="AdobeReader/COMMON.TAR"
  PKGLINK=$PKGLINK9
  PKGFONTDIR=$PKGFONTDIR9
  PKGFILE=$PKGFILE9
  #
  getFile "$PKGFILE" "$PKGLINK"
  #
  echo "Extracting files from the package."
  tar --extract --bzip2 --file=$PKGFILE $PKGFONT 
  #
  echo "Selecting fonts for extraction."
  FONTS=( "MinionPro" "MyriadPro" )
  SHAPE=( "Bold" "BoldIt" "It" "Regular" )
  mkdir -p $TMPFONTPRO/otf
  for (( i=0;i<${#FONTS[@]};i++ )); do
    SELECTEDFONTS=""
    for (( j=0;j<${#SHAPE[@]};j++ )); do
      THEFONT=${FONTS[${i}]}
      THESHAPE=${SHAPE[${j}]}
      SELECTEDFONTS=$SELECTEDFONTS""$PKGFONTDIR"/"$THEFONT"-"$THESHAPE".otf "
    done 
    tar --extract --file=$PKGFONT $SELECTEDFONTS 
    cp $PKGFONTDIR/*.otf $TMPFONTPRO/otf/
    #
    pushd $TMPFONTPRO 
    echo $SEP
    echo "Calling the FontPro script for each font family."
    ./scripts/makeall $THEFONT
    echo "Installing $THEFONT: "
    ./scripts/install $INST
    #    echo "Enabling the map for $THEFONT"
    #    sudo updmap-sys --enable Map=$THEFONT.map
    # Cleaning up and adding the otfs  to the user dir (xelatex)
    mkdir -p ~/.fonts
    mv $TMPFONTPRO/otf/*.otf ~/.fonts/
    popd
  done 
  # Append the new font names to the array of installed fonts
  MAPS+=("MinionPro" "MyriadPro")
  return 0
}
#
function enableMaps {
  echo $SEP
  echo "Enabling the font maps for this distribution."
  (export TEXMFHOME=$INST; 
  texhash $INST
  for (( i=0;i<${#MAPS[@]};i++ )); do
    THEMAP=${MAPS[${i}]}
    echo "Enabling $THEMAP"
    updmap --nohash --enable Map=$THEMAP.map
  done
  texhash $INST
  updmap
  )
  return 0
}
#
# basic output to tell users how it works
function usage () 
{
  echo "Usage: $0 [ -h ] [ -f fontname ] [ -l localfolder ] [ -t tempfolder ]"
  echo ""
  echo "  -h              : print this screen"
  echo "  -f fontname     : the name of the font to install (optional)"
  echo "                    you can select: verdana, minion or myriad"
  echo "  -l localfolder  : local directory to install to (optional)"
  echo "  -t type         : folder to use for temporary files (optional)"
  echo ""
  exit 1
}
#
#
##########################################
# The script
##########################################
#
# Setting the default options
checkSystem
FONT=""
INST=$(kpsexpand \$TEXMFHOME)
TEMP="/tmp/installFonts"
# evaluate the options 
while getopts ":f:l:t:h:" option; do
  case "${option}" in
    f) FONT=${OPTARG} ;;
    l) INST=${OPTARG} ;;
    t) TEMP=${OPTARG} ;;
    h) usage ;;
    *) usage ;;
  esac
done
#
# validate the inputs and ask for missing information
read -e -p "Which font would you like to install? - " -i "$FONT" FONT
read -e -p "Where is your Latex tree? - " -i "$INST" INST
#
MAPS=()
#
if [ "$FONT" = "" ]; then # Do nothing
  echo "No font name supplied, terminating."
  exit 1
elif [ "$FONT" = "verdana" ]; then
  verdana 
elif [ "$FONT" = "minion" ]; then
  minion 
elif [ "$FONT" = "myriad" ]; then
  minion
elif [ "$FONT" = "arial" ]; then
  nonfree "arial-urw"
elif [ "$FONT" = "luximono" ]; then
  nonfree "luximono"
else
  echo "There is no function to install $FONT, terminating."
  exit 1
fi
#
enableMaps
exit 0
