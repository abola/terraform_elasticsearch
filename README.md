# terraform_elasticsearch

```
cat > variable.tf <<EOF
variable "project" {
  default = "${GOOGLE_PROJECT}"
}
variable "region" {
  default = "${GOOGLE_REGION}"
}
EOF
```
