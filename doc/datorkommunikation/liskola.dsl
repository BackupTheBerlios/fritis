<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!ENTITY html-ss 
  PUBLIC "-//Norman Walsh//DOCUMENT DocBook HTML Stylesheet//EN" CDATA dsssl>
<!ENTITY print-ss
  PUBLIC "-//Norman Walsh//DOCUMENT DocBook Print Stylesheet//EN" CDATA dsssl>
]>

<style-specification id="print" use="print-stylesheet">
<style-specification-body> 

;; customize the print stylesheet
; === Page layout ===
(define %paper-type% "A4")		;; use A4 paper - comment this out if needed

; === Media objects ===
(define preferred-mediaobject-extensions  ;; this magic allows to use different graphical
   (list "eps"))			;;   formats for printing and putting online
(define acceptable-mediaobject-extensions
   '())
(define preferred-mediaobject-notations
   (list "EPS"))
(define acceptable-mediaobject-notations
   (list "linespecific"))

; === Rendering ===
(define %head-after-factor% 0.2)	;; not much whitespace after orderedlist head
(define ($paragraph$)			;; more whitespace after paragraph than before
  (make paragraph
    first-line-start-indent: (if (is-first-para)
                                 %para-indent-firstpara%
                                 %para-indent%)
    space-before: (* %para-sep% 4)
    space-after: (/ %para-sep% 4)
    quadding: %default-quadding%
    hyphenate?: %hyphenation%
    language: (dsssl-language-code)
    (process-children)))


;;(define %default-quadding%   
;;  'justify)

(define %two-side% 
  ;; Is two-sided output being produced?
  #t)

    

(define %number-programlisting-lines%
  ;; Enumerate lines in a 'ProgramListing'?
  #t)

(define %linenumber-length%
  ;; Width of line numbers in enumerated environments
  ;; Line numbers will be padded to %linenumber-length% characters.
  0)


(define %linenumber-mod%
  ;; Controls line-number frequency in enumerated environments.
  ;; Every %linenumber-mod% line will be enumerated.
  1)


(define %linenumber-padchar%
  ;; Pad character in line numbers
  ;; Line numbers will be padded (on the left) with %linenumber-padchar%
  " ")


(define %shade-verbatim%
  ;; Should verbatim environments be shaded?
  #t)

;;Define Line Spacing
(define %line-spacing-factor% 1.6)


</style-specification-body>
</style-specification>

<style-specification id="html" use="html-stylesheet">
<style-specification-body>  

(define %html-header-tags% 
  ;; for using a css file with name base.css
   '(("LINK" ("REL" "stylesheet")
      ("HREF" "./liskola.css") 
      ("TYPE" "text/css"))))

(define (chunk-element-list)
  (list (normalize "preface")
	(normalize "chapter")
	(normalize "appendix") 
	(normalize "article")
	(normalize "glossary")
	(normalize "bibliography")
	(normalize "index")
	(normalize "colophon")
	(normalize "setindex")
	(normalize "reference")
	(normalize "refentry")
	(normalize "part")
	(normalize "book") ;; just in case nothing else matches...
	(normalize "set")  ;; sets are definitely chunks...
	))

(define %use-id-as-filename%
 #t)

(define %html-ext%
  ".html")

</style-specification-body>
</style-specification>
<external-specification id="print-stylesheet" document="print-ss">
<external-specification id="html-stylesheet"  document="html-ss">
</style-sheet>
