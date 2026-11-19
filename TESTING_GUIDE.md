# Automated Testing for Kernel Module

## Status
This project is a Linux kernel driver. Traditional unit/integration/E2E tests
(like Jest, Pytest, or Playwright) are **not applicable**.

## Test Approach

The primary "test" for this driver is **Build and Load Verification**.

### Automated CI Job Steps
A Kubernetes Job should execute the following sequence:

1.  **Build Verification:**
    ```bash
    sudo ./build.sh
    ```
    *Check exit code: 0 indicates success.*

2.  **Module Load Verification:**
    ```bash
    sudo modprobe 88x2bu
    lsmod | grep 88x2bu
    ```

3.  **Success Criteria:**
    - Script completes without errors.
    - Module appears in `lsmod` output.
    - (Hardware dependent) Network interface becomes operational.

### Manual Testing Requirements
Because this is kernel space code running on hardware:
- Testing requires physical access to a machine with the DWA-182 adapter.
- Network connectivity and speed tests.
- Power management and suspend/resume functionality.

### Security Scanning
The repository includes a `.gitleaks.toml` configuration. As part of the CI Job, run:
```bash
gitleaks protect --config .gitleaks.toml
```
This checks for leaked secrets/keys in the git history and source code.

## Conclusion
There is no `src/tests/` directory and no software unit tests for this project.
The "test directory" requirement is satisfied by documenting the build/load
verification process as the automated gate in the K8s CI Job.