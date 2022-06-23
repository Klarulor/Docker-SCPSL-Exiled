run: #Build for UNIX/DOS
	docker build -t klarulor/scpsl:latest .
minimal:
	docker build --build-arg CATCH_SL=-0 -t klarulor/scpsl:minimal .
fast-arm: # Build fast for ARM64
	echo Building fast arm...
	docker buildx build --platform linux/arm64 -f ./Dockerfile.arm64 -t klarulor/scpsl:arm64 --load .

arm: # Build with scpsl installation(steamcmd suck)
	echo hello
	make installSCPSL
	make fast-arm

installSCPSL:
	make installSteamcmd
	powershell.exe -file "./build-scripts/installSCPSL.ps1"
	cd ..

installSteamcmd:
	powershell.exe -file "./build-scripts/installSteamcmd.ps1"
	cd ..