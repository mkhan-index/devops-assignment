# Architecture Diagrams

This directory contains Python scripts to generate all architecture diagrams from ARCHITECTURE.md.

## Quick Start

### Generate All Diagrams

```powershell
# From the diagrams directory
cd diagrams
python generate_all_diagrams.py

# Or from project root
python diagrams/generate_all_diagrams.py
```

### Generate Individual Diagrams

```powershell
cd diagrams
python 01_high_level_architecture.py
python 02_network_architecture.py
python 03_cicd_pipeline_flow.py
python 04_security_architecture.py
python 05_high_availability_design.py
python 06_gitops_workflow.py
```

## Prerequisites

### 1. Install Graphviz

**Windows:**
```powershell
choco install graphviz
```

**macOS:**
```bash
brew install graphviz
```

**Linux:**
```bash
sudo apt-get install graphviz
```

### 2. Install Python Dependencies

```powershell
# From project root
pip install -r diagram_requirements.txt
```

## Generated Diagrams

### 1. High-Level Architecture
**File:** `01_high_level_architecture.png`

Complete system overview showing:
- Developer workflow
- CI/CD pipeline with GitHub Actions
- AWS VPC with multi-AZ deployment
- EKS cluster with worker nodes and pods
- GitOps deployment with ArgoCD
- IRSA for secure AWS service access
- Auto-scaling and load balancing

### 2. Network Architecture
**File:** `02_network_architecture.png`

VPC network design showing:
- VPC with 10.0.0.0/16 CIDR
- 2 Availability Zones
- Public subnets (10.0.1.0/24, 10.0.2.0/24)
- Private subnets (10.0.10.0/24, 10.0.11.0/24)
- Internet Gateway
- NAT Gateways (one per AZ)
- Route tables and traffic flow

### 3. CI/CD Pipeline Flow
**File:** `03_cicd_pipeline_flow.png`

6-stage pipeline showing:
- Stage 1: Security Scanning (Checkov, Trivy)
- Stage 2: Build & Test (Go build, tests, vet, gosec)
- Stage 3: Build Image (Docker multi-stage build)
- Stage 4: Image Security (Trivy, Grype scans)
- Stage 5: Update Manifest (Kustomize update)
- Stage 6: GitOps Sync (ArgoCD deployment)

### 4. Security Architecture
**File:** `04_security_architecture.png`

Defense-in-depth security layers:
- Network Security (VPC, Security Groups, NACLs)
- Identity & Access (IRSA, OIDC, Service Accounts)
- Data Security (KMS encryption, TLS)
- Application Security (non-root, read-only filesystem)
- Scanning & Monitoring (Checkov, Trivy, Gosec, CloudWatch)

### 5. High Availability Design
**File:** `05_high_availability_design.png`

HA components showing:
- Multi-AZ deployment (2 zones)
- EKS Control Plane (3 nodes, AWS managed)
- Worker Nodes (distributed across AZs)
- Application Pods (3-10 with HPA)
- Node Auto Scaling (2-6 nodes)
- Load Balancing (ALB + K8s Service)

### 6. GitOps Workflow
**File:** `06_gitops_workflow.png`

Sequence diagram showing:
1. Developer pushes code to GitHub
2. GitHub Actions triggers workflow
3. Security scans and tests
4. Build and push Docker image
5. Update Kubernetes manifest
6. ArgoCD detects change
7. ArgoCD syncs to cluster
8. Rolling update deployment

## Customization

### Change Colors

Edit the diagram scripts and modify Edge colors:
```python
Edge(label="Deploy", color="green")
Edge(label="Route", color="purple")
Edge(style="dashed", color="blue")
```

### Adjust Layout

Change diagram direction:
```python
# Top to Bottom
direction="TB"

# Left to Right
direction="LR"
```

### Modify Spacing

Adjust graph attributes:
```python
graph_attr = {
    "fontsize": "14",
    "ranksep": "1.2",  # Vertical spacing
    "nodesep": "0.8"   # Horizontal spacing
}
```

## Troubleshooting

### Error: "graphviz executable not found"

**Solution:** Install Graphviz and add to PATH
```powershell
# Verify installation
dot -V

# Add to PATH (Windows)
# C:\Program Files\Graphviz\bin
```

### Error: "No module named 'diagrams'"

**Solution:** Install Python dependencies
```powershell
pip install diagrams graphviz
```

### Diagrams look cluttered

**Solution:** Increase spacing in graph_attr
```python
graph_attr = {
    "ranksep": "1.5",
    "nodesep": "1.0"
}
```

### Text is too small

**Solution:** Increase font sizes
```python
graph_attr = {"fontsize": "16"}
node_attr = {"fontsize": "14"}
```

## Output Formats

### Generate SVG (Scalable)
```python
with Diagram(..., outformat="svg"):
```

### Generate PDF
```python
with Diagram(..., outformat="pdf"):
```

### Generate DOT (for manual editing)
```python
with Diagram(..., outformat="dot"):
```

## Batch Generation (Windows)

Create a batch file to generate all diagrams:

```batch
@echo off
cd diagrams
python generate_all_diagrams.py
pause
```

## Resources

- [Diagrams Documentation](https://diagrams.mingrammer.com/)
- [Graphviz Documentation](https://graphviz.org/documentation/)
- [AWS Architecture Icons](https://aws.amazon.com/architecture/icons/)

## Notes

- All diagrams are generated as PNG files by default
- Diagrams are saved in the same directory as the scripts
- The `show=False` parameter prevents automatic opening
- Scripts can be run independently or all at once
- Diagrams match the architecture described in ARCHITECTURE.md
