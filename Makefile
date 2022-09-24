run:
	docker build -t klarulor/scpsl .
push:
	docker push klarulor/scpsl
rebuild:
	make run
	make push
updateSCPSL:
	powershell.exe -ExecutionPolicy Bypass -file "./downloadSCPSL.ps1"