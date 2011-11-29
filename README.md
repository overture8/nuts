nuts
====

nuts is a command line tool for listing and installing fonts from the fontsquirrel site.

Installation
------------

    gem 'nuts'
    bundle install

Synopsis
--------

    nuts list [search term]
    nuts install [font name]

Example Usage
-------------

     $ nuts list [font search term]
     afta-serif
     Bitstream-Vera-Serif
     DejaVu-Serif
     Droid-Serif
     HVD-Comic-Serif-Pro
     Liberation-Serif
     Luxi-Serif
     Nadia-Serif
     pt-serif
     TypoSlabserif-Light
     Verily-Serif-Mono

     $ nuts install Droid-Serif

This will do two things:-

* Install the font into the assets/fonts folder

* Install the appropriate font-face css code in assets/stylesheets/Droid-Serif.css

You can get the relevant **font-family** name from the abpve file.  This font-family can then be used like so:-

    h1 {
      font-family: 'DroidSerifRegular';
    } 
