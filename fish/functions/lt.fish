# Defined in - @ line 1
function lt --wraps='exa -l --tree' --description 'alias lt=exa -l --tree'
  exa -l --tree $argv;
end
