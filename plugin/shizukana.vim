" Global commands for Shizukana theme

if exists('g:loaded_shizukana')
  finish
endif
let g:loaded_shizukana = 1

" Theme commands
command! -nargs=? ShizukanaStyle lua require('shizukana').set_style(<q-args>)
command! ShizukanaReload lua require('shizukana').reload()

" Palette and contrast commands
command! ShizukanaPalette lua require('shizukana.palette').show_palette()
command! -nargs=? ShizukanaContrast lua require('shizukana.util').validate_contrast(<q-args>)

" Extras generation commands
command! -nargs=? ShizukanaExtras lua require('shizukana.extras').generate(<q-args>)
command! ShizukanaExtrasAll lua require('shizukana.extras').generate_all()
