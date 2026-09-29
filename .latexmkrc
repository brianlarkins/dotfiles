if ($^O eq 'darwin') {
  $pdf_previewer = 'open -a Skim';
} else {
  $pdf_previewer = 'start xdg-open';
}
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode';
@generated_exts = (@generated_exts, 'synctex.gz');
