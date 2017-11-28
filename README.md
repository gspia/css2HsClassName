
# css2HsClassName

This produces Haskell-code that can be used with Reflex.Dom. Namely, a sets
of ClassNames that correspond to the html-element attribute class.
The current way (in css2HsClassName) of writing module names and using 
ClassNames assumes a certain way of using html-attributes etc (see 
reflex-dom-htmlea and reflex-dom-themes).

Why functions and not just using html-attributes? This way the compiler
can help detect writing misstakes. And maybe these can be used as building
blocks to something. css2HsClassName assumes the made source files
are to be used with
[reflex-dom-htmlea](https://github.com/gspia/reflex-dom-htmlea)
and one possible result can be seen at
reflex-dom-themes (TBA).

The structure of this executable is simple and short. It can be easily 
extended to support other similar tasks (e.g. to produce "building block
material" to other libs).

It is convenient to use this directly from ghci. Look what mkAll-function 
does and run it or just take one of the methods there and run it. The 
mkAll-function processes several css theme and icon files at the same time 
and probably there is no use of all of them in the same project. The reason 
for using this with several themes and icon files is testing and finding 
the corner cases - at least some of them. (The mkAll and related functions
are in comments at the end of the source file.)

## How to build?

```
git clone ..
cd css2HsClassName
nix-build
```
and then the result/bin -dir is made up and `mkSeveral.sh` can find the 
program. (Some of its outputs can be found at res-directory.)

You can also 
```
nix-shell
cabal new-build
```
or
```
nix-shell
cabal update; cabal install css-syntax; cabal configure; cabal build
```



## Possible TODOs
  * When recognizing a token, replace the recognition prefix when writing
    a function name with a user given prefix (e.g. to shorten the names).
  * File handling: check for file overwrites.
  * File handling: check for missing input files.
  * Source handling: should this get the theme & icon sources from github etc?
    (E.g. provide a shell script for getting css-sources.)
  * Wider useage tests (more themes and icons)
  * Wider lib outputs: this could be used to produce "raw material" for other
    libs too. (The 1st version of this executable was for Purescript Halogen 
    lib and there is a lot of similarities, if used as "raw material" in this
    way.)
  * Implement some of the customization possibilities as executable args
    (e.g. dirs, prefix handling etc)
  * mkSeveral.sh assumes executable can be found from ./result/bin and 
    that the css-sources are in place etc. (This is, that the probram
    has been build with nix-build-command.)
  * tests

## Bugs:
  * open-iconic has a css that this doesn't handle well at the moment:
    (those .oi[data-glyph=..] constructs.)
  * Otherwise not known but the following are very likely to happen:
     * Extra class-name functions (that is, class names that cannot be used
       and may cause confusion). Anyhow, the produced hs-file should be
       useable.
     * Missing class-names: even though the coverage seems to be good, the
       css-parsing or token-handling may skip some.
       In this case, we could add missing class names by hand either in to
       the produced file or to another file. Or find out, why it is missing.
       (Is there an easy way to test for completenes in coverage sense? Testing
       should be in TODO-list.)

## Caveats:
  * js-support - if the theme assumes or requires js, some of the class names
    may not be useable in practice or requires effort.


## CSS-sources

This has been tested with the following themes and icon-sets. Most of them have 
cdn somewhere. The source version are kept in 
[versions.txt](https://github.com/gspia/css2HsClassName/blob/master/versions.txt).

### Themes

We have tested css2HsClassName with
* [boostrap](http://getbootstrap.com/)
* [semantic](https://semantic-ui.com/)
* [foundation](http://foundation.zurb.com/)

The above libs have cdns but they also have some other requirements or recommended
usage so the cdns are not listed here (e.g. one or more js-libs). 
See their tutorials for usage. 
See also reflex-dom-themes-lib for examples on how to use the produced 
theme- and icon hs-files.

Further, [w3css](https://www.w3schools.com/w3css/default.asp) has been tried.

### Icons
We have tested css2HsClassName with
* [fontawesome](http://fontawesome.io/icons/)
* [elusive icons](http://elusiveicons.com/)
* [foundation icons](http://zurb.com/playground/foundation-icons)
* [icomoon](https://icomoon.io/)
* [ionicons](http://ionicons.com/)
* [mfglabs](https://mfglabs.github.io/mfglabs-iconset/)
* [modern ui icons](http://modernuiicons.com/)   or  https://materialdesignicons.com/
* [open iconic](https://useiconic.com/open)
* [typicons](http://www.typicons.com/)
* [flags](https://github.com/lipis/flag-icon-css)

Some of the icon libs have cnd:
* https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css
* https://maxcdn.bootstrapcdn.com/elusive-icons/2.0.0/css/elusive-icons.min.css
* https://cdn.jsdelivr.net/foundation-icons/3.0/foundation-icons.min.css
* http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css
* https://cdn.materialdesignicons.com/2.0.46/css/materialdesignicons.min.css

For the rest you have to find the css-file to be used in the html-head.

To find out icomoon css-file, see Font/demo for a css file.

Open-iconic (useiconic) seems to have separate icons sets for different 
theme libs.

To use the flag-icons, git clone it first and put the flags into 
appropriate place (see urls at the flag-icon.css).


