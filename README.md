# terraform_elasticsearch

```bash
GOOGLE_PROJECT=YOUR_PROJECT_ID
GOOGLE_REGION=YOUR_REGION
```

```bash
cat > elasticsearch/variables.tf <<EOF
variable "project" {
  default = "${GOOGLE_PROJECT}"
}
variable "region" {
  default = "${GOOGLE_REGION}"
}
EOF
```
