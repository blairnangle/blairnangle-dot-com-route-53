# blairnangle-dot-com-route-53

Terraform project to provision custom domain name resolution for https://blairnangle.com.

## Prerequisites

* [Terraform](https://github.com/hashicorp/terraform/releases) (tested with 0.12.28)
* [git-secret](https://github.com/sobolevn/git-secret/releases) (tested with 0.3.2)

## Configuration

`~/.aws/credentials` should be formatted:
 
```bash
[personal]
region=eu-west-2
aws_access_key_id=<access_key_id>
aws_secret_access_key=<secret_access_key>
```

### En/decrypting Secrets

Assumes that email address associated with GPG key has been [told](https://git-secret.io/git-secret-tell) about project. 

Decrypt all secret files:

```bash
$ git secret reveal
```

Encrypt a new file:

```bash
$ git secret add a-new.file
```

## Usage

Assuming `credentials` is formatted as above, export profile for `personal` AWS account:

```bash
$ export AWS_PROFILE=personal
```

And execute Terraform commands as normal from the root of the project:

```bash
$ terraform init
```

```bash
$ terraform plan -out plan
```

```bash
$ terraform apply plan
```

## Gotchas

### Name Servers on Registered Domain

If hosted zone is destroyed and reprovisioned, new name server records are associated with the new hosted zone. However,
the domain name (AWS Route 53 is also used as the domain name registrar) still has the previous name server records
associated with it. Head to *Route 53 > Registered domains > blairnangle.com > Add or edit name servers* and add the
newly-associated name server records from the hosted zone to the registered domain.
