# Nvidia Fan Control

A lightweight Linux utility for monitoring GPU temperatures and dynamically controlling NVIDIA GPU fan speeds using NVML.

## Requirements
- NVIDIA GPUs with NVML support
- NVIDIA drivers 520 or higher
- Go

## Installation
1. Edit `WorkingDirectory` from `nvidia_fan_control.service` to point to your `~/`
2. Install
```bash
make install
```

## Configuration
Edit the file `.nvidia_fan_control` with the following structure
```
{
    "time_to_update": 5,
    "temperature_ranges": [
      { "min_temperature": 0, "max_temperature": 40, "fan_speed": 30, "hysteresis": 3 },
      { "min_temperature": 40, "max_temperature": 60, "fan_speed": 40, "hysteresis": 3 },
      { "min_temperature": 60, "max_temperature": 80, "fan_speed": 70, "hysteresis": 3 },
      { "min_temperature": 80, "max_temperature": 100, "fan_speed": 100, "hysteresis": 3 },
      { "min_temperature": 100, "max_temperature": 200, "fan_speed": 100, "hysteresis": 0 }
    ]
  }
```

## Service

Service reads config file from your `~/` root folder

```bash
sudo systemctl status nvidia_fan_control.service
```

### Check Logs
```bash
sudo tail -f /var/log/nvidia_fan_control.log
```