{ runCommand
, vistafonts
, nerd-font-patcher
}:

runCommand "consolas-nerdfont"
{
  meta.license = vistafonts.meta.license;
  version = nerd-font-patcher.version;
} ''
  for f in ${vistafonts}/share/fonts/truetype/consola*.ttf; do
      ${nerd-font-patcher}/bin/nerd-font-patcher \
          --complete \
          --no-progressbars \
          --outputdir $out/share/fonts/truetype \
          $f
  done;
''
