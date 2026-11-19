# Instalação

## Adaptador WiFi D-Link, AC1200, Dual-Band, 5GHz 802.11ac, USB 3.0 - DWA-182 (LINUX)

Confere se é esse o aparelho
```bash
lsusb -v -d 0bda:b812
```

Instala o básico
```bash
sudo apt-get install build-essential dkms git
```

Clona esse repositório
```bash
git clone https://github.com/juninmd/rtl88x2bu.git
```

Entra no repo
```bash
cd rtl88x2bu
sudo make
sudo make install
sudo modprobe 88x2bu
```
E é isso, tá com a internet ON

Créditos:
https://www.youtube.com/watch?v=NGbaeZqZoc8&list=LL&index=1&t=79s

---

# CI/CD Pipeline

> **IMPORTANT:** GitHub Actions are **PROHIBITED** by the execution policy.
> All automated builds and deployments must be triggered via the central
> Kubernetes orchestrator (CronJob/Job), not GitHub Actions.
> `on: schedule:` and `cron:` triggers are strictly forbidden.

## CI/CD Stages (Executed via K8s Job)

The following pipeline stages are executed by a Kubernetes Job using
the `sudo ./build.sh` command within the appropriate container environment.

### 1. Build Stage
Runs the build script to compile the kernel module and install via DKMS.

```bash
sudo ./build.sh
```

### 2. Test Stage
Verification of build and module load success.

1.  Execute the build command above.
2.  Verify module loaded: `lsmod | grep 88x2bu`
3.  (Hardware dependent) Run functional tests on the device.

### 3. Deployment Strategy
- **Staging:** Not applicable via GitHub Actions. Use `kubectl apply` manually or via
   a delegated K8s Job on the cluster.
- **Production:** Manual approval required. No automated cron triggers.

### 4. Rollback Capability
Re-run the build script with a previous version tag if DKMS module management
is needed.

### 5. Health Checks
After `sudo modprobe 88x2bu`, verify:
```bash
lsmod | grep 88x2bu
ip link show
```

### 6. Notifications
- Build status updates are tracked via the K8s Job status.
- Failure alerts can be configured via the cluster's monitoring stack
  (Prometheus/Alertmanager).

## Quality Gates

- **Linting/Security:** Run `gitleaks` to scan for secrets/leaks.
  ```bash
  gitleaks protect --config .gitleaks.toml
  ```
- **Dependency Vulnerabilities:** Not applicable (no package manager deps in
  traditional sense; check kernel module source for known CVEs).
- **Code Formatting:** Adhere to standard C formatting conventions.
- **Build Time:** Target < 10 minutes for `make` + DKMS `build` on a suitable host.

## Documentation

- **README:** Updated with badge placeholders and CI/CD guidelines above.
- **Environment Variables:** Refer to `dkms.conf` and `Makefile` for build
  configuration variables (CONFIG_RTL8822B, etc.).
- **Contributing:** See `CONTRIBUTING.md` for full guidelines.

## Badges

*(Note: Actual badge images cannot be generated here. Placeholders are documented.)

[![Build Status](<placeholder-badges-url>)](<placeholder-badges-url>)