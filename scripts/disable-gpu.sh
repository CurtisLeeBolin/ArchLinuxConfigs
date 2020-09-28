#!/bin/bash

echo "\_SB_.PCI0.VGA.PX02" > /proc/acpi/call; cat /proc/acpi/call
