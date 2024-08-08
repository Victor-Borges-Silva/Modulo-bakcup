# Data source para buscar a chave KMS gerenciada pela AWS com o alias 'aws/backup'
data "aws_kms_key" "by_key_arn" {
  key_id = "arn:aws:kms:us-west-1:087381958847:key/2cd17e51-8461-4170-b7e7-de4c8524c1d6"
}

# Recurso do Backup Vault
resource "aws_backup_vault" "Teste_cofre_ec2" {
  name          = "Teste_cofre_ec2"
  kms_key_arn   = data.aws_kms_key.by_key_arn.arn
  force_destroy = true
}

# Recurso para aplicar a policy ao Backup Vault
resource "aws_backup_vault_policy" "vault_policy" {
  backup_vault_name = aws_backup_vault.Teste_cofre_ec2.name

  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "backup:CopyIntoBackupVault",
        "Resource": "*",
        "Principal": "*",
        "Condition": {
          "StringEquals": {
            "aws:PrincipalOrgID": [
              "o-mi8ldr93u8"
            ]
          }
        }
      }
    ]
  }
  POLICY
}

#Recuso para criar o plano de Backup e suas regras
resource "aws_backup_plan" "Teste_plano_backup" {
  name = "Teste_plano_backup"

  rule {
    rule_name         = "Teste_plano_backup_ec2"
    target_vault_name = aws_backup_vault.Teste_cofre_ec2.name
    schedule          = "cron(0 12 * * ? *)"

    lifecycle {
      delete_after = 7
    }
  }
}

# Seleção de recursos com base em tags
resource "aws_backup_selection" "example" {
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.Teste_plano_backup.id
  iam_role_arn = aws_iam_role.Teste_role_backup.arn

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Backup"
    value = "true"
  }
}

# Recurso do IAM Role para o plano de backup
resource "aws_iam_role" "Teste_role_backup" {
  name = "Teste_role_backup"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "backup.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  # Anexa a política gerenciada necessária para backup
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup",
    "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
  ]
}