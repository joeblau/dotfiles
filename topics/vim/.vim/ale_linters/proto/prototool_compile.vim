function! ale_linters#proto#prototool_compile#GetCommand(buffer) abort
	let l:dirname = expand('#' . a:buffer . ':p:h')
  return 'prototool compile -I ' . ale#Escape(l:dirname) . ' %s'
endfunction

call ale#linter#Define('proto', {
			\   'name': 'prototool-compile',
			\   'lint_file': 1,
			\   'output_stream': 'stdout',
			\   'executable': 'prototool',
			\   'command_callback': 'ale_linters#proto#prototool_compile#GetCommand',
			\   'callback': 'ale#handlers#unix#HandleAsError',
			\})
