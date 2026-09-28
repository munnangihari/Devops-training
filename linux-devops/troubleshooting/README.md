# Linux Troubleshooting

**Directory:**  
Devops-training/linux-devops/troubleshooting/

**Scripts:**
- disk_full.sh → Simulate disk full, check with `df -h`, `du -sh .`
- service_stopped.sh → Stop service, check with `systemctl status`
- port_unavailable.sh → Occupy port 8080, check with `ss -tuln`
- permission_denied.sh → Remove permissions, check with `ls -l`, fix with `chmod`
- cpu_high.sh → Run CPU-heavy process, monitor with `top`, kill with `kill`

**Run:**

cd Devops-training/linux-devops/troubleshooting
chmod +x *.sh

./disk_full.sh
./service_stopped.sh
./port_unavailable.sh
./permission_denied.sh
./cpu_high.sh

