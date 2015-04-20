;; config markdown mode, for supporting local css file and Chinese
;; there is no way to generate css code into html file for now, will solve this later.
;; TODO: copy css code into generated html
;;(setq markdown-css-path "../markdown-css/clearness.css")
(setq markdown-content-type "text/html")
(setq markdown-coding-system nil)
(setq buffer-file-coding-system "utf-8")

;; add css for markdown-mode export to html files
                                        ; Use org.css from the norang website for export document stylesheets
;;(setq markdown-css-dir "/home/kevin/.emacs.d/users/kevin/markdown-css/")
;;(setq markdown-css-theme "clearness")
(defconst markdown-css-style-solarized-light "<style type=\"text/css\">
/*---------------------------------------------------
    LESS Elements 0.9
  ---------------------------------------------------
    A set of useful LESS mixins
    More info at: http://lesselements.com
  ---------------------------------------------------*/
/**
 * https://github.com/rhiokim/markdown-css
 * solarized-light style
 * made by rhio.kim
 * powered by http://ethanschoonover.com/solarized
 */.solarized-light {
  padding: 20px;
  color: #737373;
  font-size: 0.9em;
  font-family: \"Lucida Grande\", \"Lucida Sans Unicode\", \"Lucida Sans\", AppleSDGothicNeo-Medium, Verdana, Tahoma, sans-serif;
  background: #fdf6e3;
  -webkit-font-smoothing: antialiased;
}
.solarized-light a {
  color: #1e6ea7;
}
.solarized-light a:hover {
  color: #268bd2;
}
.solarized-light h1,
.solarized-light h2,
.solarized-light h3,
.solarized-light h4,
.solarized-light h5 {
  color: #b58900;
}
.solarized-light h2 {
  border-bottom: 1px solid #f6d784;
}
.solarized-light h6 {
  color: #9c7600;
}
.solarized-light hr {
  border: 1px solid #fae7b3;
}
.solarized-light pre > code {
  font-size: .9em;
  font-family: Consolas, Inconsolata, Courier, monospace;
}
.solarized-light blockquote {
  border-left: 4px solid #fae7b3;
  padding: 0 15px;
  font-style: italic;
}
.solarized-light table {
  background-color: #fdf4dd;
}
.solarized-light table tr th,
.solarized-light table tr td {
  border: 1px solid #fae7b3;
}
.solarized-light table tr:nth-child(2n) {
  background-color: #fef8ea;
}
/**
 * after less
 */

 </style>")

(defvar markdown-css-style-solarized-dark "<style type=\"text/css\">
/*---------------------------------------------------
    LESS Elements 0.9
  ---------------------------------------------------
    A set of useful LESS mixins
    More info at: http://lesselements.com
  ---------------------------------------------------*/
/**
 * https://github.com/rhiokim/markdown-css
 * solarized-dark style
 * made by rhio.kim
 * powered by http://ethanschoonover.com/solarized
 */.solarized-dark {
  padding: 20px;
  color: #839496;
  font-size: 0.9em;
  font-family: \"Lucida Grande\", \"Lucida Sans Unicode\", \"Lucida Sans\", AppleSDGothicNeo-Medium, Verdana, Tahoma, sans-serif;
  background: #002b36;
  -webkit-font-smoothing: antialiased;
}
.solarized-dark a {
  color: #1e6ea7;
}
.solarized-dark a:hover {
  color: #268bd2;
}
.solarized-dark h1,
.solarized-dark h2,
.solarized-dark h3,
.solarized-dark h4,
.solarized-dark h5 {
  color: #b58900;
}
.solarized-dark h2 {
  border-bottom: 1px solid #005469;
}
.solarized-dark h6 {
  color: #694f00;
}
.solarized-dark hr {
  border: 1px solid #001f27;
}
.solarized-dark pre > code {
  font-size: .9em;
  font-family: Consolas, Inconsolata, Courier, monospace;
}
.solarized-dark blockquote {
  border-left: 4px solid #000203;
  padding: 0 15px;
  font-style: italic;
}
.solarized-dark table {
  background-color: #003441;
}
.solarized-dark table tr th,
.solarized-dark table tr td {
  border: 1px solid #005065;
}
.solarized-dark table tr:nth-child(2n) {
  background-color: #003b4b;
}
/**
 * after less
 */
</style>")

(defvar markdown-css-style-clearness "<style type=\"text/css\">
/*---------------------------------------------------
    LESS Elements 0.9
  ---------------------------------------------------
    A set of useful LESS mixins
    More info at: http://lesselements.com
  ---------------------------------------------------*/
/**
 * https://github.com/rhiokim/markdown-css
 * solarized-light style
 * made by rhio.kim
 * powered by http://ethanschoonover.com/solarized
 */
.clearness {
  padding: 20px;
  color: #737373;
  font-size: 0.9em;
  font-family: \"Lucida Grande\", \"Lucida Sans Unicode\", \"Lucida Sans\", AppleSDGothicNeo-Medium, Verdana, Tahoma, sans-serif;
  background: #ffffff;
  -webkit-font-smoothing: antialiased;
}
.clearness a {
  color: #1e6ea7;
}
.clearness a:hover {
  color: #268bd2;
}
.clearness h1,
.clearness h2,
.clearness h3,
.clearness h4,
.clearness h5 {
  color: #404040;
}
.clearness h2 {
  border-bottom: 1px solid #cccccc;
}
.clearness h6 {
  color: #666666;
}
.clearness hr {
  border: 1px solid #e6e6e6;
}
.clearness pre > code {
  font-size: .9em;
  font-family: Consolas, Inconsolata, Courier, monospace;
}
.clearness blockquote {
  padding: 0 15px;
  font-style: italic;
}
.clearness blockquote:before {
  content: \"\201C\";
  font-size: 40px;
  margin-left: -20px;
  color: #aaa;
}
.clearness table {
  background-color: #ffffff;
  border-collapse: separate;
  border-spacing: 2px;
}
.clearness table tr th,
.clearness table tr td {
  border: 0px;
  padding: .2em 1em;
}
.clearness table tr th {
  border-bottom: 1px solid #bfbfbf;
}
.clearness table tr td {
  border-bottom: 1px solid #d9d9d9;
}
.clearness table tr:nth-child(2n) {
  background-color: #ffffff;
}
/**
 * after less
 */
</style>")

(defvar markdown-css-style-clearness-dark "<style type=\"text/css\">

/*---------------------------------------------------
    LESS Elements 0.9
  ---------------------------------------------------
    A set of useful LESS mixins
    More info at: http://lesselements.com
  ---------------------------------------------------*/
/**
 * https://github.com/rhiokim/markdown-css
 * solarized-light style
 * made by rhio.kim
 * powered by http://ethanschoonover.com/solarized
 */
.clearness-dark {
  padding: 20px;
  color: #ffffff;
  font-size: 0.9em;
  font-family: \"Lucida Grande\", \"Lucida Sans Unicode\", \"Lucida Sans\", AppleSDGothicNeo-Medium, Verdana, Tahoma, sans-serif;
  background: #282a36;
  -webkit-font-smoothing: antialiased;
}
.clearness-dark a {
  color: #e03300;
}
.clearness-dark a:hover {
  color: #ff4a14;
}
.clearness-dark h2 {
  border-bottom: 1px solid #21232d;
}
.clearness-dark h6 {
  color: #a4a296;
}
.clearness-dark hr {
  border: 1px solid #21232d;
}
.clearness-dark pre > code {
  font-size: .9em;
  font-family: Consolas, Inconsolata, Courier, monospace;
}
.clearness-dark blockquote {
  border-left: 4px solid #121319;
  padding: 0 15px;
  font-style: italic;
}
.clearness-dark table {
  background-color: #303241;
}
.clearness-dark table tr th,
.clearness-dark table tr td {
  border: 1px solid #4b4e65;
}
.clearness-dark table tr:nth-child(2n) {
  background-color: #373a4b;
}
/**
 * after less
 */
</style>")

(defvar markdown-css-style-node-dark "<style type=\"text/css\">

/*---------------------------------------------------
    LESS Elements 0.9
  ---------------------------------------------------
    A set of useful LESS mixins
    More info at: http://lesselements.com
  ---------------------------------------------------*/
/**
 * https://github.com/rhiokim/markdown-css
 * solarized-dark style
 * made by rhio.kim
 * powered by http://ethanschoonover.com/solarized
 */
.node-dark {
  padding: 20px;
  color: #d2d8ba;
  font-size: 0.9em;
  font-family: \"Lucida Grande\", \"Lucida Sans Unicode\", \"Lucida Sans\", AppleSDGothicNfeo-Medium, Verdana, Tahoma, sans-serif;
  background: #33342d;
  -webkit-font-smoothing: antialiased;
}
.node-dark a {
  color: #639400;
}
.node-dark a:hover {
  color: #85c700;
}
.node-dark h1,
.node-dark h2,
.node-dark h3,
.node-dark h4,
.node-dark h5 {
  color: #eee;
}
.node-dark h2 {
  border-bottom: 1px solid #4e4f45;
}
.node-dark h6 {
  color: #694f00;
}
.node-dark hr {
  border: 1px solid #2b2c26;
}
.node-dark pre > code {
  font-size: 1em;
  font-family: Consolas, Inconsolata, Courier, monospace;
  font-weight: bold;
}
.node-dark blockquote {
  border-left: 4px solid #181915;
  padding: 0 15px;
  font-style: italic;
}
.node-dark table {
  background-color: #3d3e36;
}
.node-dark table tr th,
.node-dark table tr td {
  border: 1px solid #5f6154;
}
.node-dark table tr:nth-child(2n) {
  background-color: #46483e;
}
/**
 * after less
 */
</style>")





(defvar markdown-element-js "<script type=\"text/javascript\">
<!--/*--><![CDATA[/*><!--*/
 function CodeHighlightOn(elem, id)
 {
   var target = document.getElementById(id);
   if(null != target) {
     elem.cacheClassElem = elem.className;
     elem.cacheClassTarget = target.className;
     target.className = \"code-highlighted\";
     elem.className   = \"code-highlighted\";
   }
 }
 function CodeHighlightOff(elem, id)
 {
   var target = document.getElementById(id);
   if(elem.cacheClassElem)
     elem.className = elem.cacheClassElem;
   if(elem.cacheClassTarget)
     target.className = elem.cacheClassTarget;
 }
/*]]>*///-->
</script>
")



(setq markdown-css-theme "solarized-dark")
(setq markdown-xhtml-header-content markdown-css-style-solarized-dark )



(provide 'markdown-setting)
;;; markdown-setting.el ends here

