# Contributing to rtl88x2bu

## Build Process
This project is a Linux kernel driver. The standard build process requires root privileges and is managed via `dkms`.

1.  **Prerequisites:** Install build essentials and DKMS on the host system:
    \`\`\`bash
    sudo apt-get install build-essential dkms git
    \`\`\`
2.  **Clone & Build:**
    \`\`\`bash
    git clone https://github.com/juninmd/rtl88x2bu.git
    cd rtl88x2bu
    sudo make
    sudo make install
    sudo modprobe 88x2bu
    \`\`\`

## Continuous Integration (CI/CD)
**NOTE: GitHub Actions workflows are PROHIBITED by the execution policy.**
Periodic or event-driven execution must be managed by the central cluster orchestrator (e.g., Kubernetes CronJob/Job).

A CI job should execute the existing \`build.sh\` script within a container that has the necessary kernel headers and DKMS environment available on the host OS (or within the container if possible, although kernel modules often require host headers).

**Recommended CI Job Command:**
\`\`\`bash
sudo ./build.sh
\`\`\`

## Testing
This is a kernel module. Testing involves:
1.  **Build Verification:** Running \`build.sh\` without errors.
2.  **Load Verification:** Running \`sudo modprobe 88x2bu\` and verifying module load status via \`lsmod\`.
3.  **Functional Testing:** Testing connectivity/functionality on the target hardware.
*There are no unit tests in the traditional sense for kernel modules; the build and load success is the primary automated gate.*

## Quality Gates & Deployment
*   **Linting/Type Checking:** Not applicable (C code, no established linter configuration found).
*   **Security Scanning:** Run \`git-secrets\` or \`gitleaks\` as per existing configuration (\`.gitleaks.toml\`).
*   **Deployment:** Automated deployment to staging on PR merge is **NOT** supported via GitHub Actions. Deployment must be triggered manually or via a designated K8s Job/Workflow on the cluster.
*   **Production Approval:** Manual approval is required for production deployment.

## Conventions
- All code, identifiers, and comments must be in English.
- Use **Conventional Commits** for version bumps and changelogs.
