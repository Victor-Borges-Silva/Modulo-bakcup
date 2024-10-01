# Data source para buscar a chave KMS gerenciada pela AWS com o alias 'aws/backup'
data "aws_kms_key" "kms_key_arn" {
  key_id = "arn:aws:kms:us-west-1:087381958847:key/2cd17e51-8461-4170-b7e7-de4c8524c1d6"
}

# Recurso do Backup Vault
resource "aws_backup_vault" "cofre_backup" {
  name          = var.nome_cofre
  kms_key_arn   = data.aws_kms_key.kms_key_arn.arn
  force_destroy = true
}

# Recurso para aplicar a policy ao Backup Vault
resource "aws_backup_vault_policy" "vault_policy" {
  backup_vault_name = aws_backup_vault.cofre_backup.name

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
resource "aws_backup_plan" "plano_backup" {
  name = var.nome_plano_backup

  rule {
    rule_name         = var.nome_regra
    target_vault_name = aws_backup_vault.cofre_backup.name
    schedule          = var.agendamento_backup
    start_window      = 60  #Especifique(em minutos) o período em que o plano de backup será iniciado, caso não comece no horário especificado.
    completion_window = 180 #Defina(em minutos) o período durante o qual o backup deve ser concluído antes de retornar qualquer erro por timeout.

    lifecycle {
      delete_after = var.quantidade_dias_para_delecao
    }
  }
}

# Seleção de recursos com base em tags
resource "aws_backup_selection" "selecao_alvo_tag" {
  name         = var.nome_selecao_alvo_tag
  plan_id      = aws_backup_plan.plano_backup.id
  iam_role_arn = var.iam_role_arn_backup

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Backup"
    value = "true"
  }
}
