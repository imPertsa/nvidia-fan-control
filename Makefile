install:
	@echo "Building and enabling nvidia_fan_control"
	go build -o nvidia_fan_control
	sudo mv nvidia_fan_control /usr/local/bin/
	cp .nvidia_fan_control ~/
	sudo cp nvidia_fan_control.service /etc/systemd/system/
	@echo "Enabling and starting the service..."
	sudo systemctl daemon-reload
	sudo systemctl enable nvidia_fan_control.service
	sudo systemctl start nvidia_fan_control.service

uninstall:
	sudo systemctl stop nvidia_fan_control.service
	sudo systemctl disable nvidia_fan_control.service
	sudo rm /etc/systemd/system/nvidia_fan_control.service
	rm -f /usr/local/bin/nvidia_fan_control
	rm -f ~/.nvidia_fan_control
	sudo systemctl daemon-reload