==pdf metadata extrator==

extracts:
* pdf version
* pdf total page number
* pdf creator
* pdf producer
* pdf creation date

usage with rvm:
* place pdfs inside a Folder named <Author> inside working directory
* create a gemset
* install pdf-reader gem  
"$ gem install pdf-reader"
* make extractor executable  
"$ chmod +x extract_metadata.rb"
* run extractor
"$ ./extract_metadata.rb"
