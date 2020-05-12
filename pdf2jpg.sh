#!/bin/bash

# Script to convert PDF file to JPG images
#
# Dependencies:
# * pdftk
# * imagemagick 

PDF=$1
x=$(pwd)
echo ".......O diretório de trabalho corrente é: $x"

echo ".......Processando PDF"
DIR=`basename "$1" .pdf`

echo ".......Diretorio a ser criado: $DIR"
mkdir $DIR

echo '.......Separando o PDF em páginas...'
pdftk $PDF burst output $DIR/%04d.pdf

echo '.......Convertendo páginas para arquivos JPEG'
for i in $DIR/*.pdf; do
  echo $i
  convert -density 300 $i $DIR/`basename "$i" .pdf`.jpg
done
echo '.......Unificando imagens'
convert -append $DIR/*.jpg $DIR.jpg

echo '.......Deletando pasta criada'
rm -R $x/$DIR/
#rm -R 
echo 'FIM'
